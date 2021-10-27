package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.*;
import model.UserEmployee;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String typeUser=request.getParameter("action"); //get thông tin 
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
			
		if (username==null||password==null||email==null||fullName==null) //nếu trống thì chuyển hướng đến trang đăng ký
		{
			request.getRequestDispatcher("Login/signup.jsp").forward(request, response);
			return;
		}
		AccountDAO accountDAO=new AccountDAO(mongo);
		String hash_password = DigestUtils.sha256Hex(password);//hash password
		Account account=new Account(username, hash_password, email, typeUser);//tạo tài khoản
		accountDAO.Insert(account);//thêm tài khoản vào database
		
		//tạo tài khoản phân quyền
		if(typeUser.equals("EMPLOYEE")) {
			UserEmployeeDAO userDAO=new UserEmployeeDAO(mongo);
			UserEmployee employee=new UserEmployee(account.getId(),fullName,"","",new Date());
			userDAO.Insert(employee);
		}
		else {
			if (typeUser.equals("EMPLOYER")) {
				UserEmployerDAO userDAO=new UserEmployerDAO(mongo);
				UserEmployer employer=new UserEmployer(account.getId(),fullName,"","",email);
				userDAO.Insert(employer);
			}
		}
		
		String url = request.getContextPath() + "/login";//chuyển đến trang login 
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
