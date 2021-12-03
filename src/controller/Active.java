package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.ClassPathUtils;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import Util.EmailUtility;
import model.Account;

/**
 * Servlet implementation class SendMail
 */
@WebServlet("/active")
public class Active extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;

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
		String url = "/home";
		String action = request.getParameter("action");
		HttpSession Session = request.getSession();
		if(action==null) {
			Account account = (Account) Session.getAttribute("acc");
			if(account==null) {
				getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
			}
			else {
				getServletContext().getRequestDispatcher("/Login/active.jsp").forward(request, response);
			}
			return;
		}
		
		if (action.equals("send")) {
			String resultMessage = "";
			Account account = (Account) Session.getAttribute("acc");
			if (account != null) {
				try {
					String id = account.getId().toHexString().substring(10);
					String email=account.getEmail();
					String activeString = DigestUtils.sha256Hex(id);
					String urlString = request.getScheme() + "://"+request.getServerName() + "/active?action=active&"
							+ "email="+email+"&code="
							+ activeString;
					EmailUtility.sendEmail(host, port, user, pass, "tranbaoduy4@gmail.com", "Kích hoạt tài khoản",
							urlString);
					resultMessage = "The e-mail was sent successfully";
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "There were an error: " + ex.getMessage();
				} finally {
					request.setAttribute("Message", resultMessage);
					getServletContext().getRequestDispatcher("/Login/active.jsp").forward(request, response);
				}
			}
			else {
				url = getServletContext().getContextPath() + "/home";
				response.sendRedirect(url);
			}

		}
		else {
			if(action.equals("active")) {
				String email=request.getParameter("email");
				String code=request.getParameter("code");
				MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
				AccountDAO accountDAO=new AccountDAO(mongoClient);
				String id=accountDAO.getAccountIdFromEmail(email).toHexString().substring(10);
				String activeString = DigestUtils.sha256Hex(id);
				if(code.equals(activeString)) {
					accountDAO.Active(email);
					request.setAttribute("result", "active");
				}
				else {
					request.setAttribute("result", "non-active");
				}
				getServletContext().getRequestDispatcher("/Login/active.jsp").forward(request, response);
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
