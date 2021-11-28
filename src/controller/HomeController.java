package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;
import com.opensymphony.module.sitemesh.Page;

import DAO.AccountDAO;
import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Post;
import model.UserEmployee;
import model.UserEmployer;

@WebServlet(name = "home", urlPatterns = { "/home" })
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6700670231826404756L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cookie[] Cookies = request.getCookies();
		HttpSession session = request.getSession();
		MongoClient mongoClient = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");

		if (Cookies != null) {
			AccountDAO accountDAO = new AccountDAO(mongoClient);
			ObjectId id = accountDAO.getAccountIdFromCookie(Cookies);

			if (id == null) {
				request.setAttribute("is_logged", false);
			} else {
				boolean is_logged = false;
				if (session.getAttribute("is_logged") == null) {
					is_logged = accountDAO.isLogged(Cookies);
				} else {
					is_logged = (boolean) session.getAttribute("is_logged");
				}

				if (!is_logged) {
					session.setAttribute("is_logged", false);
				} else {
					Account acc = accountDAO.getAccountFromAccountId(id);
					session.setAttribute("is_logged", true);
					Object user = session.getAttribute("user");
					if (user != null)
						if (acc.getTypeUser().equals("EMPLOYER")) {
							UserEmployerDAO dao = new UserEmployerDAO(mongoClient);
							UserEmployer userEmployer = dao.findEmployerWithID(id);
							session.setAttribute("user", userEmployer);
						} else if (acc.getTypeUser().equals("EMPLOYEE")) {
							UserEmployeeDAO dao = new UserEmployeeDAO(mongoClient);
							UserEmployee userEmployee = dao.findEmployeeWithID(id);
							session.setAttribute("user", userEmployee);
						}
				}
			}

		}

		PostDAO postDAO = new PostDAO(mongoClient);

		String currentPage = request.getParameter("page");
		int page;
		if (currentPage == null)
			page = 1;
		else
			page = Integer.parseInt(currentPage);
		int end = 4 * page - 1;
		int begin = end - 3;
		ArrayList<Post> listPost = postDAO.GetListPost(begin, end);
		if (listPost == null) {
			System.out.println("Không có listpost");
		}
		int totalPost = postDAO.Count();
		int totalPage = totalPost/3 + ((totalPost%3 !=0)? 1:0);
		request.setAttribute("posts", listPost);
		int left = 0, mid = 0, right = 0;
		String urlL,urlM,urlR;
		String stateL, stateM, stateR;
		if (page == 1) {
			left = 1;
			mid = 2;
			right = 3;
			stateL = "page-item active";
			stateM = "page-item";
			stateR = "page-item";
			urlL = "";
			urlM = "/home?page=2";
			urlR = "/home?page=3";
		} else if (page == totalPage) { 
			right = page;
			mid = page - 1;
			left = page - 2;
			stateL = "page-item";
			stateM = "page-item";
			stateR = "page-item active";
			urlL = "/home?page="+ String.valueOf(left);
			urlM = "/home?page="+ String.valueOf(mid);
			urlR = "";
		} else {
			left = page-1;
			mid = page;
			right = page+1;
			stateL = "page-item";
			stateM = "page-item active";
			stateR = "page-item";
			urlL = "/home?page="+ String.valueOf(left);
			urlM = "";
			urlR = "/home?page="+ String.valueOf(right);
		}
		request.setAttribute("left", left);
		request.setAttribute("mid", mid);
		request.setAttribute("right", right);
		request.setAttribute("stateL", stateL);
		request.setAttribute("stateM", stateM);
		request.setAttribute("stateR", stateR);
		request.setAttribute("urlL", urlL);
		request.setAttribute("urlM", urlM);
		request.setAttribute("urlR", urlR);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("path", "/com.webfit");
		RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
