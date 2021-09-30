package controller;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import com.mongodb.client.model.Filters;

import model.Model;
import model.Account;

@WebServlet("/home")
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6700670231826404756L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie[] Cookies=request.getCookies();
		if(Cookies != null) {
			ObjectId id=Account.getAccountIdFromCookie(Cookies);
			Boolean is_logged=Account.isLogged(Cookies);
			
			if(id==null) {
				request.setAttribute("is_logged", "true");
			}
			else {
				if(!is_logged) {
					request.setAttribute("is_logged", "true");
				}
				else {
					Account acc=Model.ACCOUNT.find(Filters.eq("_id", id)).first();
					request.setAttribute("user",acc );
				}
			}
			
		}
				
		RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");		
		
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	
}
