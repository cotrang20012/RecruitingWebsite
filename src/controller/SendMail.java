package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Port;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoClient;

import DAO.AccountDAO;
import DAO.ApplyDAO;
import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import Util.EmailUtility;
import model.Account;
import model.Apply;
import model.UserEmployee;
import model.UserEmployer;
import model.Post;


/**
 * Servlet implementation class DeleteApplyController
 */
@WebServlet(name = "sendmail", urlPatterns = { "/employee/sendmail", "/employer/sendmail"})
public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String user;
	private String pass;
	
	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMail() {
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
		HttpSession Session = request.getSession();
		Account acc = (Account) Session.getAttribute("acc");
		String idString=request.getParameter("postId");
		System.out.println(idString);
	
		ObjectId postId = new ObjectId(idString);
		String accountIdString=request.getParameter("accountId");
		ObjectId accountId=new ObjectId();
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		try {
			if (accountIdString == null)
				accountId = acc.getId();
			else {
				accountId=new ObjectId(accountIdString);
			}
		} catch (Exception e) {
			response.sendRedirect(request.getHeader("referer"));
			return;
		}
		PostDAO postDAO = new PostDAO(mongo);
		Post post = postDAO.GetPostByID(postId);
		ApplyDAO applyDAO = new ApplyDAO(mongo);
		AccountDAO accountDAO = new AccountDAO(mongo);
		
		UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
		UserEmployee employee = userEmployeeDAO.findEmployeeWithID(accountId);
		UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);
		UserEmployer employer = userEmployerDAO.getUserEmployerFromAccountId(post.getAccountId());

		String resultMessage = "";
		try {
			Account account = accountDAO.getAccountFromAccountId(accountId);
			String noiDungString = "Xin chào bạn "+ employee.getFullName()+",\r\n"
					+ "\r\n"
					+ "Lời nói đầu tiên, xin gửi đến bạn lời chúc sức khỏe và thành công !"
					+ "\r\n"
					+ "Chúc mừng ban đã vượt qua vòng xét tuyển hồ sơ của công ty "+ employer.getFullName() +" cho vị trí" + post.getExp() +".\r\n"
					+ "\r\n"
					+ "Công ty chúng tôi nhận thấy bạn có những kiến thức chuyên môn phù hợp để đáp ứng những công việc cho vị trí mà chúng tôi đang tuyển." 
					+ "Vì thế, chúng tôi xin gửi thư này để hẹn bạn một buổi phỏng vấn.\r\n"
					+ "\r\n"
					+ "Anh/Chị vui lòng liên hệ chúng tôi ngay khi nhận được thư này để nhận kế hoạch phỏng vấn sớm nhất."
					+ "Để biết thêm các thông tin khác, bạn có thể liên hệ với chúng tôi qua:\r\n"
					+ "\r\n"
					+ "Số điện thoại liên hệ: "+employer.getPhone()+ ",địa chỉ: "+ employee.getAddress() +"\r\n"
					+ "\r\n"
					+ "Trân trọng,"
					+ "\r\n"
					+ employer.getFullName() +"\r\n"
					+ "\r\n"
					+ "Email: "+employer.getEmail() +"\r\n";
			EmailUtility.sendEmail(host, port, user, pass, account.getEmail(), "["+employer.getFullName()+"] THÔNG BÁO VƯỢT QUA VÒNG XÉT TUYỂN HỒ SƠ", noiDungString);
			resultMessage = "The e-mail was sent successfully";
		} 
			catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "Hệ thống email đang gặp trục trặc. Thử lại sau hoặc liên hệ quản trị viên để đổi mật khẩu";
			request.setAttribute("result", "error");
		} 
			finally {
			request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/Login/forgotpw.jsp").forward(request, response);
		}

		
		request.setAttribute("msg", "Gửi thành công");
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
