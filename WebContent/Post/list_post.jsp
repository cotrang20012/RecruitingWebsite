<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thông tin bài đăng</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,100&display=swap&subset=vietnamese" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/dashboard.css' />">

</head>

<body>


	<jsp:include page="../common/main-dashboard-employee.jsp"></jsp:include>
	
	<div class="main-container">
		<div class="pd-ltr-20">
			
			<div class="card-box mb-30">
					<div class="pd-20">
						<h4 class="text-blue h4">Data Table Simple</h4>
						<p class="mb-0">you can find more options <a class="text-primary" href="https://datatables.net/" target="_blank">Click Here</a></p>
					</div>
					<div class="pb-20">
						<table class="data-table table stripe hover nowrap">
							<thead>
								<tr>
									<th class="table-plus datatable-nosort">Name</th>
									<th>Age</th>
									<th>Office</th>
									<th>Address</th>
									<th>Start Date</th>
									<th class="datatable-nosort">Action</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="table-plus">Gloria F. Mead</td>
									<td>25</td>
									<td>Sagittarius</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>20</td>
									<td>Gemini</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>25</td>
									<td>Gemini</td>
									<td>2829 Trainer Avenue Peoria, IL 61602 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>20</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>18</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Sagittarius</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-plus">Andrea J. Cagle</td>
									<td>30</td>
									<td>Gemini</td>
									<td>1280 Prospect Valley Road Long Beach, CA 90802 </td>
									<td>29-03-2018</td>
									<td>
										<div class="dropdown">
											<a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown">
												<i class="dw dw-more"></i>
											</a>
											<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
												<a class="dropdown-item" href="#"><i class="dw dw-eye"></i> View</a>
												<a class="dropdown-item" href="#"><i class="dw dw-edit2"></i> Edit</a>
												<a class="dropdown-item" href="#"><i class="dw dw-delete-3"></i> Delete</a>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			
			
		</div>
	</div>


		<script src="<c:url value='/assets/plugins/datatables/js/jquery.dataTables.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/dataTables.bootstrap4.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/dataTables.responsive.min.js'/>"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/responsive.bootstrap4.min.js'/>"></script>
	<!-- buttons for Export datatable -->
	<script src="<c:url value='/assets/plugins/datatables/js/dataTables.buttons.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/buttons.bootstrap4.min.js'/>"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/buttons.print.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/buttons.html5.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/buttons.flash.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/pdfmake.min.js' />"></script>
	<script src="<c:url value='/assets/plugins/datatables/js/vfs_fonts.js' />"></script>
	<script src="<c:url value='/assets/script/datatable-setting.js' />"></script>

	<script>
		const inputPropertise = document.getElementsByClassName("form-control");
		const avatar = document.getElementById("avatar");
		const profileImg = document.getElementById("profile-image");

		avatar.addEventListener("change", function() {
			const file = this.files[0];

			if (file) {
				const reader = new FileReader();

				reader.addEventListener("load", function() {
					profileImg.setAttribute("src", this.result);
				});
				reader.readAsDataURL(file);
			}
		});

		function RemoveReadonly() {
			var i;
			for (i = 0; i < inputPropertise.length; i++) {
				inputPropertise[i].removeAttribute("readonly");
			}
		}

		function EnableReadonly() {
			var i;
			for (i = 0; i < inputPropertise.length; i++) {
				inputPropertise[i].setAttribute("readonly", "readonly");
			}
		}
	</script>
</body>

</html>