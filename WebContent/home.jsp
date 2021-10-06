<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png"
	href="<c:url value='/assets/img/favicon.ico'/>">
<title>Hệ thống tuyển dụng</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/main.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/css/carousel.css'/>">
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/assets/font/fontawesome-free-5.15.3-web/css/all.min.css' />">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.css">
</head>
<body style="background: #eee; position: relative;">
	<jsp:include page="/common/header.jsp"></jsp:include>

	<main>
		<div class="container-fluid">
			<div class="row seperate_border"
				style="margin: 0 20px; background-color: #fff;">
				<div class="col">
					<div class="bbb_main_container">
						<div class="bbb_viewed_title_container">
							<h1
								style="padding: 20px 0px 10px 0px; font-size: 2.4rem; font-weight: 600;">Best
								selling products</h1>
							<div class="bbb_viewed_nav_container">
								<div class="bbb_viewed_nav bbb_viewed_prev">
									<i class="fas fa-chevron-left"></i>
								</div>
								<div class="bbb_viewed_nav bbb_viewed_next">
									<i class="fas fa-chevron-right"></i>
								</div>
							</div>
						</div>
						<div class="bbb_viewed_slider_container">
							<div class="owl-carousel owl-theme bbb_viewed_slider">
								<div class="owl-item">
									<div
										class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924153/alcatel-smartphones-einsteiger-mittelklasse-neu-3m.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Alkatel Phone</a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item">
									<div
										class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924221/51_be7qfhil.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Samsung LED</a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item">
									<div
										class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924241/8fbb415a2ab2a4de55bb0c8da73c4172--ps.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Samsung Mobile</a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item">
									<div
										class="bbb_viewed_item is_new d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924275/images.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Huawei Power</a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item">
									<div
										class="bbb_viewed_item discount d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924361/21HmjI5eVcL.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Sony Power</a>
											</div>
										</div>
									</div>
								</div>
								<div class="owl-item">
									<div
										class="bbb_viewed_item d-flex flex-column align-items-center justify-content-center text-center">
										<div class="bbb_viewed_image">
											<img
												src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1560924241/8fbb415a2ab2a4de55bb0c8da73c4172--ps.jpg"
												alt="">
										</div>
										<div class="bbb_viewed_content text-center">
											<div class="bbb_viewed_name">
												<a href="#">Speedlink Mobile</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- carousel -->





		<section class="container-fluid">
			<div class="work-wrap seperate_border"
				style="margin: 0 20px; background-color: #fff;">
				<div class="work-title"
					style="padding: 20px 0px 10px 10px; font-size: 2.4rem; font-weight: 600;">
					Danh sách công việc</div>
				<div class="container-fluid">
					<div class="row">
						<!-- Gallery item -->
						<div class="col-xl-3 col-lg-4 col-md-6 mb-4 ">
							<div class="bg-white rounded shadow-sm work-item">
								<img
									src="https://bootstrapious.com/i/snippets/sn-gallery/img-1.jpg"
									alt="" class="img-fluid card-img-top">
								<div class="p-4">
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
									<h2>
										<a href="#" class="text-dark">Red paint cup</a>
									</h2>
									<p class="text-muted mb-0">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit</p>
									<div
										class="d-flex align-items-center justify-content-between rounded-pill bg-light py-2 mt-4">
										<p class="mb-0">
											<span class="text-muted"></span>Quận 3, Hồ Chí Minh
										</p>
										<div
											class="badge badge-danger px-3 rounded-pill font-weight-normal">1
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
