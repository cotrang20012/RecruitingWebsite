<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Thông tin người dùng</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/font/fontawesome-free-5.15.3-web/css/all.min.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/profile.css' />">

</head>

<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="app" style="min-height: 400px;">
	<form action="upload" method="post" class="form-group w-100">
	<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg">
	<input type="submit" value="upload">
	</form>
	</div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>