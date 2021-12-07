<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title>${Post.title }</title>


</head>
<body style="background: #eee; position: relative;">
	<main>
		<section class="container-fluid mt-5" style="padding: 70px 0">
			<div class="row">
				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex align-items-center">
								<div class="mr-2">
									<img class="rounded-circle" width="45" src="${Author.profile_url }" alt="">

								</div>
								<div class="ml-2">
									<div class="h5 fw-400">Tên công ty: ${Author.fullName }</div>
								</div>

							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">
									<div class="h4">Thông tin nhà tuyển dụng</div>
									<div class="h5 fw-400">Tên công ty: ${Author.fullName }</div>
									<div class="h5 fw-400">Công nghệ:${Author.techstack }</div>
									<div class="h5 fw-400">Ngành nghề:${Author.nganhnghe }</div>
									<div class="h5 fw-400">Quy mô:${Author.quymo }</div>
									<div class="h5 fw-400">Số điện thoại:${Author.phone }</div>
									<div class="h5 fw-400">Email:${Author.email }</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 gedf-main">



					<!--- \\\\\\\Post-->
					<div class="card gedf-card">
						<div class="card-header">

							<a class="card-link" href="#">
								<h1 class="card-title fs-22">${Post.title }</h1>

							</a>
							<div class="badge badge-primary">
								<i class="fa fa-clock-o mx-2 fs-14"></i>${Post.time()}


							</div>
						</div>

						<div class="card-body">
							<p class="card-text fs-15">${Post.ContentHTML() }</p>
							<!-- <div style="font-size: 1.2rem;">
								<span class="badge badge-primary">Technical</span> <span
									class="badge badge-primary">ManagerSoftware</span> <span
									class="badge badge-primary">Development</span> <span
									class="badge badge-primary">CTO</span>
							</div> -->
						</div>
						<div class="card-footer">
							<a href="#" class="card-link h5"><i class="fa fa-gittip"></i> Like</a> <a href="#" class="card-link h5"><i class="fa fa-comment"></i> Comment</a> <a href="#" class="card-link h5"><i class="fa fa-mail-forward"></i> Follow</a>
						</div>
					</div>
					<!-- Post /////-->




				</div>
				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							<div class="h3">Thông tin</div>
							<div class="h5 fw-400">Vị trí: ${Post.position}</div>
							<div class="h5 fw-400">Kĩ năng: ${Post.skill }</div>
							<div class="h5 fw-400">Nơi làm việc: ${Post.location }</div>
							<div class="h5 fw-400">Lương: ${Post.luong }</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h3">Chỉ tiêu</div>
								<div class="h5 fw-400">${Post.quantity }</div>
							</li>
							<li class="list-group-item">
								<div class="h3">Liên hệ</div>
								<div class="h5 fw-400">${Post.email }</div>
								<div class="h5 fw-400">${Post.phone }</div>
							</li>
							<li id="apply-form"><c:choose>
									<c:when test="${acc==null }">
										<form action="login">
											<div class="row justify-content-center">
												<input type="submit" value="Ứng tuyển ngay" class="btn btn--common fs-14">
											</div>
										</form>
									</c:when>
									<c:otherwise>
										<c:if test="${acc.typeUser=='EMPLOYEE' }">
											<c:choose>
												<c:when test="${Apply!=null }">
													<form action="employee/delete-apply" id="delete-apply-form" method="POST">
														<input type="hidden" name="id" value="${acc.getId() }">
														<div class="row justify-content-center">
															<input type="hidden" name="postId" value="${Post.getId()}">
															<button type="button" id="delete-apply" class="btn btn--common fs-14">Huỷ ứng tuyển</button>
														</div>
													</form>
												</c:when>
												<c:otherwise>
													<form action="applypost" id="apply-post-form" method="POST">
														<input type="hidden" name="id" value="${acc.getId() }">
														<div class="row justify-content-center">
															<input type="hidden" name="title" value="${Post.title}"> <input type="hidden" name="time" value="${Post.getDateEnd()}"> <input type="hidden" name="salary" value="${Post.getLuong()}"> <input type="hidden" name="status" value="${Post.getStatus()}"> <input type="hidden" name="postId" value="${Post.getId()}"> <input type="hidden" name="url" value="${Post.getUrl()}">
															<button type="button" id="apply-post" class="btn btn--common fs-14">Ứng tuyển ngay</button>
														</div>
													</form>
												</c:otherwise>
											</c:choose>

										</c:if>
									</c:otherwise>
								</c:choose></li>

						</ul>
					</div>
				</div>
			</div>
		</section>


	</main>
<script>
	$(document).ready(function() {
		$('#apply-post').click(function() {
			var form = $("#apply-post-form");
			$.ajax({
				type : "POST",
				url : "applypost",
				cache: false,
				data : form.serialize(),
				success : function(msg) {
					alert("Ứng tuyển thành công");
					$("#apply-form").replaceWith("<form action='employee/delete-apply' id='delete-apply-form' method='POST'>"
							+"<input hidden name='id' value='${acc.getId() }'> <div class='row justify-content-center'>"
						+"<input hidden name='postId' value='${Post.getId()}'><button type='button' id='delete-apply' class='btn btn--common fs-14'>Huỷ ứng tuyển</button>"
					+"</div> </form>")
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		});
	});

	$(document).ready(function() {
		$('#delete-apply').click(function() {
			var form = $("#delete-apply-form");
			$.ajax({
				type : "POST",
				url : "employee/delete-apply",
				cache: false,
				data : form.serialize(),
				success : function(msg) {
					alert("Huỷ ứng tuyển thành công");
					$("#apply-form").replaceWith("<form action='applypost' id='apply-post-form' method='POST'> <input type='hidden' name='id' value='${acc.getId() }'>"
					+"<div class='row justify-content-center'>"
					+"	<input hidden name='title' value='${Post.title}'> <input type='hidden' name='time' value='${Post.getDateEnd()}'> <input type='hidden' name='salary' value='${Post.getLuong()}'> <input type='hidden' name='status' value='${Post.getStatus()}'> <input type='hidden' name='postId' value='${Post.getId()}'> <input type='hidden' name='url' value='${Post.getUrl()}'>"
						+"<button type='button' id='apply-post' class='btn btn--common fs-14'>Ứng tuyển ngay</button></div></form>")
				},
				error : function(jqXHR, textStatus, errorThrown) {

				}
			});
		});
	});
</script>
</body>

</html>
