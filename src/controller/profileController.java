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

import com.mongodb.client.model.Filters;

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
		// TODO Auto-generated method stub
		HttpSession Session = request.getSession();
		Account acc = (Account) Session.getAttribute("user");

		String urlString = "/home.jsp";
		if (acc == null) {
			urlString ="/home.jsp";
		} else {
			String type_user = acc.getTypeUser();
			if (type_user.equals("EMPLOYEE")) {
				UserEmployee userEmployee = Model.USEREMPLOYEE.find(Filters.eq("accountID", acc.getId())).first();
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
				UserEmployer userEmployer = Model.USEREMPLOYER.find(Filters.eq("accountID", acc.getId())).first();
				request.setAttribute("userProfile", userEmployer);
				urlString = "/Profile/profileEmployer.jsp";
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(urlString);
		rd.forward(request, response);
	}
}
