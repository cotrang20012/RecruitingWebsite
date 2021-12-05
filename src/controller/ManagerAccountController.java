package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import DAO.ApplyDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Apply;
import model.UserEmployee;
import model.UserEmployer;

/**
 * Servlet implementation class ManagerAccountController
 */
@WebServlet("/ManagerAccount")
public class ManagerAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		System.out.println("Run");
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		AccountDAO accountDAO = new AccountDAO(mongo);
		FindIterable<Account> listAccountFindIterable = accountDAO.getAllAccounts();
		Iterator<Account> acc = listAccountFindIterable.iterator();
		ArrayList<Account> ListAccount = new ArrayList<Account>();
		while (acc.hasNext()){
			ListAccount.add(acc.next());
		}
		request.setAttribute("accounts", ListAccount);
		String urlString = ("/Admin/manager-account.jsp");
		RequestDispatcher rd = request.getRequestDispatcher(urlString);
		rd.forward(request, response);
	}

}
