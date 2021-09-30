<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title>Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/font/fontawesome-free-5.15.3-web/css/all.min.css' />">
<style>
label {
	margin-left: 20px;
	width:90px;
	
}

.title h1 {
	font-size:2rem;
	width:100%;
	text-align:center;
	margin-bottom:10px;
}


br {
	clear: both;
}

</style>
</head>
<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>
	
	
	<div class="app">
		<div class="row" style="width:100%;height: 300px;position: relative !important;justify-content: center;
align-content: center;">
			
			 <form action="login" method="post">
                <input type="text" class="form-control" placeholder="Tên đăng nhập"
                name="username" value ="${username }"><br>
                <input type="password" class="form-control" placeholder="Mật khẩu"
                name="password" value = "${password }"><br>
                <a style = "color: #de6600; text-decoration: none; margin-top:15px;" href="forgot.jsp"> Forgot password/username ?</a> 
					
			    <input type="submit" style = "background-color: #625bff;" class="btn btn-primary" value="login"> 
            </form>
			
			
		</div>
	</div>


   <jsp:include page="../common/footer.jsp"></jsp:include>

	
</body>
</html>