package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;
import model.Confirm;
import model.UserEmployee;
import model.UserEmployer;
import DAO.*;

import org.apache.catalina.tribes.ChannelSender;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.taglibs.standard.tag.common.xml.IfTag;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
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

	public ObjectId Login(Account acc,String password) {
		if (acc != null) {

			String _password_ = acc.getPassword();

			String hash_password = DigestUtils.sha256Hex(password);
			if (hash_password.equals(_password_)) {
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
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String url = "/home";
		if (username == null || password == null) {
			RequestDispatcher rd = request.getRequestDispatcher("Login/login.jsp");
			rd.forward(request, response);
			return;
		}
		AccountDAO accountDAO=new AccountDAO(mongo);
		Account acc = accountDAO.getAccountFromUsername(username);
		
		ObjectId account_id = Login(acc,password);
		HttpSession Session = request.getSession();
		
		if (account_id != null) {
			String uuidString=java.util.UUID.randomUUID().toString();//tạo mã UUID để lưu thông tin xác nhận login lên database
			Cookie uuid = new Cookie("UUID", uuidString);
			
			uuid.setMaxAge(60*10); //thời gian lưu cookie
			response.addCookie(uuid);
			
			
			session.setAttribute("acc", acc);//lưu thông tin account vào session
			String status=acc.getStatus();
			if(status.equals("non-active")) {
				request.setAttribute("result", "none");
				url = getServletContext().getContextPath() + "/active";
				response.sendRedirect(url);
				return;
			}
			
			if(acc.getTypeUser().equals("EMPLOYER")) {
				UserEmployerDAO dao=new UserEmployerDAO(mongo);
				UserEmployer userEmployer=dao.findEmployerWithID(account_id);
				session.setAttribute("user", userEmployer);
			}
			else if(acc.getTypeUser().equals("EMPLOYEE")) {
				UserEmployeeDAO dao=new UserEmployeeDAO(mongo);
				UserEmployee userEmployee=dao.findEmployeeWithID(account_id);
				session.setAttribute("user", userEmployee);
			}
			
			
			Confirm confirm=new Confirm(account_id,uuidString);
			
			ConfirmDAO confirmDAO=new ConfirmDAO(mongo);
			if(confirmDAO.Update(confirm))//cập nhật lại mã UUID
			{
				
			}
			url = request.getContextPath() + "/home"; 
			response.sendRedirect(url);
			 

		} else {
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.setAttribute("msg", "Vui lòng kiểm tra lại username hoặc mật khẩu!");
			RequestDispatcher rd=request.getRequestDispatcher("/Login/login.jsp");		
			rd.forward(request, response);
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
