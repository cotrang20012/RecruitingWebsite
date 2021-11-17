package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
@WebServlet("/dashboard/list-apply")
public class ListApply extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ListApply() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.setAttribute("totalPage", 5);
		RequestDispatcher rd = request.getRequestDispatcher("Dashboard/dashboard_listpost_employee.jsp");
		rd.forward(request, response);
	}
	/*
	 * private void process(HttpServletRequest req, HttpServletResponse resp) {
	 * ArrayList<Post> postList; MongoClient
	 * mongo=(MongoClient)req.getServletContext().getAttribute("MONGODB_CLIENT");
	 * PostDAO dao = new PostDAO(mongo); if (req.getParameter("page") == null) {
	 * postList = dao.GetListPost(0, limit-1); req.setAttribute("page", 1); skip =
	 * limit; } else { postList = dao.GetListPost(skip, limit); } }
	 */
	/*
	 * protected void processRequest(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException {
	 * response.setContentType("text/html;charset = UTF-8"); String indexPage =
	 * request.getParameter("index"); int index = Integer.parseInt(indexPage);
	 * MongoClient
	 * mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT")
	 * ; PostDAO dao = new PostDAO(mongo); List<Post> list =
	 * dao.GetListPost(index*3-2, index*3);
	 * 
	 * 
	 * request.setAttribute("listPost", list);
	 * request.getRequestDispatcher("home.jsp").forward(request, response); }
	 */
	/*
	 * @Override protected void doGet(HttpServletRequest req, HttpServletResponse
	 * resp) throws ServletException, IOException { // TODO Auto-generated method
	 * stub resp.setContentType("text/html"); resp.setCharacterEncoding("UTF-8");
	 * req.setCharacterEncoding("UTF-8"); MongoClient
	 * mongo=(MongoClient)req.getServletContext().getAttribute("MONGODB_CLIENT");
	 * PostDAO dao = new PostDAO(mongo); HttpSession session = req.getSession();
	 * session.setAttribute("totalPage", 5); RequestDispatcher rd =
	 * req.getRequestDispatcher("Dashboard/dashboard_listpost_employee.jsp");
	 * rd.forward(req, resp); }
	 */
}
