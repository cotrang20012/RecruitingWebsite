package controller;

import java.awt.print.Printable;
import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.http.cookie.Cookie;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.bson.types.ObjectId;

import javax.servlet.annotation.MultipartConfig;

import com.cloudinary.*;
import com.cloudinary.api.ApiResponse;
import com.cloudinary.utils.ObjectUtils;
import com.mongodb.client.MongoClient;
import com.mongodb.client.model.Filters;

import DAO.UserEmployeeDAO;
import DAO.UserEmployerDAO;
import model.Account;
import model.Model;
import model.UserEmployee;
import model.UserEmployer;

/**
 * Servlet implementation class uploadController
 */
@WebServlet("/dashboard/upload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50)
public class uploadController extends HttpServlet {

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
	public uploadController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name",
		 * "dlwoxocw3", "api_key", "763753897849765", "api_secret",
		 * "NvKoAXjdLpPsKG3M5F7O4c4LLew"));
		 * 
		 * for (Part part : request.getParts()) { String fileName =
		 * extractFileName(part); System.out.println(fileName); // refines the fileName
		 * in case it is an absolute path fileName = new File(fileName).getName(); File
		 * file = new File(fileName); //part.write("img"+ File.separator + fileName);
		 * cloudinary.uploader().upload(file, ObjectUtils.emptyMap()); }
		 * request.setAttribute("message", "Upload File Success!");
		 * getServletContext().getRequestDispatcher("/Upload/thanks.jsp").forward(
		 * request, response);
		 */

		String urlString = "/home.jsp";
		
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
				
				// processes only fields that are not form fields
				if (!item.isFormField()) {
					String fileName = new File(item.getName()).getName();
					String filePath = uploadPath + File.separator + fileName;
					File storeFile = new File(filePath);

					// saves the file on disk
					try {
						HttpSession session = request.getSession();
						Account acc = (Account) session.getAttribute("user");
						MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGODB_CLIENT");
						UserEmployeeDAO userEmployeeDAO = new UserEmployeeDAO(mongo);
						UserEmployerDAO userEmployerDAO = new UserEmployerDAO(mongo);
						urlString = "/home.jsp";
						
						
						item.write(storeFile);
						String type_user = acc.getTypeUser();
						
						if (type_user.equals("EMPLOYEE")) {
							Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dlwoxocw3", "api_key",
									"763753897849765", "api_secret", "NvKoAXjdLpPsKG3M5F7O4c4LLew"));
							
							String public_id = acc.getUsername() + "pic";
							
							Map uploadResult = cloudinary.uploader().upload(filePath, ObjectUtils.asMap("public_id", public_id));
							
							String profile_url = uploadResult.get("url").toString();	
							
							//ApiResponse result = cloudinary.search().expression("public_id="+public_id).execute();					
							//ObjectUtils profile_url = (ObjectUtils) result.get("resources");						
							UserEmployee userEmployee = userEmployeeDAO.findEmployeeWithID(acc.getId());
							userEmployee.setProfile_url(profile_url);
							userEmployeeDAO.UpdateUserEmployeeUrl(userEmployee);
							
							request.setAttribute("userProfile", userEmployee);
							urlString = "/Profile/profileEmployee.jsp";
						} else if (type_user.equals("EMPLOYER")) {
							Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "dlwoxocw3", "api_key",
									"763753897849765", "api_secret", "NvKoAXjdLpPsKG3M5F7O4c4LLew"));
							String public_id = acc.getUsername() + "pic";
							cloudinary.uploader().upload(filePath, ObjectUtils.asMap("public_id", public_id));
							Map uploadResult = cloudinary.uploader().upload(filePath, ObjectUtils.asMap("public_id", public_id));	
							String profile_url = uploadResult.get("url").toString();
							UserEmployer userEmployer = userEmployerDAO.findEmployerWithID(acc.getId());
							userEmployer.setProfile_url(profile_url);
							userEmployerDAO.UpdateUserEmployerUrl(userEmployer);

							request.setAttribute("userProfile", userEmployer);
							urlString = "/Profile/profileEmployer.jsp";
						}
					} catch (Exception e) {
						System.out.println(e);
					}
				}
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlString);
		dispatcher.forward(request, response);
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	public File getFolderUpload() {
		File folderUpload = new File(System.getProperty("user.home") + "/Uploads");
		if (!folderUpload.exists()) {
			folderUpload.mkdirs();
		}
		return folderUpload;
	}

}
