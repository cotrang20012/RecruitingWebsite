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
 <link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/simditor.css' />" />

  <script type="text/javascript" src="<c:url value='/assets/script/jquery.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/assets/script/module.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/script/hotkeys.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/script/uploader.js' />"></script>
<script type="text/javascript" src="<c:url value='/assets/script/simditor.js' />"></script>

</head>
<body style="background: #eee; position: relative;">
	<jsp:include page="/common/header.jsp"></jsp:include>

	<main>
		
		<section class="row justify-content-center">
            
            <form action="" class="col-10">
                <div class="form-group">
                    <label class="fs-16">Tiêu đề</label>
                    <input type="text" class="form-control" name="tilte">
                    
                </div>
                <div class="form-group">
                    <label class="fs-16">input plaintext</label>
                    <input type="text" readonly="" class="form-control-plaintext" value="email@example.com">
                </div>
                <div class="form-group">
                    <label class="fs-16">Nội dung</label>
                    <textarea id="editor" name="content"></textarea>
                </div>
                
                <div class="form-group row justify-content-center">
                    <input type="submit" value="Đăng tuyển" class="col-2 btn btn--common fs-16">
                </div>
            </form>


        </section>

		
	</main>


	
	<jsp:include page="/common/footer.jsp"></jsp:include>
    <script type="text/javascript">

    var editor = new Simditor({
      textarea: $('#editor')
      //optional options
    });
  </script>

</body>
</html>
