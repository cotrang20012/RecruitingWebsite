package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;

/**
 * Servlet implementation class CheckEmailServlet
 */
@WebServlet("/api-checkemail")
public class CheckEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailServlet() {
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
		// TODO Auto-generated method stub
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				request.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				String email = request.getParameter("email");
				MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
				AccountDAO accountDAO = new AccountDAO(mongoClient);
				ObjectId id=accountDAO.getAccountIdFromEmail(email);
				if(id==null) {
					out.print("<span style="+'"'+"color:green;"+'"'+">Email hợp lệ</span>");
				}
				else {
					out.print("<span style="+'"'+"color:red;"+'"'+">Email đã tồn tại</span>");
				}
	}

}
