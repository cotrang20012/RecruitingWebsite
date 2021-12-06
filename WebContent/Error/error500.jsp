<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title>Page 500</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/error.css' />">
<style>
</style>
</head>
<body style="background: #eee; position: relative;">


	<div class="app">
		<main>
			<h1>500</h1>
			<h2>
				Unexpected Error <b>:(</b>
			</h2>
			<div class="gears">
				<div class="gear one">
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
				</div>
				<div class="gear two">
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
				</div>
				<div class="gear three">
					<div class="bar"></div>
					<div class="bar"></div>
					<div class="bar"></div>
				</div>
			</div>
			<a id="errorLink" href="${pageContext.request.contextPath}/home">Về trang chủ</a>
		</main>
	</div>
</body>
</html>