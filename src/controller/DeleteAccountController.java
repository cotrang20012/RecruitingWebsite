package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import DAO.ApplyDAO;
import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Post;
import model.UserEmployee;
import model.UserEmployer;

/**
 * Servlet implementation class DeleteAccountController
 */
@WebServlet("/DeleteAccountController")
public class DeleteAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String)request.getParameter("user");
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		AccountDAO accountDAO = new AccountDAO(mongo);
		PostDAO postDAO = new PostDAO(mongo);
		ApplyDAO applyDAO = new ApplyDAO(mongo);
		Account acc = accountDAO.getAccountFromUsername(username);
		UserEmployeeDAO employeeDAO = new UserEmployeeDAO(mongo);
		UserEmployerDAO employerDAO = new UserEmployerDAO(mongo);
		String type_user = acc.getTypeUser();
		String urlString = "/home.jsp";
		if (type_user.equals("EMPLOYEE")) {
			applyDAO.DeleteAllApplyWithPostID(acc.getId());
			employeeDAO.DeleteUserWithAccID(acc.getId());
			accountDAO.DeleteAccountWitd(acc.getId());
			urlString = "/Admin/manager-account.jsp";
		} else if (type_user.equals("EMPLOYER")) {	
			ArrayList<Post> listPosts = postDAO.GetPostListWithAccID(acc.getId());
			for(Post post : listPosts) {
				applyDAO.DeleteAllApplyWithPostID(post.getid());
			}
			postDAO.DeleteAllPostWithAccID(acc.getId());
			employerDAO.DeleteUserWithAccID(acc.getId());
			accountDAO.DeleteAccountWitd(acc.getId());
			urlString = "/Admin/manager-account.jsp";
		}
			
		RequestDispatcher rd = request.getRequestDispatcher(urlString);
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
