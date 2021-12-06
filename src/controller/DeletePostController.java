package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.ApplyDAO;
import DAO.PostDAO;

/**
 * Servlet implementation class DeletePostController
 */
@WebServlet(name = "postdelete", urlPatterns = { "/adminpostdelete", "/employer/postdelete" })
public class DeletePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeletePostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stubString username =
		// (String)request.getParameter("user");
		try {
			String postID = (String) request.getParameter("id");
			ObjectId id = new ObjectId(postID);
			MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
			PostDAO postDAO = new PostDAO(mongo);
			ApplyDAO applyDAO = new ApplyDAO(mongo);
			postDAO.Delete(id);
			applyDAO.DeleteAllApplyWithPostID(id);
			response.sendRedirect(request.getHeader("referer"));
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect(request.getHeader("referer"));
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
