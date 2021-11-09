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
				request.setAttribute("is_logged", "false");
			} else {
				Boolean is_logged = (Boolean) session.getAttribute("is_logged");
				if (is_logged == null) {
					is_logged = accountDAO.isLogged(Cookies);
				}
				//
				if (!is_logged) {
					session.setAttribute("is_logged", "false");
				} else {
					Account acc = accountDAO.getAccountFromAccountId(id);
					session.setAttribute("is_logged", "true");
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
		ArrayList<Post> listPost = postDAO.GetListPost(0, 5);

		if (listPost == null) {
			System.out.println("Không có listpost");
		}

		request.setAttribute("posts", listPost);

		RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
