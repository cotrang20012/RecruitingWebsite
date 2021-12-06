package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.PostDAO;

/**
 * Servlet implementation class DeactivePostController
 */
@WebServlet("/adminpostdeactivate")
public class DeactivePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeactivePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String postID = (String) request.getParameter("id");
		ObjectId id = new ObjectId(postID);
		String urlString = "/Admin/manager-post.jsp";
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO postDAO = new PostDAO(mongo);
		postDAO.updatePostStatusDeAct(id);
		response.sendRedirect(request.getContextPath()+"/admin/ManagerPost");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
