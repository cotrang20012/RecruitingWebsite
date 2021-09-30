package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import model.Account;
import model.Model;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.model.Filters;
import com.mongodb.session.SessionContext;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ObjectId Login(String username, String password) {
		Account acc = Model.ACCOUNT.find(Filters.eq("username", username)).first();
		if (acc != null) {

			String _password_ = acc.getPassword();

			// String hashed_password = DigestUtils.sha256Hex(password);

			// System.out.print(hashed_password +" AND " +_password_ );

			// if (hashed_password.equals(_password_))
			if (password.equals(_password_)) {
				// Đăng nhập thành công
				return acc.getId();
			} else
				return null;
		}
		return null;
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, NoSuchAlgorithmException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String url = "/home";
		if (username == null || password == null) {
			RequestDispatcher rd = request.getRequestDispatcher("Login/login.jsp");
			rd.forward(request, response);
			/*
			 * url= request.getContextPath() + "/Login/login.jsp";
			 * response.sendRedirect(url);
			 */
			return;
		}

		ObjectId account_id = Login(username, password);
		HttpSession Session = request.getSession();

		if (account_id != null) {
			Cookie cookieID = new Cookie("accountID", account_id.toHexString());
			cookieID.setMaxAge(3600*2); //thời gian lưu cookie
			
			Cookie logged = new Cookie("is_logged", "true");
			cookieID.setMaxAge(3600*2); //thời gian lưu cookie
			
			response.addCookie(cookieID);
			response.addCookie(logged);
			request.setAttribute("is_logged", true);
			Account acc = Model.ACCOUNT.find(Filters.eq("username", username)).first();
			session.setAttribute("account", acc);
//			RequestDispatcher rd = request.getRequestDispatcher("/home");
//			rd.forward(request, response);

			
			url = request.getContextPath() + "/home"; 
			response.sendRedirect(url);
			 

		} else {
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			url = request.getContextPath() + "/login";
			response.sendRedirect(url);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {

			process(request, response);
		} catch (NoSuchAlgorithmException | ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
