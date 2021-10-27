package controller;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import DAO.AccountDAO;
import model.Model;
import model.Account;

@WebServlet(name="home",urlPatterns= {"/home"})
public class HomeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6700670231826404756L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie[] Cookies=request.getCookies();
		HttpSession session = request.getSession();
		MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		
		if(Cookies != null) {
			AccountDAO accountDAO=new AccountDAO(mongoClient);
			ObjectId id=accountDAO.getAccountIdFromCookie(Cookies);
			Boolean is_logged=accountDAO.isLogged(Cookies);
			
			if(id==null) {
				request.setAttribute("is_logged", "false");
			}
			else {
				if(!is_logged) {
					request.setAttribute("is_logged", "false");
				}
				else {
					Account acc=accountDAO.getAccountFromAccountId(id);
					request.setAttribute("is_logged", "true");
					session.setAttribute("user",acc);
				}
			}
			
		}
				
		RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");		
		
		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	
}
