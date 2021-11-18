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
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/bootstrap-tagsinput.css' />">

</head>

<body>

	<jsp:include page="../common/dashboard-header-employer.jsp"></jsp:include>
	
	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="container rounded bg-white mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <!-- <img class="rounded-circle mt-5" width="150px"
                                src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"> -->
                        <img class="rounded-circle mt-5" width="150px" height="150px"
                                src="${userProfile.profile_url }" id ="profile-image">
                        <span  class="font-weight-bold"> <c:out value='${userProfile.companyName}'/> </span>
                    </div>
                    </div>
                    <div class="col-md-5 border-right">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Cài đặt Profile</h4>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12 mt-3">
                                    <label class="labels">Tên công ty</label>
                                    <input type="text" class="form-control" placeholder="Tên công ty" name="companyname"
                                        value="<c:out value='${userProfile.companyName}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3">
                                    <label class="labels">Số điện thoại</label>
                                    <input type="text" class="form-control" placeholder="Số điện thoại" name="phone"
                                        value="<c:out value='${userProfile.phone}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3">
                                    <label class="labels">Địa chỉ</label>
                                    <input type="text" class="form-control" placeholder="Địa chỉ" name="address"
                                        value="<c:out value='${userProfile.address}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Email</label><input type="text"
                                        class="form-control"  name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Website</label><input type="text"
                                        class="form-control"  name="email" value="<c:out value='${userProfile.website}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Quy mô</label><input type="text"
                                        class="form-control"  name="email" value="<c:out value='${userProfile.quymo}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Ngành nghề</label><input type="text"
                                        class="form-control"  name="email" value="<c:out value='${userProfile.nganhnghe}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Tech stack</label><input type="text"
                                        class="form-control"  name="email" value="<c:out value='${userProfile.techstack}'/> " data-role="tagsinput" readonly="readonly" >
                                </div>
                            </div>

                            <div class="mt-5 text-center">
                			</div>
                        </div>
                    </div>
                </div>
            </div>
		</div>
	</div>


	<script src="<c:url value='/assets/script/bootstrap-tagsinput.js' />"></script>
	
</body>

</html>