package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Account;

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
		String typeUser="EMPLOYEE"; //gán tạm
		if (username==null||password==null||email==null||fullName==null) {
			request.getRequestDispatcher("Login/signup.jsp").forward(request, response);
			return;
		}
		Account account=new Account(username, password, email, typeUser);
		account.Insert();
		String url = request.getContextPath() + "/login"; 
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
