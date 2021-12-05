package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.naming.java.javaURLContextFactory;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.PostDAO;
import model.Account;
import model.Post;

/**
 * Servlet implementation class CreatePostController
 */
@WebServlet(name = "createpost", urlPatterns = { "/dashboard/createpost" })
public class CreatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePostController() {
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
		request.getRequestDispatcher("/Dashboard/CreatePost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		Post post = new Post();
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO postDAO=new PostDAO(mongo);
		post.setUrl(webfit.Utilities.createURL(request.getParameter("title")));
		post.setAccountId(account.getId());
		post.setTitle(request.getParameter("title"));
		post.setPhone(request.getParameter("phone"));
		post.setEmail(request.getParameter("email"));
		post.setPosition(request.getParameter("pos"));
		post.setLocation(request.getParameter("location"));
		post.setQuantity(request.getParameter("quantity"));
		post.setStatus("Active");
		post.setExp(request.getParameter("exp"));
		post.setDateStart(java.util.Calendar.getInstance().getTime());
		post.setContent(request.getParameter("desc"));
		try {
			SimpleDateFormat format= new SimpleDateFormat("dd MMMM yyyy hh:mm");
			post.setDateEnd(format.parse(request.getParameter("date")));
			System.out.print(request.getParameter("time"));
			String[] liStrings = request.getParameterValues("skill");
			String temp ="";
			for (String itemString : liStrings)
				temp += itemString + ",";
			post.setSkill(temp.substring(0,temp.length()-1));
		} catch (Exception e) {
			// TODO: handle exception
		}
		postDAO.Insert(post);
		response.sendRedirect("/post?b="+post.getUrl());
	}

}
