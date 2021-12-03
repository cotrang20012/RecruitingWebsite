package Util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class SecurityConfig {

	public static final String ROLE_EMPLOYER = "EMPLOYER";
	public static final String ROLE_EMPLOYEE = "EMPLOYEE";

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

		mapConfig.put(ROLE_EMPLOYEE, urlPatterns1);

		// Cấu hình cho vai trò "MANAGER".
		List<String> urlPatterns2 = new ArrayList<String>();

		urlPatterns2.add("/logout");
		urlPatterns2.add("/active");

		mapConfig.put(ROLE_EMPLOYER, urlPatterns2);
	}

	public static Set<String> getAllAppRoles() {
		return mapConfig.keySet();
	}

	public static List<String> getUrlPatternsForRole(String role) {
		return mapConfig.get(role);
	}
}
