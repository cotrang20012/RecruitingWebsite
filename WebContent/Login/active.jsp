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
				<c:if test="${result== 'non-active' }">
				<p>Đường dẫn kích hoạt tài khoản đã được gửi tới email của bạn. Hãy kiểm tra và kích hoạt tài khoản.<br>
				Nếu vẫn chưa nhận được mail. Hãy nhấn <a href="<c:url value="/active?action=send"/>">vào đây</a> để nhận lại</p>
				</c:if>
				<c:if test="${result== 'active' }">
				<p>Tài khoản đã kích hoạt thành công. Hãy nhấn <a href="<c:url value="/login"/>">vào đây</a> để về trang chủ</p>
			</c:if>
		</section>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>
	
</body>
</html>