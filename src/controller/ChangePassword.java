package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import model.Account;
import model.Model;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changepw")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public ObjectId Login(String username, String password) {
		Account acc = Model.ACCOUNT.find(Filters.eq("username", username)).first();
		if (acc != null) {

			String _password_ = acc.getPassword();

			String hash_password = DigestUtils.sha256Hex(password);

			// System.out.print(hashed_password +" AND " +_password_ );

			// if (hashed_password.equals(_password_))
			if (hash_password.equals(_password_)) {
				// Đăng nhập thành công
				return acc.getId();
			} else
				return null;
		}
		return null;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String pw_old=request.getParameter("password_old");
		String pw_new=request.getParameter("password_new");
		MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		
		if (username == null || pw_old == null || pw_new==null) {
			RequestDispatcher rd = request.getRequestDispatcher("Login/changepw.jsp");
			rd.forward(request, response);
			return;
		}
		
		ObjectId accountID=Login(username, pw_old);
		String msg="Đổi mật khẩu thất bại";
		if(accountID!=null) {
			String hash_password = DigestUtils.sha256Hex(pw_new);//hash password
			Account.ChangePassword(username, hash_password);
			msg="Đổi mật khẩu thành công";
		}
		else {
			msg="Sai tên đăng nhập hoặc mật khẩu";
		}
		request.setAttribute("msg", msg);
		
		RequestDispatcher rd = request.getRequestDispatcher("Login/changepw.jsp");
		rd.forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
