<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WEB</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css' />">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/base.css' />">
        <link rel="stylesheet" type="text/css" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css' />">
    </head>
    <body style="background: #082032;position: relative;">
      
      <div id="container">
        <section class="background-animation">
          <div class="set-background">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
          </div>
          <div class="set-background set-bg2">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
          </div>
          <div class="set-background set-bg3">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-1.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-2.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-3.png' />" alt="" class="img-background">
            <img src="<c:url value='/assets/img/back-4.png' />" alt="" class="img-background">
          </div>
        </section>
        <header class="header sticky-top">
            
            <nav class="navbar navbar-expand-lg navbar-light ">
              <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Về chúng tôi</a>
                    </li>
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
                        Bài tập
                      </a>
                      <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Bài tập 1</a></li>
                        <li><a class="dropdown-item" href="#">Bài tập 2</a></li>
                        <li><a class="dropdown-item" href="#">Bài tập 3</a></li>
                        <li><a class="dropdown-item" href="#">Bài tập 4</a></li>
                        <li><a class="dropdown-item" href="#">Bài tập 5</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                      </ul>
                    </li>
                  </ul>
                  <div class="nav-animation start-home"></div>
                  <form class="d-flex search-top">
                    <input class="form-control me-2 text-search" type="search" placeholder="Tìm kiếm" aria-label="Search">
                    <button class="btn btn-success" style="width: 150px !important;padding: 0 10px;margin: 0 10px;font-size: 1.6rem;" type="submit">Tìm kiếm</button>
                  </form>
                </div>
              </div>
            </nav>
        </header>
        <div class="app">
        
        
          
          <!-- <div class="col-sm-12">
            <div class="img-wrap">
                <img src="<c:url value='/assets/img/logo.png' />" alt="" class="img-logo">
            </div> 
          </div> -->
    
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
                      <img class="d-block w-100 img-style"  src="<c:url value='/assets/img/anh2.jpg' />" alt="Second slide">
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
  
          <div class="row member">
              <div class="col-sm-3">
                  <div class="card card-hover" style="width: 100%">
                      <svg class="svg-card">
                          <rect class="rect-card"></rect>
                      </svg>
                      <span class="card-img--center">
                          <img class="card-img-top-w60" src="/assets/img/avt1.jpg" alt="Card image cap">
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

        <footer class="footer">
          <div class="footer-wrap">
            <h3 class="footer-content">Mệt rồi!Từ từ làm tiếp :V</h3>
          </div>
        </footer>
      </div>
      
      
        
        
        <script src="<c:url value='/assets/jquery-3.3.1.min.js' />"></script>
        <script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js' />"></script>

    </body>
</html>