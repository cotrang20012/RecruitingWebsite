<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Đăng nhập</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css' />">
<link rel="stylesheet" type="text/css"
	href=https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/font/fontawesome-free-5.15.3-web/css/all.min.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/login.css' />">

</head>
<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>


	<div class="app">
		<div class="container-fluid"
			style="min-height: 400px; justify-content: center; align-content: center;">
			<div class="row main-content bg-success text-center">
				<div class="col-md-4 text-center company__info">
					<span class="company__logo">
						<h2>
							<span class="fa fa-android"></span>
						</h2>
					</span>
					<h4 class="company_title">Your Company Logo</h4>
				</div>
				<div class="col-md-8 col-xs-12 col-sm-12 login_form">
					<div class="container-fluid" style="padding: 10px">
						<div class="row justify-content-center">
							<h1>Log In</h1>
						</div>
						<div class="row">
							<h3>${msg}</h3>
						</div>

						<div class="row">
							<form action="login" method="post" class="form-group w-100">
								<div class="row">
									<input type="text" name="username" id="username"
										class="form__input" placeholder="Username">
								</div>
								<div class="row">
									<!-- <span class="fa fa-lock"></span> -->
									<input type="password" name="password" id="password"
										class="form__input" placeholder="Password">
								</div>
								<div class="row align-items-baseline w-100">
									<input type="checkbox" name="remember_me" id="remember_me"
										class="" style="margin-right: 4px;"> <label
										for="remember_me">Remember Me!</label>
								</div>
								<div class="row justify-content-center">
									<input type="submit" value="Submit" class="btn btn-login"
										style="font-size: 1.6rem;">
								</div>
							</form>
						</div>
						<div class="row justify-content-center">
							<p>
								Bạn đã có tài khoản chưa? <a href="${pageContext.request.contextPath}/signup">Đăng ký tại đây</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../common/footer.jsp"></jsp:include>


</body>
</html>