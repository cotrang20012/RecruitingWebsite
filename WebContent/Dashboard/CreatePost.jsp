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
<title>Đăng tuyển</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css'/>">
</head>

<body>
	<jsp:include page="../common/main-dashboard-employee.jsp"></jsp:include>
	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="pd-20 card-box mb-30">
				<form action='createpost' method="POST">
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Title</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="title" type="text" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Your
							Email</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="email" value="example@mail.com"
								type="email" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Phone
							number</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="phone" value="" type="tel"
								required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Vị trí
							ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="pos" type="text" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Vị trí</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="location"
								value="Ex: TP.Hồ Chí Minh" type="text" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Số lượng
							ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="quantity" value="0"
								type="number">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Kĩ năng
							cần có</label>
						<div class="col-sm-12 col-md-10">
							<select name='skill' class="custom-select2 form-control"
								multiple="multiple" style="width: 100%;">
								<optgroup label="Alaskan/Hawaiian Time Zone">
									<option value="AK">Alaska</option>
									<option value="HI">Hawaii</option>
								</optgroup>
								<optgroup label="Pacific Time Zone">
									<option value="CA">California</option>
									<option value="NV">Nevada</option>
									<option value="OR">Oregon</option>
									<option value="WA">Washington</option>
								</optgroup>
								<optgroup label="Mountain Time Zone">
									<option value="AZ">Arizona</option>
									<option value="CO">Colorado</option>
									<option value="ID">Idaho</option>
									<option value="MT">Montana</option>
									<option value="NE">Nebraska</option>
									<option value="NM">New Mexico</option>
									<option value="ND">North Dakota</option>
									<option value="UT">Utah</option>
									<option value="WY">Wyoming</option>
								</optgroup>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Trình độ
							học vấn</label>
						<div class="col-sm-12 col-md-10">
							<select name='exp' class="custom-select col-12">
								<option selected="">--Experience Level--</option>
								<option value="Fresher">Fresher</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Thời gian
							ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control datetimepicker" name='time'
								placeholder="Choose Date and time" type="text">
						</div>
					</div>


					<div class="form-group">
						<label>Mô tả</label>
						<textarea name='desc' class="form-control"></textarea>
					</div>

					<div class="row justify-content-center">
						<input type="submit" value="Đăng tuyển" class="btn btn-login"
							style="font-size: 1.6rem;">
					</div>

				</form>
			</div>
		</div>
	</div>
</body>



</html>