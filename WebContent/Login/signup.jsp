<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <style>
        input {
            font-size: 1.8rem;
        }
        .register-wrap{
            background: #fff;
            margin: 30px auto;
            width: 400px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        h1 {
            text-align: center;
        }
        .register-submit {
            width: 100%;
            display: flex;
            justify-content: center;
        }
    </style>
</head>

<body style="background: #eee; position: relative;">

    <jsp:include page="../common/header.jsp"></jsp:include>


    <div class="app" style="min-height: 400px;">
        <div class="row">

            <div class="register-wrap">
                <h1>REGISTER</h1>
                <form action="" id="register-form">
                    <div class="input-group mb-3 input-group-lg">
                        <input type="text" class="form-control" name="fullName"  placeholder="Full name" required>
                    </div>
                    <div class="input-group mb-3 input-group-lg">
                        <input type="text" class="form-control" name="email" placeholder="Email" required>
                    </div>
                    <div class="input-group mb-3 input-group-lg">
                        <input type="text" class="form-control" id="username" name="username" 
                        placeholder="Username" required>
                    </div>
                    <div id="msg"></div>
                    <div class="input-group mb-3 input-group-lg">
                        <input type="password" class="form-control" name="password" id="password" 
                        placeholder="Password" required>
                    </div>
                    <div class="input-group mb-3 input-group-lg">
                        <input type="password" class="form-control" id="confirm_password" 
                        placeholder="Confirm Password" required>
                    </div>
                    <div class="register-submit input-group-lg">
                      <input type="submit" style="width: 120px;background-color: #04AA6D !important;border-color:#04AA6D ;" class="btn btn-primary form-control" value="Register">   
                    </div>
                    
                </form>
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
						url: "checkusername",
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
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>