package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.PostDAO;
import DAO.UserEmployerDAO;
import model.Post;
import model.UserEmployer;

/**
 * Servlet implementation class PostController
 */
@WebServlet("/post")
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		String idpost=request.getParameter("p");
		if(idpost==null) {
			response.sendRedirect("/home");
			return;
		}
		PostDAO postDAO=new PostDAO(mongo);
		Post post=new Post();
		
		ObjectId id=post.getAccountId();
		UserEmployerDAO userEmployerDAO=new UserEmployerDAO(mongo);
		UserEmployer userEmployer=userEmployerDAO.getUserEmployerFromId(id);
		
		request.setAttribute("Author", userEmployer);
		request.setAttribute("Post", post);
		
		
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/Post/post.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
