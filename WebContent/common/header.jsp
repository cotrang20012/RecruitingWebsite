<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
    
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
							<c:if test="${acc.typeUser=='EMPLOYER' }">
							
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="${pageContext.request.contextPath}/employer/createpost">Đăng tuyển</a></li>
							</c:if>
					
						</ul>
					</div>
					</div>
				</nav>
        </div>         
            
                       
            <div class="user-info-dropdown d-flex align-items-center">
             <c:choose>
			 <c:when test="${user!=null }">
						<div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
                        <span class="user-icon">
							<img src="${user.profile_url }" alt="" style="width:50px;height:50px">
						</span>
                        <span class="user-name">
                        <c:out value='${user.fullName }' />
                        
                        </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
                    	<c:choose>
                        	<c:when test="${acc.typeUser=='EMPLOYEE' }">
                        		<a class="dropdown-item" href="<c:out value='employee/profile' />"><i class="dw dw-user1"></i> Profile</a>
                        	</c:when>
                        	<c:when test="${acc.typeUser=='EMPLOYER' }">
                        		<a class="dropdown-item" href="<c:out value='employer/profile' />"><i class="dw dw-user1"></i> Profile</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a class="dropdown-item" href="<c:out value='admin/profile' />"><i class="dw dw-user1"></i> Profile</a>
                        	</c:otherwise>
                        </c:choose>
                        
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