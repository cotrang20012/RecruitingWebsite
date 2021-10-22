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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/dashboard.css' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/listpost.css' />">

</head>

<body style="background: #eee; position: relative;">

	<jsp:include page="../common/header.jsp"></jsp:include>
	<fmt:formatDate value="${userProfile.birthday}" var="formatedBirthday"
		type="date" pattern="dd/MM/yyyy" />

	<main class="row" style="margin: 0;">
		<div class="col-lg-2 col-md-2 col-sm-2 col-2 sidebar-left">
			<div class="sidebar-left-title">
				<h1>Dashboard</h1>
			</div>
			<div class="sidebar-left-content">
				<ul class="sidebar-list">
					<a href="<c:url value = '/Profile/profileEmployee.jsp' />" class="item-link">
						<li class="sidebar-item">
							<h2>Profile</h2>
					</li>
					</a>

					<a href="<c:url value='/Dashboard/dashboard_listpost.jsp' />" class="item-link">
						<li class="sidebar-item item--active">
							<h2>Post</h2>
					</li>
					</a>

					<a href="" class="item-link">
						<li class="sidebar-item">
							<h2>Follow</h2>
					</li>

					</a>
				</ul>

			</div>
		</div>
		<div class="col-lg-10 col-md-10 col-sm-10 col-10 page-content ">

			<div class="container">
				<ul class="list-group mt-6">
					<li class="row list-group-item">
						<div class="col-10">
							<h3 class="list-group-item-heading">
								Amazing Item <span
									class="badge badge-danger px-3 rounded-pill font-weight-normal">Đang
									tuyển</span>
							</h3>
							<p>
								Lập trình C# <br />
							</p>
						</div>
						<div class="col-2">
							<a href="#" class="btn btn-primary col-10">Chỉnh sửa</a><br>
							<a href="#" class="btn btn-warning col-10">Xoá</a>
						</div>

					</li>

					<li class="row list-group-item">
						<div class="col-10">
							<h3 class="list-group-item-heading">
								Amazing Item <span
									class="badge badge-danger px-3 rounded-pill font-weight-normal">Đang
									tuyển</span>
							</h3>
							<p>
								Lập trình C# <br />
							</p>
						</div>
						<div class="col-2">
							<a href="#" class="btn btn-primary col-10">Chỉnh sửa</a><br>
							<a href="#" class="btn btn-warning col-10">Xoá</a>
						</div>

					</li>

					<li class="row list-group-item">
						<div class="col-10">
							<h3 class="list-group-item-heading">
								Amazing Item <span
									class="badge badge-danger px-3 rounded-pill font-weight-normal">Đang
									tuyển</span>
							</h3>
							<p>
								Lập trình C# <br />
							</p>
						</div>
						<div class="col-2">
							<a href="#" class="btn btn-primary col-10">Chỉnh sửa</a><br>
							<a href="#" class="btn btn-warning col-10">Xoá</a>
						</div>

					</li>
					<li class="row list-group-item">
						<div class="col-10">
							<h3 class="list-group-item-heading">
								Amazing Item <span
									class="badge badge-danger px-3 rounded-pill font-weight-normal">Dừng tuyển</span>
							</h3>
							<p>
								Lập trình Java <br />
							</p>
						</div>
						<div class="col-2">
							<a href="#" class="btn btn-primary col-10">Chỉnh sửa</a><br>
							<a href="#" class="btn btn-warning col-10">Xoá</a>
						</div>

					</li>
					<li class="row list-group-item">
						<div class="col-10">
							<h3 class="list-group-item-heading">
								Amazing Item <span
									class="badge badge-danger px-3 rounded-pill font-weight-normal">Đang
									tuyển</span>
							</h3>
							<p>
								Lập trình C/C++ <br /> 
							</p>
						</div>
						<div class="col-2">
							<a href="#" class="btn btn-primary col-10">Chỉnh sửa</a><br>
							<a href="#" class="btn btn-warning col-10">Xoá</a>
						</div>

					</li>
				</ul>
			</div>

		</div>

	</main>


	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>