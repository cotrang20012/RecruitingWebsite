<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title>Đăng tuyển</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css'/>">
</head>

<body>
	
	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="pd-20 card-box mb-30">
				<form action='editpost' method="POST" enctype="multipart/form-data" >
					<input type="text" name="action" value="edit" hidden>
					<input type="text" name="postId" value="${Post.getId() }" hidden>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Title</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="title" type="text" value="${Post.title }" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Your Email</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="email" value="${Post.email }" type="email" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Phone number</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="phone" value="${Post.phone}" type="tel" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Vị trí ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="pos" type="text" value="${Post.position }" placeholder="Lập trình viên" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Nơi làm việc</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="location" value="${Post.location}" type="text" placeholder="Tp.Hồ Chí Minh" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Số lượng ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="quantity" value="${Post.quantity}" type="number" required>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Lương</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control" name="salary" value="${Post.luong}" type="text">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Kĩ năng cần có</label>
						<div class="col-sm-12 col-md-10">
							<select name='skill' class="custom-select2 form-control fs-14" multiple="multiple" style="width: 100%;">
								<optgroup label="Backend">
									<option value="C++">C++</option>
									<option value="C#">C#</option>
								</optgroup>
								<optgroup label="Frontend">
									<option value="HTML CSS JS">HTML CSS JS</option>
									<option value="ReactJS">ReactJS</option>
									<option value="AngulaJS">AngulaJS</option>
									<option value="NodeJS">NodeJS</option>
								</optgroup>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Kinh nghiệm</label>
						<div class="col-sm-12 col-md-10">
							<select name='exp' class="custom-select col-12">
								<option selected="">--Kinh nghiệm--</option>
								<option value="Fresher">Fresher</option>
								<option value="1 năm">1 năm</option>
								<option value="1-5 năm">1-5 năm</option>
								<option value="trên 5 năm">trên 5 năm</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Thời gian ứng tuyển</label>
						<div class="col-sm-12 col-md-10">
							<input class="form-control datetimepicker" name='time' value="${Post.dateEnd }" placeholder="Choose Date and time" type="text">
						</div>
					</div>


					<div class="form-group">
						<label>Mô tả công việc</label>
						<textarea name='desc' class="form-control">${Post.content}</textarea>
					</div>
					<div class="form-group">
						<label>Hình ảnh</label>
						<input type="file" id="thumbnail" name="thumbnail" accept="image/png, image/jpeg">
						<img class="rounded-circle mt-5" width="150px" height="150px" src="${Post.thumbnail_url }" id="profile-image">
					</div>
					
					<div class="row justify-content-center">
						<input type="submit" value="Đăng tuyển" class="btn btn-primary" style="font-size: 1.6rem;">
					</div>

				</form>
			</div>
		</div>
	</div>
</body>



<script>
	const profileImg = document.getElementById("profile-image");
	const avatar = document.getElementById("thumbnail");
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
</script>


</html>