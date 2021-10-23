<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>"http://java.sun.com/jsp/jstl/core"
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Đổi mật khẩu</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css' />">
<link rel="stylesheet" type="text/css"
	href=https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/login.css' />">

</head>
<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>


	<div class="app">
		<section class="container-fluid">
			<div class="row main-content bg-success text-center">
				<div class="col-md-4 text-center company__info">
					<span class="company__logo">
						<img src="<c:url value='/assets/img/logo-login.png' />"
							alt="" class="img-fluid">
					</span>
					
				</div>
				<div class="col-md-8 col-xs-12 col-sm-12 login_form">
					<div class="container-fluid" style="padding: 10px">
						<div class="row justify-content-center">
							<h1>Đổi mật khẩu</h1>
						</div>
						<div class="row">
							<h3>${msg}</h3>
						</div>

						<div class="row">
							<form action="changepw" method="post" class="form-group w-100">
								<div class="row">
									<input type="text" name="username" id="username"
										class="form__input" placeholder="Username">
								</div>
								<div class="row">
									<input type="password" name="password_old" id="password"
										class="form__input" placeholder="Mật khẩu cũ">
								</div>
								<div class="row">
                                	<input type="password" class="form__input" name="password_new" id="password"
                                    	placeholder="Mật khẩu mới" required>
                            	</div>
                            	<div class="row">
                                <input type="password" class="form__input" id="confirm_password"
                                    placeholder="Xác nhận mật khẩu mới" required>
                            	</div>
								<div class="row justify-content-center">
									<input type="submit" value="Đổi mật khẩu" class="btn btn-login"
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
		</section>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript">
	var password = document.getElementById("password_new")
	  , confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Mật khẩu không trùng khớp!");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	</script>


</body>
</html>