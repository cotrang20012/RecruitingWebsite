package controller;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.entity.ByteArrayEntity;
import org.apache.naming.java.javaURLContextFactory;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.bson.types.ObjectId;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.mongodb.client.MongoClient;

import DAO.PostDAO;
import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Post;
import model.UserEmployee;

/**
 * Servlet implementation class CreatePostController
 */
@WebServlet(name = "createpost", urlPatterns = { "/employer/createpost" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50)

public class CreatePostController extends HttpServlet {

	private static final long serialVersionUID = 1L;
// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "img";

// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreatePostController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/Dashboard/CreatePost.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Post post = new Post();
		String url = "";
		String[] liStrings = new String[50];
		int i = 0;
		String urlString = "https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg";
		try {

			// configures upload settings
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// sets memory threshold - beyond which files are stored in disk
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			// sets temporary location to store files
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
			ServletFileUpload upload = new ServletFileUpload(factory);
			// sets maximum size of upload file
			upload.setFileSizeMax(MAX_FILE_SIZE);
			// sets maximum size of request (include file + form data)
			upload.setSizeMax(MAX_REQUEST_SIZE);
			// constructs the directory path to store upload file
			// this path is relative to application's directory
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
			// creates the directory if it does not exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			// parses the request's content to extract file data
			List<FileItem> formItems = upload.parseRequest(new ServletRequestContext(request));
			if (formItems != null && formItems.size() > 0) {

				for (FileItem item : formItems) {
					if(item.isFormField()) {
						String variable = item.getFieldName();
			            if (variable.equals("title")) { 
			            	post.setTitle(item.getString("UTF-8"));
			            	 url = webfit.Utilities.createURL(item.getString("UTF-8"));
			            } else if (variable.equals("phone")) {
			            	post.setPhone(item.getString("UTF-8"));
			            } else if (variable.equals("email")) {
			            	post.setEmail(item.getString("UTF-8"));
			            } else if (variable.equals("pos")) {
			            	post.setPosition(item.getString("UTF-8"));
			            } else if (variable.equals("location")) {		            	
			            	post.setLocation(item.getString("UTF-8"));
			            } else if (variable.equals("quantity")) {
			            	post.setQuantity(item.getString("UTF-8"));
			            } else if (variable.equals("exp")) {
			            	post.setExp(item.getString("UTF-8"));
			            } else if (variable.equals("desc")) {		            	
			            	post.setContent(item.getString("UTF-8"));
			            } else if (variable.equals("date")) {
			            	SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy hh:mm");
			    			post.setDateEnd(format.parse(item.getString()));
			            } else if (variable.equals("skill")) {
			            	liStrings[i] = item.getString();
			            	i++;
			            }
 
					}
					// processes only fields that are not form fields
					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						String filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);

						// saves the file on disk
						try {
							item.write(storeFile);

							Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dlwoxocw3",
									"api_key", "763753897849765", "api_secret", "NvKoAXjdLpPsKG3M5F7O4c4LLew"));

							String public_id = java.util.UUID.randomUUID().toString() + "pic";

							Map uploadResult = cloudinary.uploader().upload(filePath,
									ObjectUtils.asMap("public_id", public_id));

							urlString = uploadResult.get("url").toString();

						} catch (Exception e) {
							e.printStackTrace();
							urlString = "https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg";
						}
					}
				}
			}
		} catch (Exception e) {
			urlString = "https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg";
			// TODO: handle exception
		}
		
		HttpSession session = request.getSession();
		Account account = (Account) session.getAttribute("acc");
		if (account == null) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
		
		MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
		PostDAO postDAO = new PostDAO(mongo);
		
		post.setUrl(url);
		post.setAccountId(account.getId());	
		post.setStatus("Đang tuyển");
		post.setDateStart(java.util.Calendar.getInstance().getTime());
		post.setThumbnail_url(urlString);
		
		String temp = "";
		for (String itemString : liStrings) {
			if(itemString != null) {
				temp += itemString + ",";
			}
			else {
				break;
			}
		}
		post.setSkill(temp.substring(0, temp.length() - 1));
		postDAO.Insert(post);
		response.sendRedirect(request.getContextPath() + "/post?p=" + post.getUrl());
	}

}
