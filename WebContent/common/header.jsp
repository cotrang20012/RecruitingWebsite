<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.mongodb.client.MongoClient" %>
<%@page import="DAO.*" %>
<%
MongoClient mongoClient=(MongoClient)request.getServletContext().getAttribute("MONGODB_CLIENT");
AccountDAO accountDAO=new AccountDAO(mongoClient); 
boolean is_logged = accountDAO.isLogged(request.getCookies());
boolean is_employer = accountDAO.isEmployer(request.getCookies());
%>
    
    <style>
    	.header {
    		width:100% !important;
    	}
    </style>

	<div class="header sticky-top">
        	<div class="navbar-wrap">
                <nav class="navbar navbar-expand-lg navbar-light ">
					<div class="container-fluid">
						<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Về
								chúng tôi</a></li>
							<% if (is_employer) { %>
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="${pageContext.request.contextPath}/Post/create_post.jsp">Đăng tuyển</a></li>
							<% } %>
					
						</ul>
					</div>
					</div>
				</nav>
        </div>         
            
                       
            <div class="user-info-dropdown d-flex align-items-center">
             <c:choose>
			 <c:when test="${is_logged==true }">
						<div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                        <span class="user-icon">
							<img src="vendors/images/photo1.jpg" alt="">
						</span>
                        <span class="user-name">${user.fullName }</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                        <a class="dropdown-item" href="<c:out value='dashboard/profile' />"><i class="dw dw-user1"></i> Profile</a>
                   <!--      <a class="dropdown-item" href="profile.html"><i class="dw dw-settings2"></i> Setting</a> -->
                        <a class="dropdown-item" href="<c:out value='changepw' />"><i class="dw dw-help"></i> Đổi mật khẩu</a>
                        <a class="dropdown-item" href="<c:out value='logout' />"><i class="dw dw-logout"></i> Log Out</a>
                    </div>
                </div>
                </c:when>
						<c:otherwise>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/login">Đăng nhập</a> <a
							class="nav-link" href="${pageContext.request.contextPath}/signup">Đăng
							ký</a>
						</c:otherwise>
                </c:choose>
            </div>
            
</div>
<%-- 
<header class="header sticky-top">
	<div class="nav-wrap">
		<nav class="navbar navbar-expand-lg navbar-light ">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${pageContext.request.contextPath}/home">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Về
								chúng tôi</a></li>
						<% if (is_employer) { %>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${pageContext.request.contextPath}/Post/create_post.jsp">Đăng tuyển</a></li>
						<% } %>
					
					</ul>
					<div class="account-wrap">
						<% if (is_logged) { %>
						<img class="account-avatar" src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="" style="height: 36px;">
						<ul class="dropdown-account">
							<li><a class="dropdown-item" href="#">${user.fullName}</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Profile</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/changepw">Đổi mật khẩu</a></li>							
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
						</ul>
						<% } else { %>
						<a class="nav-link"
							href="${pageContext.request.contextPath}/login">Đăng nhập</a> <a
							class="nav-link" href="${pageContext.request.contextPath}/signup">Đăng
							ký</a>
						<% } %>
					</div>
				</div>
			</div>
		</nav>
	</div>

</header> --%>

    <%-- 
    
    <script src="<c:url value='/assets/script/layout-settings.js'/>"></script>
 <script src="<c:url value='/assets/script/dashboard.js' />"></script> --%>

