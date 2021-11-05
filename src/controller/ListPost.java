package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.client.MongoClient;

import DAO.PostDAO;
import model.*;
/**
 * Servlet implementation class ListPost
 */
@WebServlet(name = "ListPost",urlPatterns = {"/ListPost"})
public class ListPost extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	/*protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}*/

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset = UTF-8");
		String indexPage = request.getParameter("index");
		int index = Integer.parseInt(indexPage);
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO dao = new PostDAO(mongo);
		List<Post> list = dao.GetListPost(index*3-2, index*3);
		
		
		request.setAttribute("listPost", list);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
}
