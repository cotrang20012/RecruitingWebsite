<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
        <title>Đồ án Lập trình WEB</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css'/>">
        <link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/font/fontawesome-free-5.15.3-web/css/all.min.css' />">
    </head>
    <body style="background: #eee;position: relative;">
      
        <jsp:include page="/common/header.jsp"></jsp:include>
        <div class="container-fluid">
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
              <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
              </ol>
              <div style="height:100%" class="carousel-inner ">
              <div class="carousel-item active img-style">
                  <img class="d-block w-100 img-style"  src="<c:url value='/assets/img/anh1.png' />" alt="First slide">
              </div>
              <div class="carousel-item img-style">
                  <img class="d-block w-100 img-style"  src="<c:url value='/assets/img/anh2.jpg'/>" alt="Second slide">
              </div>
              <div class="carousel-item img-style">
                  <img class="d-block w-100 img-style"  src="<c:url value='/assets/img/anh3.jpg' />" alt="Third slide">
              </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
              </a>
          </div>
      </div>
        <div class="app">
  
          <div class="row assignment">
            <h2>DANH SÁCH BÀI TẬP</h2>
            <div class="assignment-list">

              <div class="col-sm-2">
                <div class="card assignment-item" style="width: 18rem;min-height: 180px;">
                  <div class="card-body">
                    <a href="${pageContext.request.contextPath}/assignment1" class="card-title">Bài tập 1</a>
                    <p class="card-text">
                      Viết ứng dụng với JSP và Servlet sử dụng mô hình MVC
                    </p>
                  </div>
                </div>
              </div>
  
              <div class="col-sm-2">
                <div class="card assignment-item" style="width: 18rem; min-height: 180px;">
                  <div class="card-body">
                    <a href="${pageContext.request.contextPath}/assignment2" class="card-title">Bài tập 2</a>
                    <p class="card-text">
                      Phân tích yêu cầu và thiết kế sơ đồ chức năng cho ứng dụng Web
                    </p>
                  </div>
                </div>
              </div>
  
              <div class="col-sm-2">
                <div class="card assignment-item" style="width: 18rem;min-height: 180px;">
                  <div class="card-body">
                    <a href="#" class="card-title">Bài tập 3</a>
                    <p class="card-text">
                      Thiết kế Prototype (UI) cho ứng dụng Web ở Bài tập 2
                    </p>
                  </div>
                </div>
              </div>
  
              <div class="col-sm-2">
                <div class="card assignment-item" style="width: 18rem;min-height: 180px;">
                  <div class="card-body">
                    <a href="#" class="card-title">Bài tập 4</a>
                    <p class="card-text">
                      Hoàn thành giao diện người dùng cho ứng dụng web trong Bài tập 3
                    </p>
                  </div>
                </div>
              </div>
  
              <div class="col-sm-2">
                <div class="card assignment-item" style="width: 18rem;min-height: 180px;">
                  <div class="card-body">
                    <a href="#" class="card-title">Bài tập 5</a>
                    <p class="card-text">
                      Sử dụng JSP, JavaScript, Jquery, Bootstrap,... để thiết kế giao diện Website
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>


          <div class="row member">
            <h2>DANH SÁCH THÀNH VIÊN</h2>
            <div class="member-list">
              <div class="col-sm-3">
                  <div class="card card-hover" style="width: 100%">
                      <span class="card-img--center">
                          <img class="card-img-top-w60" src="<c:url value='/assets/img/avt1.jpg' />" alt="Card image cap">
                      </span>
                      <div class="card-body">
                        <h5 class="card-title">Nguyễn Phúc An</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary"><p class="card-btn-text">Chi tiết</p></a>
                      </div>
                    </div>
              </div>
              <div class="col-sm-3">
                  <div class="card card-hover" style="width: 100%">
                      <span class="card-img--center">
                          <img class="card-img-top-w60" src="<c:url value='/assets/img/avt2.jpg' />" alt="Card image cap">
                      </span>
                      <div class="card-body">
                        <h5 class="card-title">Lê Văn Cường</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary"><p class="card-btn-text">Chi tiết</p></a>
                      </div>
                    </div>
              </div>
              <div class="col-sm-3">
                  <div class="card card-hover" style="width: 100%">
                      <span class="card-img--center">
                          <img class="card-img-top-w60" src="<c:url value='/assets/img/avt3.jpg' />" alt="Card image cap">
                      </span>
                      
                      <div class="card-body">
                        <h5 class="card-title">Trần Bảo Duy</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary"><p class="card-btn-text">Chi tiết</p></a>
                      </div>
                    </div>
              </div>
              <div class="col-sm-3">
                  <div class="card card-hover" style="width: 100%">
                      <span class="card-img--center">
                          <img class="card-img-top-w60" src="<c:url value='/assets/img/avt4.jpg' />" alt="Card image cap">
                      </span>
                      <div class="card-body">
                        <h5 class="card-title">Bành Đăng Khoa</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary"><p class="card-btn-text">Chi tiết</p></a>
                      </div>
                    </div>
              </div>
            </div>
          </div>

		<jsp:include page="/common/footer.jsp"></jsp:include>
      </div>      
      
    </body>
</html>
