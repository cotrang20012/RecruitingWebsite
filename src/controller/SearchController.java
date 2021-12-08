package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Paging;
import model.Post;
import model.UserEmployee;
import model.UserEmployer;

@WebServlet("/search")
public class SearchController extends HttpServlet {

	/**
	 * 
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MongoClient mongoClient = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");


		PostDAO postDAO = new PostDAO(mongoClient);
		
		
		String query=request.getParameter("query");
		if(query==null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		ArrayList<Post> listPost = postDAO.search(query);
		request.setAttribute("postSearch", listPost);
		if (listPost == null) {
			System.out.println("Không có listpost");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");

		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
