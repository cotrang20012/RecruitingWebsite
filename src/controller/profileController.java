package controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Model;
import model.UserEmployee;
import model.UserEmployer;

/**
 * Servlet implementation class profileController
 */
@WebServlet("/profile")
public class profileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public profileController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if (action == null) {
			action = "view";
		}
		
		if (action.equals("view")) {
			HttpSession Session = request.getSession();
			Account acc = (Account) Session.getAttribute("acc");
			MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
			UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
			UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);

			String urlString = "/home.jsp";
			if (acc == null) {
				urlString = "/home.jsp";
			} else {
				String type_user = acc.getTypeUser();
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
					urlString = "/Profile/profileEmployee.jsp";
				} else if (type_user.equals("EMPLOYER")) {
					UserEmployer userEmployer = userEmployerDAO.findEmployerWithID(acc.getId());
					request.setAttribute("userProfile", userEmployer);
					urlString = "/Profile/profileEmployer.jsp";
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher(urlString);
			rd.forward(request, response);
		}
		if(action.equals("update")) {
			HttpSession Session = request.getSession();
			Account acc = (Account) Session.getAttribute("user");
			MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
			UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
			UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);
			
			String urlString = "/home.jsp";
			if (acc == null) {
				urlString = "/home.jsp";
			} else {
				String type_user = acc.getTypeUser();
				if (type_user.equals("EMPLOYEE")) {
					UserEmployee userEmployee = userEmployeeDAO.findEmployeeWithID(acc.getId());
					
					userEmployee.setFullName(request.getParameter("username"));
					userEmployee.setAddress(request.getParameter("address"));
					userEmployee.setPhone(request.getParameter("phone"));
					userEmployee.setEmail(request.getParameter("email"));
					
					Date date1 = new Date();
					try {
						date1 = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("birthday"));
					} catch (ParseException e1) {
						e1.printStackTrace();
					}  
					userEmployee.setBirthday(date1);
					
					userEmployeeDAO.UpdateUserEmployee(userEmployee);
					
					SimpleDateFormat tempFormat = new SimpleDateFormat("dd/MM/yyyy");
					String tempFormatString = tempFormat.format(userEmployee.getBirthday());
					try {
						userEmployee.setBirthday(tempFormat.parse(tempFormatString));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					request.setAttribute("userProfile", userEmployee);
					urlString = "/Profile/profileEmployee.jsp";
				} else if (type_user.equals("EMPLOYER")) {
					UserEmployer userEmployer = userEmployerDAO.findEmployerWithID(acc.getId());
					
					userEmployer.setAddress(request.getParameter("address"));
					userEmployer.setCompanyName(request.getParameter("companyname"));
					userEmployer.setPhone(request.getParameter("phone"));
					userEmployer.setEmail(request.getParameter("email"));
					
					userEmployerDAO.UpdateUserEmployer(userEmployer);
			
					request.setAttribute("userProfile", userEmployer);
					urlString = "/Profile/profileEmployer.jsp";
				}
			}
			RequestDispatcher rd = request.getRequestDispatcher(urlString);
			rd.forward(request, response);
		}
	}
}
