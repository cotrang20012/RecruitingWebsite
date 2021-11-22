package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.client.MongoClient;

import DAO.ApplyDAO;
import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.*;

/**
 * Servlet implementation class ListPost
 */
@WebServlet("/dashboard/list-post")
public class ListPostController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public ListPostController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession Session = request.getSession();
		Account acc = (Account) Session.getAttribute("acc");
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
		UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);
		String type_user = acc.getTypeUser();
		String urlString="";
		if (type_user.equals("EMPLOYEE")) {
			UserEmployee userEmployee = userEmployeeDAO.findEmployeeWithID(acc.getId());
			ArrayList<Apply> applies = new ArrayList<Apply>();
			ApplyDAO applyDAO = new ApplyDAO(mongo);
			applies = applyDAO.GetApplyList(acc.getId());
			request.setAttribute("apply", applies);
			urlString = "/Dashboard/dashboard_listpost_employee.jsp";
		} else if (type_user.equals("EMPLOYER")) {
			UserEmployer userEmployer = userEmployerDAO.findEmployerWithID(acc.getId());
			request.setAttribute("posts", userEmployer);
			urlString = "/Dashboard/dashboard_listpost.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(urlString);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
