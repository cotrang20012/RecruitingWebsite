<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title>Hệ thống tuyển dụng</title>


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
									<img class="rounded-circle" width="45" src="https://scontent.fdad1-1.fna.fbcdn.net/v/t1.6435-9/244751300_3008463426100929_846146406731092230_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Bm0FvYRqHzsAX_7eZiI&_nc_ht=scontent.fdad1-1.fna&oh=9a1424bb50d06e203e33b8fe221deaf5&oe=6195D245" alt="">
								</div>
								<div class="ml-2">
									<div class="h3 m-0">${Author.fullName }</div>
								</div>
							</div>
							<div class="h5">${Author.techstack }</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h3 text-muted">Followers</div>
								<div class="h5 fw-400">5.2342</div>
							</li>
							<li class="list-group-item">
								<div class="h3 text-muted">Following</div>
								<div class="h5 fw-400">6758</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 gedf-main">



					<!--- \\\\\\\Post-->
					<div class="card gedf-card">
						<div class="card-header">

							<a class="card-link" href="#">
								<h1 class="card-title">Technical Manager | 2,000 - 4,000 USD</h1>
							</a>
							<div class="badge badge-primary">
								<i class="fa fa-clock-o"></i>10 min ago
							</div>
						</div>

						<div class="card-body">
							<p class="card-text fs-15">${post.content }</p>
							<div style="font-size: 1.2rem;">
								<span class="badge badge-primary">Technical</span> <span class="badge badge-primary">ManagerSoftware</span> <span class="badge badge-primary">Development</span> <span class="badge badge-primary">CTO</span>
							</div>
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
							<div class="h5 fw-400">Ngôn ngữ chính: C#,C++</div>
							<div class="h5 fw-400">Mảng làm việc: Backend</div>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="h3">Chỉ tiêu</div>
								<div class="h5 fw-400">5.2342</div>
							</li>
							<li class="list-group-item">
								<div class="h3">Đã ứng tuyển</div>
								<div class="h5 fw-400">6758</div>
							</li>
							<c:choose>
								<c:when test="${acc==null }">
									<form>
										<div class="row justify-content-center">
											<input type="submit" value="Ứng tuyển ngay" class="btn btn--common">
										</div>
									</form>
								</c:when>
								<c:otherwise>
									<c:if test="${acc.typeuser==EMPLOYEE }">
										<form action="apply">
											<input type="hidden" name="id" value="${acc.getId }">
											<div class="row justify-content-center">
												<input type="submit" value="Ứng tuyển ngay" class="btn btn--common">
											</div>
										</form>
									</c:if>
								</c:otherwise>

							</c:choose>

							<li></li>

						</ul>
					</div>
				</div>
			</div>
		</section>


	</main>




</body>
</html>
