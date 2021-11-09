<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Kích hoạt tài khoản</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css' />">
<link rel="stylesheet" type="text/css"
	href=https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/login.css' />">

</head>
<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>


	<div class="app">
		<section class="container-fluid">
			<div class="row text-center d-flex justify-content-center" 
			style="max-width:720px;min-height:400px;margin:auto">
				<div class="col-8 mt-5 fs-16" style="border-radius: 20px;
	box-shadow: 0 5px 5px rgba(0,0,0,.4);">
				<c:choose>
					<c:when test="${result== 'non-active' }"> 
						<p>Đường dẫn kích hoạt tài khoản đã được gửi tới email của bạn.
						Hãy kiểm tra và kích hoạt tài khoản. Nếu vẫn chưa nhận được mail.
						Hãy nhấn <a href="<c:url value="/active?action=send"/>">vào đây</a> để nhận lại</p>
					</c:when>
					<c:when test="${result== 'active' }">
						<p>
						Tài khoản đã kích hoạt thành công. Hãy nhấn <a
							href="<c:url value="/login"/>">vào đây</a> để đăng nhập
					</p>
					</c:when>
					<c:otherwise>
						<p>
						Tài khoản của bạn chưa kích hoạt. Hãy nhấn <a
							href="<c:url value="/active?action=send"/>">vào đây</a> để nhận đường dẫn kích hoạt.
					</p>
					</c:otherwise>
				</c:choose>
				
				</div>
		</section>
	</div>

	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>