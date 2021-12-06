package Util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

	public static final String ROLE_EMPLOYER = "EMPLOYER";
	public static final String ROLE_EMPLOYEE = "EMPLOYEE";
	public static final String ROLE_ADMIN = "ADMIN";

	// String: Role
	// List<String>: urlPatterns.
	private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();
	
	static {
		init();
	}

	private static void init() {

		// Cấu hình cho vai trò "EMPLOYEE".
		List<String> urlPatterns1 = new ArrayList<String>();

		urlPatterns1.add("/logout");
		urlPatterns1.add("/active");
		urlPatterns1.add("/employee/profile");
		urlPatterns1.add("/applypost");
		urlPatterns1.add("/employee/list-post");
		urlPatterns1.add("/upload");
		urlPatterns1.add("/changepw");
		//urlPatterns1.add("/viewprofile");

		mapConfig.put(ROLE_EMPLOYEE, urlPatterns1);

		// Cấu hình cho vai trò "MANAGER".
		List<String> urlPatterns2 = new ArrayList<String>();

		urlPatterns2.add("/logout");
		urlPatterns2.add("/active");
		urlPatterns2.add("/employer/profile");
		urlPatterns2.add("/employer/createpost");
		urlPatterns2.add("/employer/editpost");
		urlPatterns1.add("/employer/list-post");
		urlPatterns2.add("/changepw");
		urlPatterns2.add("/upload");
		urlPatterns2.add("/employer/postdelete");
		
		//urlPatterns2.add("/viewprofile");
		mapConfig.put(ROLE_EMPLOYER, urlPatterns2);
		
		List<String> urlPatterns3 = new ArrayList<String>();

		urlPatterns3.add("/logout");
		urlPatterns3.add("/adminactive"); 
		urlPatterns3.add("/adminpostactive"); 
		urlPatterns3.add("/admindelete"); 
		urlPatterns3.add("/adminpostdelete"); 
		urlPatterns3.add("/admin/ManagerAccount"); 
		urlPatterns3.add("/admin/ManagerPost");
		urlPatterns3.add("/admin/profile");
		urlPatterns3.add("/upload");
		urlPatterns3.add("/changepw");
		//urlPatterns2.add("/viewprofile");
		mapConfig.put(ROLE_ADMIN, urlPatterns3);
	}

	public static Set<String> getAllAppRoles() {
		return mapConfig.keySet();
	}

	public static List<String> getUrlPatternsForRole(String role) {
		return mapConfig.get(role);
	}
}
