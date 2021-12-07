package controller;
import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.codec.digest.DigestUtils;


import com.mongodb.client.MongoClient;


import DAO.AccountDAO;
import Util.EmailUtility;
import model.Account;


/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/forgotpw")
public class ForgotPassword extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;
	
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static SecureRandom rnd = new SecureRandom();

    public String randomString(int len) {
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(AB.charAt(rnd.nextInt(AB.length())));
        }
        return sb.toString();
    }
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		AccountDAO accountDAO = new AccountDAO(mongoClient);
		String userEmailString= request.getParameter("email");
		String url = "/home";
		String action = request.getParameter("action");
		
		if(action==null) {
				getServletContext().getRequestDispatcher("/Login/forgotpw.jsp").forward(request, response);
				return;
		}
		if (action.equals("send")) {
			String resultMessage = "";
			Account account = accountDAO.getAccountFromEmail(userEmailString);
			if (account != null) {
				try {
					String username = accountDAO.getUsernameByEmail(userEmailString);
					String msg = randomString(6);
					String hash_password = DigestUtils.sha256Hex(msg);//hash password
					accountDAO.ChangePassword(username, hash_password);
					String urlString = "Dear "+username +",\n" +"your new password is: "+msg;
					EmailUtility.sendEmail(host, port, user, pass, account.getEmail(), "Quen mat khau", urlString);
					resultMessage = "The e-mail was sent successfully";
				} 
					catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "Hệ thống email đang gặp trục trặc. Thử lại sau hoặc liên hệ quản trị viên để đổi mật khẩu";
					request.setAttribute("result", "error");
				} 
					finally {
					request.setAttribute("Message", resultMessage);
					getServletContext().getRequestDispatcher("/Login/forgotpw.jsp").forward(request, response);
				}
			}
			else {
				url = getServletContext().getContextPath() + "/home";
				response.sendRedirect(url);
			}

		}
		else {
			if(action.equals("forgotPassword")) {
				String email=request.getParameter("email");
				String code=request.getParameter("code");
				String id=accountDAO.getAccountIdFromEmail(email).toHexString().substring(10);
				String activeString = DigestUtils.sha256Hex(id);
				if(code.equals(activeString)) {
				}
				else {
				}
				getServletContext().getRequestDispatcher("/Login/changePassword.jsp").forward(request, response);
			}
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
