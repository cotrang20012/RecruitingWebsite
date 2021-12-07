package controller;
import java.io.IOException;
import java.security.SecureRandom;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.ChannelSender;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import DAO.AccountDAO;
import Util.EmailUtility;
import model.Account;
import model.Model;

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
	AccountDAO accountDAO = new AccountDAO();
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
		String userEmailString= request.getParameter("email");
		String url = "/home";
		String action = request.getParameter("action");
		HttpSession Session = request.getSession();
		if(action==null) {
				getServletContext().getRequestDispatcher("/Login/forgotpw.jsp").forward(request, response);
				return;
			}
		
		if (action.equals("send")) {
			String resultMessage = "";
			Account account = accountDAO.getAccountFromEmail(userEmailString);
			if (account != null) {
				try {
					
					String id = account.getId().toHexString().substring(10);
					String username = accountDAO.getUsernameByEmail(userEmailString);
					String email=account.getEmail();
					String activeString = DigestUtils.sha256Hex(id);
					String msg = randomString(6);
					String hash_password = DigestUtils.sha256Hex(msg);//hash password
					accountDAO.ChangePassword(username, hash_password);
					String urlString = "<table style=\"height: 108px;\" border=\"1\" width=\"487\">\n"
			                + "<tbody>\n"
			                + "<tr>\n"
			                + "<td style=\"text-align: center;\" colspan=\"2\">\n"
			                + "<h1><span style=\"color: #ff0000;\"><a title=\"Click v&agrave;o đ&acirc;y để trở về trang ch&iacute;nh\" href=\"http://http://tuyendung.herokuapp.com/\">http://giai-ma.blogspot.com/</a></span></h1>\n"
			                + "</td>\n"
			                + "</tr>\n"
			                + "<tr>\n"
			                + "<td style=\"text-align: center;\" colspan=\"2\">\n"
			                + "<h1><span style=\"color: #ff0000;\">Ch&uacute;c mừng bạn đ&atilde; c&oacute; mật khẩu mới</span></h1>\n"
			                + "</td>\n"
			                + "</tr>\n"
			                + "<tr>\n"
			                + "<td style=\"text-align: center;\" colspan=\"2\">\n"
			                + "<h3 style=\"text-align: left;\">Ch&uacute;ng t&ocirc;i đ&atilde; thay đổi mật khẩu của bạn c&aacute;ch đ&acirc;y v&agrave;i ph&uacute;t. Ch&uacute;ng t&ocirc;i đ&atilde; nhận được y&ecirc;u cầu từ&nbsp;bạn.</h3>\n"
			                + "<h3 style=\"text-align: left;\">Ch&uacute;ng t&ocirc;i khuy&ecirc;n bạn h&atilde;y đổi mật khẩu ngay khi c&oacute; thể để tr&aacute;nh qu&ecirc;n lần nữa. Trong trường hợp c&oacute; dấu hiệu spam ch&uacute;ng t&ocirc;i sẽ kh&oacute;a t&agrave;i khoản của bạn&nbsp;</h3>\n"
			                + "</td>\n"
			                + "</tr>\n"
			                + "<tr>\n"
			                + "<td style=\"text-align: center;\" colspan=\"2\">\n"
			                + "<h2>&nbsp;&nbsp;Mật khẩu mới của bạn l&agrave;:&nbsp;<span style=\"text-decoration: underline; color: #3366ff;\">" + msg + "</span></h2>\n"
			                + "</td>\n"
			                + "</tr>\n"
			                + "<tr>\n"
			                + "<td style=\"text-align: center;\" colspan=\"2\">\n"
			                + "<h2><span style=\"color: #ff0000;\">Cảm ơn bạn đ&atilde; xem thư n&agrave;y!</span><img src=\"https://lh4.googleusercontent.com/proxy/tfkQ53gpD3wFwSVgTY6FcCH2MVBhyJp-rKUsY0w4S0MoHGW9cPj6AP1hJMq5cVSRE9IUO8UfLxBG2YvW6Q=s0-d\" alt=\"giai-ma.com\" width=\"460\" height=\"306\" /></h2>\n"
			                + "</td>\n"
			                + "</tr>\n"
			                + "</tbody>\n"
			                + "</table>";
					EmailUtility.sendEmail(host, port, user, pass, account.getEmail(), "Quên mật khẩu", "Mật khẩu mới: "+pass+"\n Click vào đây để đổi mật khẩu"+urlString);
					resultMessage = "The e-mail was sent successfully";
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "Hệ thống email đang gặp trục trặc. Thử lại sau hoặc liên hệ quản trị viên để đổi mật khẩu";
					request.setAttribute("result", "error");
				} finally {
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
				MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
				AccountDAO accountDAO=new AccountDAO(mongoClient);
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
