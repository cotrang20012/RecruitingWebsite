<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Hệ thống tuyển dụng</title>

<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">

</head>
<body style="background: #eee; position: relative;">
	<main>
		<section class="container-fluid mt-2 mb-2">
			<div
				class="row height d-flex justify-content-center align-items-center">
				<div class="col-md-8">
					<div class="search">
						<form action="search" method="post" class="d-flex" style="margin-top:70px"> 
						<i class="fa fa-search"></i> <input type="text"
							class="form-control" name="query" placeholder="Have a question? Ask Now">
						<input type="submit" class="btn btn-primary fs-15" value="Tìm kiếm" style="padding-right: 25px;">
						</form>
					</div>
				</div>
			</div>
		</section>

		



		<section class="container-fluid">
			<div class="work-wrap seperate_border"
				style="margin: 0 20px; background-color: #fff;">
				<div class="work-wrap-tilte mb-2"
					style="border-bottom: solid 1px #dadada;">
					<h1
						style="padding: 20px 0px 10px 10px; font-size: 2.4rem; font-weight: 600;">
						Kết quả tìm kiếm</h1>
				</div>
				<div class="container-fluid">
					<div class="row">
						<!-- Gallery item -->
						<c:forEach var="post" items="${postSearch}">
							<div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 mb-4 ">
								<div class="bg-white rounded shadow-sm work-item" style="border-top: 3px solid #dc3545;border-bottom: 5px solid #dc3545;">
									<img
										src="${post.thumbnail_url }"
										alt="" class="img-fluid card-img-top"
										style="width:100%;height:200px">
									<div class="p-4">
										<a href="<c:url value = '/post?p=${post.url }'></c:url>"
											class="text-dark">
											<h2>
												<c:out value="${post.title }" />
											</h2></a>
										<p class="text-muted mb-0 fs-14"
											style="overflow: hidden;text-overflow: ellipsis;height:80px">
											<c:out value="${post.description() }" />
										</p>
										<div
											class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
											<p class="mb-0 fs-14">
												<span class="text-muted">${post.location }</span>
											</p>
											<div class="badge badge-danger px-3 rounded-pill fs-primary">
												<c:out value="${post.time() }" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<!-- End -->


					</div>
				</div>
			</div>
		</section>

		
	</main>

	
</body>
</html>
