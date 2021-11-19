package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import DAO.AccountDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Model;
import model.UserEmployee;
import model.UserEmployer;


/**
 * Servlet implementation class viewProfileController
 */
@WebServlet("/viewprofile")
public class viewProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public viewProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)request.getParameter("user");
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		AccountDAO accountDAO = new AccountDAO(mongo);
		UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);
		UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
		Account acc = accountDAO.getAccountFromUsername(username);
		String type_user = acc.getTypeUser();
		String urlString = "/home.jsp";
		if (type_user.equals("EMPLOYEE")) {
			UserEmployee userEmployee = userEmployeeDAO.findEmployeeWithID(acc.getId());
			SimpleDateFormat tempFormat = new SimpleDateFormat("dd/MM/yyyy");
			String tempFormatString = tempFormat.format(userEmployee.getBirthday());
			try {
				userEmployee.setBirthday(tempFormat.parse(tempFormatString));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("userProfile", userEmployee);
			urlString = "/Profile/viewProfileEmployee.jsp";
		} else if (type_user.equals("EMPLOYER")) {
			UserEmployer userEmployer = userEmployerDAO.findEmployerWithID(acc.getId());
			request.setAttribute("userProfile", userEmployer);
			urlString = "/Profile/viewProfileEmployer.jsp";
		}
			
		RequestDispatcher rd = request.getRequestDispatcher(urlString);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
