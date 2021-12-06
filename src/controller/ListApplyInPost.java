package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.ApplyDAO;
import DAO.PostDAO;
import model.Account;
import model.Apply;
import model.Post;
import model.UserEmployee;

/**
 * Servlet implementation class ListApplyInPost
 */
@WebServlet("/employer/list-apply-post")
public class ListApplyInPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListApplyInPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		
		/*
		 * Account account=(Account)session.getAttribute("acc"); if(account==null) {
		 * response.sendRedirect(request.getContextPath()+"/login"); return; }
		 */
		
		String postUrl=request.getParameter("post_url");
		MongoClient mongoClient = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO postDAO=new PostDAO(mongoClient);
		Post post=postDAO.GetPostByURL(postUrl);
		
		if(post==null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		ObjectId postId= post.getId();
		ApplyDAO applyDAO=new ApplyDAO(mongoClient);
		ArrayList<UserEmployee> listEM=applyDAO.getListEmployeeFromPostID(postId);
		System.out.println(listEM.size());
		request.setAttribute("ListEmployee", listEM);
		request.setAttribute("Post", post);
		
		RequestDispatcher rd = request.getRequestDispatcher("/Dashboard/List_apply.jsp");

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
