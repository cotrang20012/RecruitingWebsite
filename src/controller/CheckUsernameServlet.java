package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;

import java.io.PrintWriter;
/**
 * Servlet implementation class CheckUsernameServlet
 */
@WebServlet(name="checkusername",urlPatterns= {"/checkusername"})
public class CheckUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUsernameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		AccountDAO accountDAO = new AccountDAO(mongoClient);
		ObjectId id=accountDAO.getAccountIdFromUsername(username);
		if(id==null) {
			out.print("<span style="+'"'+"color:green;"+'"'+">Username hợp lệ</span>");
		}
		else {
			out.print("<span style="+'"'+"color:red;"+'"'+">Username đã tồn tại</span>");
		}
	}

}
