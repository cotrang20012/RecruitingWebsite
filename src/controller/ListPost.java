package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	private static int skip = 0;
    int limit = 3;
	private void process(HttpServletRequest req, HttpServletResponse resp) {
		ArrayList<Post> postList;
		MongoClient mongo=(MongoClient)req.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO dao = new PostDAO(mongo);
		if (req.getParameter("page") ==  null) {
			postList = dao.GetListPost(0, limit-1);
			req.setAttribute("page", 1);
			skip = limit;
		}
		else {
			postList = dao.GetListPost(skip, limit);
		}
	}
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
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		process(req,resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
}
