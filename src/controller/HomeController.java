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
import model.Paging;
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

			if (id != null) {
				if (session.getAttribute("acc") == null || session.getAttribute("user") == null) {
					Account acc = accountDAO.getAccountFromAccountId(id);
					Object user = session.getAttribute("user");
					session.setAttribute("acc", acc);
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
		int currPage;
		if (currentPage == null) {
			currentPage = "1";
			currPage = 1;
		} else
			currPage = Integer.parseInt(currentPage);
		int begin = 4 * currPage - 4;
		ArrayList<Post> listPost = postDAO.GetListPost(begin, 4);
		request.setAttribute("posts", listPost);
		if (listPost == null) {
			System.out.println("Không có listpost");
		}
		int totalPost = postDAO.Count();
		int totalPage = totalPost / 3 + ((totalPost % 3 != 0) ? 1 : 0);
		ArrayList<Paging> pageList = new ArrayList<Paging>();
		int max = 5;
		pageList.add(new Paging(currentPage, currPage, "page-item active"));
		for (int i = 1; i <= max; i++) {
			if (currPage + i <= totalPage)
				pageList.add(new Paging(String.valueOf(currPage + i), currPage + i, "page-item"));
			if (currPage - i >= 1)
				pageList.add(0, new Paging(String.valueOf(currPage - i), currPage - i, "page-item"));

		}
		if (currPage != 1)
			pageList.add(0, new Paging("Previous", currPage - 1, "page-item"));
		if (currPage != totalPage)
			pageList.add(new Paging("Next", currPage + 1, "page-item"));

		request.setAttribute("pageList", pageList);
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
