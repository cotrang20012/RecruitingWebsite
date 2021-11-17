<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông tin người dùng</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/dashboard.css' />">

</head>

<body>

	<fmt:formatDate value="${userProfile.birthday}" var="formatedBirthday" type="date" pattern="dd/MM/yyyy" />

	<jsp:include page="../common/main-dashboard-employee.jsp"></jsp:include>
	
	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="container rounded bg-white mb-5">
				<div class="row">
					<div class="col-md-3 border-right">
						<div class="d-flex flex-column align-items-center text-center p-3 py-5">
							<!-- <img class="rounded-circle mt-5" width="150px"
                                src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"> -->
							<img class="rounded-circle mt-5" width="150px" src="${userProfile.profile_url }" id="profile-image">
							<!--<img class="rounded-circle mt-5" width="150px"
                                src="${userProfile.profile_url }"> -->
							<span class="font-weight-bold"><c:out value='${userProfile.fullName}' /></span>
							<form action="upload" method="post" enctype="multipart/form-data" class="form-group w-100">
								<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg"> <input type="submit" value="upload">
							</form>
						</div>
					</div>

					<div class="col-md-5 border-right">
						<form action="profile" method="POST">
							<div class="p-3 py-5">
								<div class="d-flex justify-content-between align-items-center mb-3">
									<h4 class="text-right">Cài đặt Profile</h4>
								</div>
								<div class="row mt-2">
									<div class="col-md-12 mt-3">
										<label class="labels">Họ và tên</label> <input type="text" class="form-control" placeholder="Tên công ty" name="username" value="${userProfile.fullName}" readonly="readonly">
									</div>
									<div class="col-md-12 mt-3">
										<label class="labels">Số điện thoại</label> <input type="text" class="form-control" placeholder="Số điện thoại" name="phone" value="${userProfile.phone}" readonly="readonly">
									</div>
									<div class="col-md-12 mt-3">
										<label class="labels">Địa chỉ</label> <input type="text" class="form-control" placeholder="Địa chỉ" name="address" value="${userProfile.address}" readonly="readonly">
									</div>
									<div class="col-md-12 mt-3">
										<label class="labels">Email</label> <input type="text" class="form-control" placeholder="Email" name="email" value="${userProfile.email}" readonly="readonly">
									</div>
									<div class="col-md-12 mt-3">
										<label class="labels">Ngày sinh</label> <input type="text" class="form-control" placeholder="" name="birthday" value="${formatedBirthday}" readonly="readonly">
									</div>
									<div class="col-md-12 mt-3">
										<label class="labels">Giới tính</label>
										<div class="row">
											<div class="col-md-6">
												<input type="radio" name="gender" id="male" value="male" readonly="readonly"> <label for="male">Nam</label>
											</div>
											<div class="col-md-6">
												<input type="radio" name="gender" id="female" value="female" readonly="readonly"> <label for="female">Nữ</label>
											</div>
										</div>
									</div>
								</div>

								<div class="mt-5 text-center">
									<div>
										<input type="hidden" name="action" value="update">
										<button class="btn btn-primary profile-button" type="submit" onclick="EnableReadonly()">Save Profile</button>
										<button class="btn btn-primary profile-button" type="button" onclick="RemoveReadonly()">Edit</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-4">
						<div class="p-3 py-5">
							<div class="d-flex justify-content-between align-items-center experience">
								<span>Edit Experience</span><span class="border px-3 p-1 add-experience"><i class="fa fa-plus"></i>&nbsp;Experience</span>
							</div>
							<br>
							<div class="col-md-12">
								<label class="labels">Experience in Designing</label><input type="text" class="form-control" placeholder="experience" value="">
							</div>
							<br>
							<div class="col-md-12">
								<label class="labels">Additional Details</label><input type="text" class="form-control" placeholder="additional details" value="">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		const inputPropertise = document.getElementsByClassName("form-control");
		const avatar = document.getElementById("avatar");
		const profileImg = document.getElementById("profile-image");

		avatar.addEventListener("change", function() {
			const file = this.files[0];

			if (file) {
				const reader = new FileReader();

				reader.addEventListener("load", function() {
					profileImg.setAttribute("src", this.result);
				});
				reader.readAsDataURL(file);
			}
		});

		function RemoveReadonly() {
			var i;
			for (i = 0; i < inputPropertise.length; i++) {
				inputPropertise[i].removeAttribute("readonly");
			}
		}

		function EnableReadonly() {
			var i;
			for (i = 0; i < inputPropertise.length; i++) {
				inputPropertise[i].setAttribute("readonly", "readonly");
			}
		}
	</script>
</body>

</html>