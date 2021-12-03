import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.SecurityUtils;
import Util.UserRoleRequestWrapper;
import model.Account;

@WebFilter("/*")
public class SecurityFilter implements Filter {
	public SecurityFilter() {
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session=request.getSession();

		String servletPath = request.getServletPath();

		// Thông tin người dùng đã được lưu trong Session
		// (Sau khi đăng nhập thành công).
		Account loginedUser=null;
		if(session.getAttribute("acc")!=null) {
			loginedUser=(Account) session.getAttribute("acc");
		}

		if (servletPath.equals("/login")) {
			chain.doFilter(request, response);
			return;
		}
		HttpServletRequest wrapRequest = request;

		if (loginedUser != null) {
			// User Name
			String userName = loginedUser.getUsername();

			// Các vai trò (Role).
			String roles = loginedUser.getTypeUser();

			// Gói request cũ bởi một Request mới với các thông tin userName và Roles.
			wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
		}

		// Các trang bắt buộc phải đăng nhập.
		if (SecurityUtils.isSecurityPage(request)) {

			// Nếu người dùng chưa đăng nhập,
			// Redirect (chuyển hướng) tới trang đăng nhập.
			if (loginedUser == null) {

				//String requestUri = request.getRequestURI();

				// Lưu trữ trang hiện tại để redirect đến sau khi đăng nhập thành công.
				//int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);

				response.sendRedirect(wrapRequest.getContextPath() + "/login");
				return;
			}

			// Kiểm tra người dùng có vai trò hợp lệ hay không?
			boolean hasPermission = SecurityUtils.hasPermission(wrapRequest);
			if (!hasPermission) {
				response.sendRedirect(wrapRequest.getContextPath() + "/home");
				return;
			}
		}

		chain.doFilter(wrapRequest, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
