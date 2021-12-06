<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<div class="header sticky-top">
	<div class="header-left">
		<div class="menu-icon dw dw-menu"></div>
	</div>

	<div class="header-right">
		<div class="user-info-dropdown">
			<c:choose>
				<c:when test="${user!=null }">
					<div class="dropdown">
						<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown"> <span class="user-icon"> 
						<img src="${user.profile_url }" alt="" style="width:50px;height:50px">
						</span> <span class="user-name"><c:out value='${user.fullName }' /></span>
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
							<a class="dropdown-item" href="<c:out value='/profile' />"><i class="dw dw-user1"></i> Profile</a>
							<!--      <a class="dropdown-item" href="profile.html"><i class="dw dw-settings2"></i> Setting</a> -->
							<a class="dropdown-item" href="${pageContext.request.contextPath}changepw"><i class="dw dw-help"></i> Đổi mật khẩu</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="dw dw-logout"></i> Log Out</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a class="nav-link" href="${pageContext.request.contextPath}/login">Đăng nhập</a>
					<a class="nav-link" href="${pageContext.request.contextPath}/signup">Đăng ký</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

