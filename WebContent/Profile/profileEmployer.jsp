<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
        <title>Thông tin người dùng</title>
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/dashboard.css' />">
    
</head>

<body>

    <jsp:include page="../common/header.jsp"></jsp:include>
	

    <main class="row" style="margin: 0;">
    	<div class="col-lg-2 col-md-2 col-sm-2 col-2 sidebar-left">
            <div class="sidebar-left-title">
                <h1>Dashboard</h1>
            </div>
            <div class="sidebar-left-content">
                <ul class="sidebar-list">
                    <a href="" class="item-link">
                        <li class="sidebar-item item--active">
                            <h2>Profile</h2>
                        </li>
                    </a>

                    <a href="<c:url value='/Dashboard/dashboard_listpost.jsp'/>" class="item-link">
                        <li class="sidebar-item">
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
        	<div class="container rounded bg-white mb-5">
                <div class="row">
                    <div class="col-md-3 border-right">
                        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                        <!-- <img class="rounded-circle mt-5" width="150px"
                                src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"> -->
                        <img class="rounded-circle mt-5" width="150px" height="150px"
                                src="${userProfile.profile_url }" id ="profile-image">
                        <span  class="font-weight-bold"> <c:out value='${userProfile.companyName}'/> </span>
                        <form action="upload" method="post" enctype="multipart/form-data" class="form-group w-100">
						<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg">
						<input type="submit" value="upload">
						</form>
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
                                        class="form-control" placeholder="Email" name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Website</label><input type="text"
                                        class="form-control" placeholder="Email" name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Quy mô</label><input type="text"
                                        class="form-control" placeholder="Email" name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Ngành nghề</label><input type="text"
                                        class="form-control" placeholder="Email" name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                                <div class="col-md-12 mt-3"><label class="labels">Tech stack</label><input type="text"
                                        class="form-control" placeholder="Email" name="email" value="<c:out value='${userProfile.email}'/> " readonly="readonly">
                                </div>
                            </div>

                            <div class="mt-5 text-center">
                   				<form action="profile" method="POST" >
                            	<input type="hidden" name="action" value="update">
                   				<button class="btn btn-primary profile-button" type="button" onclick="EnableReadonly()">Save Profile</button>
                   				</form>
                    			<button class="btn btn-primary profile-button" type="button" onclick="RemoveReadonly()">Edit</button>
                			</div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center experience"><span>Edit
                                    Experience</span><span class="border px-3 p-1 add-experience"><i
                                        class="fa fa-plus"></i>&nbsp;Experience</span></div><br>
                            <div class="col-md-12"><label class="labels">Experience in Designing</label><input
                                    type="text" class="form-control" placeholder="experience" value=""></div> <br>
                            <div class="col-md-12"><label class="labels">Additional Details</label><input
                                    type="text" class="form-control" placeholder="additional details" value="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    </main>


	<jsp:include page="../common/footer.jsp"></jsp:include>
    <script>
        const inputPropertise = document.getElementsByClassName("form-control");
        const avatar = document.getElementById("avatar");
        const profileImg = document.getElementById("profile-image");

        avatar.addEventListener("change", function(){
            const file = this.files[0];
            
            if(file){
                const reader = new FileReader();

                reader.addEventListener("load", function(){
                    profileImg.setAttribute("src",this.result);
                });
                reader.readAsDataURL(file);
            }
        });
        function RemoveReadonly(){
        	inputPropertise.removeAttribute("readonly");
        }
        
        function EnableReadonly(){
        	inputPropertise.setAttribute("readonly","readonly");
        }
    </script>
</body>

</html>