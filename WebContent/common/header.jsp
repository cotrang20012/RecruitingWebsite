<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Account"%>
<%
boolean is_logged = Account.isLogged(request.getCookies());
%>
<div class="col-sm-12">
	<div class="img-wrap">
		<img src="<c:url value='/assets/img/logo.png' />" alt=""
			class="img-logo">
	</div>
</div>
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

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-expanded="false">
								Bài tập </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/assignment1">Bài
										tập 1</a></li>
								<li><a class="dropdown-item"
									href="${pageContext.request.contextPath}/assignment2">Bài
										tập 2</a></li>
								<li><a class="dropdown-item" href="#">Bài tập 3</a></li>
								<li><a class="dropdown-item" href="#">Bài tập 4</a></li>
								<li><a class="dropdown-item" href="#">Bài tập 5</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="#">Something else
										here</a></li>
							</ul></li>
					</ul>
					<div class="account-wrap">
						<% if (is_logged) { %>
						<img class="account-avatar" src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="" style="height: 36px;">
						<ul class="dropdown-account">
							<li><a class="dropdown-item" href="#">"${user.username }"</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">Profile</a></li>
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

</header>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

