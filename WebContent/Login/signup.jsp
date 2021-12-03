<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
        <title>Đăng ký</title>
        
	<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/register.css'/>">
</head>

<body style="background: #eee; position: relative;">



    <div class="app" style="min-height: 400px;">
        <div class="container-fluid">

            <div class="register-wrap">
                <div class="col-md-4 text-center company__info">
                    <span class="company__logo">
                        <img src="<c:url value='/assets/img/logo-login.png' />"
							alt="" class="img-fluid">
                    </span>
                </div>
                <div class="col-md-8  col-xs-12 col-sm-12 register-form">
                    <div class="container-fluid" style="padding:20px 0px">
                        <div class="row justify-content-center"><h1>REGISTER</h1></div>
                        <div class="row">
                            <button id="btn-employee" onclick="employee()" class="btn col-6 btn-choose btn-choose--active">
                                EMPLOYEE
                            </button>
                            <button id="btn-employer" onclick="employer()" class="btn col-6 btn-choose">
                                EMPLOYER
                            </button>
                        </div>
                        <form action="signup" class="form-active" id="employee-form">
                        	<input type="hidden" name="action" value="EMPLOYEE">
                            <div class="row">
                                <input type="text" class="form__input" name="fullName" placeholder="Họ và tên"
                                    required>
                            </div>
                            <div class="row">
                                <input type="text" class="form__input" id="email" name="email" placeholder="Email" required>
                            </div>
                            <div id="msg-email"></div>
                            <div class="row">
                                <input type="text" class="form__input" id="username" name="username"
                                    placeholder="Username" required>
                            </div>
                            <div id="msg"></div>
                            <div class="row">
                                <input type="password" class="form__input" name="password" id="password"
                                    placeholder="Password" required>
                            </div>
                            <div class="row">
                                <input type="password" class="form__input" id="confirm_password"
                                    placeholder="Confirm Password" required>
                            </div>
                            <div class="row justify-content-center">
                                <input type="submit"
                                    class="btn btn-register" value="Đăng ký">
                            </div>
                        </form>
                        <form action="signup" id="employer-form">
                        	<input type="hidden" name="action" value="EMPLOYER">
                            <div class="row">
                                <input type="text" class="form__input" name="fullName" placeholder="Tên công ty"
                                    required>
                            </div>
                            <div class="row">
                                <input type="text" class="form__input" id="email" name="email" placeholder="Email" required>
                            </div>
                            <div id="msg-email"></div>
                            <div class="row">
                                <input type="text" class="form__input" id="username" name="username"
                                    placeholder="Username" required>
                            </div>
                            <div id="msg"></div>
                            <div class="row">
                                <input type="password" class="form__input" name="password" id="password"
                                    placeholder="Password" required>
                            </div>
                            <div class="row">
                                <input type="password" class="form__input" id="confirm_password"
                                    placeholder="Confirm Password" required>
                            </div>
                            <div class="row justify-content-center">
                                <input type="submit"
                                    class="btn btn-register" value="Đăng ký">
                            </div>
                        </form>
                        <div class="row justify-content-center">
                            <p>Đã có tài khoản <a href="${pageContext.request.contextPath}/login">Đăng nhập tại đây</a></p>
                          </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    

	
	<script type="text/javascript">
	var password = document.getElementById("password")
	  , confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
	  if(password.value != confirm_password.value) {
	    confirm_password.setCustomValidity("Passwords Don't Match");
	  } else {
	    confirm_password.setCustomValidity('');
	  }
	}

	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#username').change(function() {
				$('#msg').hide();
				var username=$('#username').val();
					$.ajax({
						type: "POST",
						url: "api-checkusername",
						data: {username:username},
						dataType: "html",
						cache: false,
						success: function(msg) {
							$('#msg').show();
							$('#msg').html(msg);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							$('#msg').show();
							$('#msg').html(textStatus + " " + errorThrown);
						}
					});
			});
		});
		
		$(document).ready(function() {
			$('#email').change(function() {
				$('#msg-email').hide();
				var email=$('#email').val();
					$.ajax({
						type: "POST",
						url: "api-checkemail",
						data: {email:email},
						dataType: "html",
						cache: false,
						success: function(msg) {
							$('#msg-email').show();
							$('#msg-email').html(msg);
						},
						error: function(jqXHR, textStatus, errorThrown) {
							$('#msg-email').show();
							$('#msg-email').html(textStatus + " " + errorThrown);
						}
					});
			});
		});
	</script>

    <script>
        const employee_form=document.getElementById("employee-form");
        const employer_form=document.getElementById("employer-form");
        const btn_employee=document.getElementById("btn-employee");
        const btn_employer=document.getElementById("btn-employer");

        function employee(){
            employee_form.classList.add("form-active");
            employer_form.classList.remove("form-active");
            btn_employee.classList.add("btn-choose--active");
            btn_employer.classList.remove("btn-choose--active");
        }
        function employer(){
            employer_form.classList.add("form-active");
            employee_form.classList.remove("form-active");
            btn_employer.classList.add("btn-choose--active");
            btn_employee.classList.remove("btn-choose--active");
        }

    </script>
</body>

</html>