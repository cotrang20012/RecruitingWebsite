<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/login.css' />">

</head>
<body style="background: #eee; position: relative;">

	<div class="app">
		<section class="container-fluid d-flex justify-content-center">
			<div class="row main-content bg-success text-center">
				<div class="col-md-4 text-center company__info">
					<span class="company__logo"> <img src="<c:url value='/assets/img/logo-login.png' />" alt="" class="img-fluid">
					</span>
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
									<input type="text" name="username" id="username" class="form__input" placeholder="Username">
								</div>
								<div class="row">

									<input type="password" name="password" id="password" class="form__input" placeholder="Password">
								</div>
								<div class="row align-items-baseline w-100">
									<input type="checkbox" name="remember" id="remember_me" class="" style="margin-right: 4px;" value="yes">
									 <label for="remember">Ghi nhớ tài khoản!</label>
								</div>
								<div class="row justify-content-center">
									<input type="submit" value="Đăng nhập" class="btn btn-login" style="font-size: 1.6rem;">
								</div>
							</form>
						</div>
						<div class="row justify-content-center">
							<p>
								Bạn đã có tài khoản chưa? <a href="${pageContext.request.contextPath}/signup" style="color:blue" >Đăng ký tại đây</a>
							</p>
						</div>
						<div class="row justify-content-center">
							<p>
							Bạn quên mật khẩu? <a href="${pageContext.request.contextPath}/forgotpw"style="color:blue" >Đặt lại mật khẩu tại đây</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>



</body>
</html>