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
		<section class="container-fluid">
        <div class="row">
            <div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <div class="h5">@Lee Cường</div>
                        <div class="h7 text-muted">Fullname : Lee Cường</div>
                        <div class="h7">Developer of web applications, JavaScript, Java, Python, C/C++.
                        </div>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="h6 text-muted">Followers</div>
                            <div class="h5">5.2342</div>
                        </li>
                        <li class="list-group-item">
                            <div class="h6 text-muted">Following</div>
                            <div class="h5">6758</div>
                        </li>
                        <li class="list-group-item">Vestibulum at eros</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6 gedf-main">

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">Make
                                    a publication</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">Images</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" id="message" rows="3" placeholder="What are you thinking?"></textarea>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-primary">share</button>
                            </div>
                            <div class="btn-group">
                                <button id="btnGroupDrop1" type="button" class="btn btn-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                    <i class="fa fa-globe"></i>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="btnGroupDrop1">
                                    <a class="dropdown-item" href="#"><i class="fa fa-globe"></i> Public</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-users"></i> Friends</a>
                                    <a class="dropdown-item" href="#"><i class="fa fa-user"></i> Just me</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Post /////-->

                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://scontent.fdad1-1.fna.fbcdn.net/v/t1.6435-9/244751300_3008463426100929_846146406731092230_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=Bm0FvYRqHzsAX_7eZiI&_nc_ht=scontent.fdad1-1.fna&oh=9a1424bb50d06e203e33b8fe221deaf5&oe=6195D245" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@LeeCuong</div>
                                    <div class="h7 text-muted">Lee Cường</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>10 min ago</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title">Technical Manager | 2,000 - 4,000 USD</h5>
                        </a>

                        <p class="card-text">
                            Mô tả công việc:

Plan and monitor deliveries of teams with high quality and within schedule.
Review and support technical requirement writing from business requirements.
Support sales team for resolving technical issues, checking risks.
Architect system, infrastructure, application, and deployment model.
Review the architecture of new features to align with architecture portfolios of the company.
Provide design principles, application design, infrastructure design, and best practices of design.
Monitor the progress of development to align with business goals.
Work with DevOps on release documents and release plans to align with business goals.
Coordinate with support teams to resolve production issues in the priority order.
Build a core team of passionate technical professionals and high-performance culture.
Train and coach teams to apply and follow the software development process of the company.
Develop the overall delivery roadmap for multiple technical initiatives.
Other tasks are assigned by the Director.
Yêu cầu công việc:

BS, MS, and/or Ph.D. degree in computer science, software engineering, or a related technical field
10+ years of experience in the software industry
9+ years of experience in leading or guiding teams on the following:
Develop & Analyze the requirements and then deliver them to developers
Architect system, infrastructure, and deployment
Architect applications from both front-end, back-end, and data storage
Writing technical design, infrastructure design, and deployment model
Develop applications with high quality within schedule
Develop product lines and roadmaps in alignment with business goals
5+ years of experience in leading or guiding teams of web and mobile development with team size 10 to 30+ members
Experience in leading or guiding teams to build large-scale, resilient, reliable, secured and cost-effective applications
Experience in leading or guiding teams to resolve technical issues and/or challenges
Experience in leading or guiding teams to study and apply new technologies
Experience in leading or guiding teams into producing and deploying high-quality code that is cost-effective, readable, cohesive, non-redundant, well encapsulated, loosely coupled, and testable
Experience in guiding the design and development of applications from engineering requirements and IT infrastructure design, to the final product while sustaining high morale in the team
Experience in leading teams of technical leads, business analysts, product owners, QA analysts, UI/UX designers, and software developers on several interrelated applications (webs and mobiles) deployed on various technologies such as Javascript, Angular Typescript, React, Android, iOS, Database, Cloud architecture, etc.
Solid knowledge of software development and product management
Experience in agile development processes, such as Scrum, Kanban
Ability to work effectively, in a fast-paced environment that is transitioning from the start-up phase
Good at communication skills both English & Vietnamese
Common Skill Set Required :

Build automation
Source code management
                        </p>
                            <div>
                            <span class="badge badge-primary">Technical</span>
                            <span class="badge badge-primary">ManagerSoftware</span>
                            <span class="badge badge-primary">Development</span>
                            <span class="badge badge-primary">CTO</span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Follow</a>
                    </div>
                </div>
                <!-- Post /////-->


                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://scontent.fdad1-1.fna.fbcdn.net/v/t1.6435-9/152322015_2531547977137541_3180734770273419782_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=dVp0aKEpXtcAX8twcnx&_nc_ht=scontent.fdad1-1.fna&oh=f2741bc0734371ca1ca405e9d8ed8338&oe=6196055F" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">TranDuy</div>
                                    <div class="h7 text-muted">Trần Duy</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> 10 min ago</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title"> 10 Back-end Developers (PHP, English) 800 - 2,000 USD</h5>
                        </a>

                        <p class="card-text">
                            Mô tả công việc:

You will work closely with a Project Manager and DevOps Engineer in each project.
Analyze product requirements and specifications to create, communicate, and implement & suggest for the technical design (Jira).
Decide which technologies are going to be used in the project and define the overall architecture.
Learn new technologies, languages, and techniques so that you are able to adapt to the requirements of the project.
Collaborate with other team members to define the internal processes and initiatives to help the company accomplish its mission.
Yêu cầu công việc:

At least 3 years experience only for PHP (5.x, 7.x), PHP based frameworks
Experience with E-commerce and related frameworks such as Magento, Prestashop, WordPress...
Experience with web services and REST API implementation and documentation (Postman)
Experience with using Payment Gateway Service such as PayPal, MoMo, etc
Experience in AWS EC2, S3, Lambda, ELB (can use Terraform is a plus)
Experience with databases (MySQL, MongoDB, MSSQL)
Experience with Search Engine Optimization
Experience in Microservice (Docker), Proxy server
Be able to speak English (Fluent is a plus)
                        </p>
                        <div>
                            <span class="badge badge-primary">JavaScript</span>
                            <span class="badge badge-primary">Android</span>
                            <span class="badge badge-primary">PHP</span>
                            <span class="badge badge-primary">Node.js</span>
                            <span class="badge badge-primary">Ruby</span>
                            <span class="badge badge-primary">Paython</span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Follow</a>
                    </div>
                </div>
                <!-- Post /////-->


                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.6435-9/81211978_3094163690808040_2409999788662587392_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lykZXgUd_9AAX__pzmp&_nc_ht=scontent.fdad2-1.fna&oh=b321f024e195706142997af6183f58ea&oe=61972C75" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">AnNguyen</div>
                                    <div class="h7 text-muted">An Nguyễn</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i> Hace 40 min</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title">UI/ UX Designer (Web/ Mobile, English) 700 - 1,500 USD</h5>
                        </a>

                        <p class="card-text">
                            Mô tả công việc:

Collaborate closely with PM to create designs for projects and help define detailed requirements as prototypes, descriptions and detailed wireframes;
Design wireframe and create in the direction of art (design guideline for customers), UI/ UX;
Develop and present documentation, user flows, annotated wireframes, and interactive prototypes;
Develop the designs and design materials in sufficient detail that they can be expressed as clear features suitable for implementation by software development teams;
Work with Developers to ensure the designs are implemented as intended and the integrity of the user experience is maintained in the final product;
Facilitate our product vision by researching, conceiving, sketching, prototyping, and user-testing experiences;
Fulfill the other requests of the Korean Director.
Yêu cầu công việc:

Must have

Have at least 3 years of experiences in UI/ UX design (Mobile and Web apps);
Have experiences using tools like Figma, Sketch, or XD (Figma is a plus);
Specialize in layout and colors. The portfolio is a must. The portfolio should showcase a good mix of web and mobile applications.
Be able to communicate in English (Fluent is a plus)
Good to have

Care for the quality of the work
Very good communication skills
Can pick up new tools quickly
Confident, independent, and meticulous
Must have the ability to cope with tight deadlines
                            <a href="https://mega.nz/#!1J01nRIb!lMZ4B_DR2UWi9SRQK5TTzU1PmQpDtbZkMZjAIbv97hU" target="_blank">https://mega.nz/#!1J01nRIb!lMZ4B_DR2UWi9SRQK5TTzU1PmQpDtbZkMZjAIbv97hU</a>
                        </p>
                        <div>
                            <span class="badge badge-primary">Sketch</span>
                            <span class="badge badge-primary">Figma</span>
                            <span class="badge badge-primary">UX/UI </span>
                            <span class="badge badge-primary">Design</span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Follow</a>
                    </div>
                </div>
                <!-- Post /////-->
                <!--- \\\\\\\Post-->
                <div class="card gedf-card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="45" src="https://scontent.fdad1-3.fna.fbcdn.net/v/t1.6435-9/117176476_2717943211815565_7364217704487558253_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=hpi3nrQVxRwAX_MXQa9&_nc_ht=scontent.fdad1-3.fna&oh=c04622a798417996242a0f8ef25cc6c0&oe=61972DF7" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0">@DarkKhoa</div>
                                    <div class="h7 text-muted">Khoa Đăng</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <button class="btn btn-link dropdown-toggle" type="button" id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fa fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop1">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2"> <i class="fa fa-clock-o"></i>10 min ago</div>
                        <a class="card-link" href="#">
                            <h5 class="card-title">10 Backend Developer (Javascript, NodeJS) 700 - 2,000 USD</h5>
                        </a>

                        <p class="card-text">
                            Mô tả công việc:

You will work closely with a Project Manager and DevOps Engineer in each project.
Analyze product requirements and specifications to create, communicate, and implement & suggest for the technical design. (Jira)
Decide which technologies are going to be used in the project and define the overall architecture.
Learn new technologies, languages, and techniques so that you are able to adapt to the requirements of the project.
Collaborate with other team members to define the internal processes and initiatives to help the company accomplish its mission.
Yêu cầu công việc:

At least 2 years experiences only for Node JS, Nest JS, Express
Experience with Go, Go routine, Python experience (Fluent is a plus)
Experience with web services and REST API implementation and documentation (Postman)
Experience in AWS EC2, S3, Lambda, ELB, (can use Terraform is a plus)
Experience with database (MySQL, MongoDB, MSSQL)
Experience in Microservice (Docker), Proxy server
Be able to speak English (Fluent is a plus)
                        </p>
                         <div>
                            <span class="badge badge-primary">NodeJS</span>
                            <span class="badge badge-primary">NestJS</span>
                            <span class="badge badge-primary">Express</span>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a href="#" class="card-link"><i class="fa fa-gittip"></i> Like</a>
                        <a href="#" class="card-link"><i class="fa fa-comment"></i> Comment</a>
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i> Follow</a>
                    </div>
                </div>
                <!-- Post /////-->
            </div>
        </div>
		</section>

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
									<a href="#" class="text-dark"><h2>Red paint cup</h2></a>
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
