<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Hệ thống tuyển dụng</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/carousel.css'/>">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
</head>
<body style="background: #eee; position: relative;">
	<jsp:include page="/common/header.jsp"></jsp:include>

	<main>
		<section class="container-fluid mt-2 mb-2">
			<div class="row height d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <div class="search"> 
            	<i class="fa fa-search"></i> 
            	<input type="text" class="form-control" placeholder="Have a question? Ask Now"> 
            	<button class="btn btn-primary">Search</button> 
            </div>
        </div>
    </div>
		</section>
	
		<section class="container-fluid">
            <div class="row seperate_border" style="margin: 0 20px;background-color: #fff;">
                <div class="col">
                    <div class="bbb_main_container">
                        <div class="bbb_viewed_title_container">
                            <h1 style="padding:20px 0px 10px 0px;font-size:2.4rem;font-weight: 600;">Đơn vị tuyển dụng phổ biến</h1>
                            <div class="bbb_viewed_nav_container">
                                <div class="bbb_viewed_nav bbb_viewed_prev"><i class="fas fa-chevron-left"></i></div>
                                <div class="bbb_viewed_nav bbb_viewed_next"><i class="fas fa-chevron-right"></i></div>
                            </div>
                        </div>
                        <div class="bbb_viewed_slider_container">
                            <div class="owl-carousel owl-theme bbb_viewed_slider">
                                <div class="owl-item">
                                    <div class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/itelAvt.jpg' />" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">ITEL</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-item">
                                    <div class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/ekinoAvt.jpg' />" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">Ekino Vietnam</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-item">
                                    <div class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/msbAvt.jpg' />" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">MSB</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-item">
                                    <div class="bbb_viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/cmcAva.jpg' />" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">CMC Global</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-item">
                                    <div class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/viettelAvt.jpg' />" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">Viettel Digital</a></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="owl-item">
                                    <div class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
                                        <div class="bbb_viewed_image"><img src="<c:url value='/assets/img/aswAvt.jpg'/>" alt=""></div>
                                        <div class="bbb_viewed_content text-center">
                                            <div class="bbb_viewed_name"><a href="#">AS White Vietnam</a></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

		<!-- carousel -->


		<section class="container-fluid">
			<div class="work-wrap seperate_border"
				style="margin: 0 20px; background-color: #fff;">
				<div class="work-wrap-tilte mb-2" style="border-bottom: solid 1px #dadada;">
				<h1 style="padding: 20px 0px 10px 10px; font-size: 2.4rem; font-weight: 600;">
					Danh sách công việc</h1>
				</div>
				<div class="container-fluid">
					<div class="row">
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<a href="${pageContext.request.contextPath}/post" class="text-dark"><h2>Tuyển lập trình viên Java</h2></a>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div class="badge badge-danger px-3 rounded-pill fs-primary">1
											Giờ trước</div>
									</div>
								</div>
							</div>
						</div>
						<!-- End -->
						
					</div>
				</div>
			</div>
		</section>
		
		<section class="row justify-content-center mt-5 mb-5">
            <div class="col-6 d-flex justify-content-center">

                <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page">
                    <a class="page-link" href="#">2 <span class="visually-hidden">(current)</span></a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                  </li>
                </ul>
            </div>
        </section>
	</main>


	
	<jsp:include page="/common/footer.jsp"></jsp:include>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.js"></script>
	<script>
        $(document).ready(function() {


            if ($('.bbb_viewed_slider').length) {
                var viewedSlider = $('.bbb_viewed_slider');

                viewedSlider.owlCarousel({
                    loop: true,
                    margin: 30,
                    autoplay: true,
                    autoplayTimeout: 6000,
                    nav: false,
                    dots: false,
                    responsive: {
                        0: {
                            items: 1
                        },
                        575: {
                            items: 2
                        },
                        768: {
                            items: 3
                        },
                        991: {
                            items: 4
                        },
                        1199: {
                            items: 6
                        }
                    }
                });

                if ($('.bbb_viewed_prev').length) {
                    var prev = $('.bbb_viewed_prev');
                    prev.on('click', function() {
                        viewedSlider.trigger('prev.owl.carousel');
                    });
                }

                if ($('.bbb_viewed_next').length) {
                    var next = $('.bbb_viewed_next');
                    next.on('click', function() {
                        viewedSlider.trigger('next.owl.carousel');
                    });
                }
            }


        });
    </script>

</body>
</html>
