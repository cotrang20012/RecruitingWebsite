package controller;

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

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession Session = 	request.getSession();
		Account acc = (Account) Session.getAttribute("user");
		UserEmployee userEmployee = Model.USEREMPLOYEE.find(Filters.eq("accountID", acc.getId())).first();
		SimpleDateFormat tempFormat = new SimpleDateFormat("dd/MM/yyyy");
		String tempFormatString = tempFormat.format(userEmployee.getBirthday());
		try {
			userEmployee.setBirthday(tempFormat.parse(tempFormatString));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		request.setAttribute("userProfile", userEmployee);
		RequestDispatcher rd=request.getRequestDispatcher("/Profile/profile.jsp");		
		rd.forward(request, response);
	}

}
