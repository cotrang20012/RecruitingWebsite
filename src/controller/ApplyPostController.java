package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.ApplyDAO;
import model.Account;
import model.Apply;

/**
 * Servlet implementation class ApplyPostController
 */
@WebServlet("/applypost")
public class ApplyPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Apply apply = new Apply();
		HttpSession Session = request.getSession();
		Account acc = (Account) Session.getAttribute("acc");
		MongoClient mongo=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
		ApplyDAO applyDAO = new ApplyDAO(mongo);
		apply.setPostId(new ObjectId(request.getParameter("postId")));
		apply.setAccountId(acc.getId());
		apply.setTitle(request.getParameter(request.getParameter("title")));
		apply.setLuong(request.getParameter("salary"));
		apply.setStatus(request.getParameter("status"));
		apply.setTime(request.getParameter("time"));
		applyDAO.Insert(apply);
		response.sendRedirect(request.getHeader("referer"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
