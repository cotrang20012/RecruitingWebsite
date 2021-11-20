<!---->
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
<!--
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tạo bài viết</title>
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/logo.ico" />
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/post.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/home.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/simplemde.min.css">
	<script src="${pageContext.request.contextPath}/scripts/simplemde.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
	<script src="${pageContext.request.contextPath}/scripts/jquery-3.3.1.slim.min.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/highlight.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/highlight.js/latest/styles/github.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/footer.css" />
</head>
<body>
	<jsp:include page="../decorators/navbar.jsp"></jsp:include>
	<div class="container">
		<h3 align="center">TẠO BÀI VIẾT</h3>
		<form action="${pageContext.request.contextPath}/create" method="post">
			<div class="form-group">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Tiêu đề</span>
					</div>
					<input type="text" class="form-control"
						placeholder="Tiêu đề bài viết" name="title">
				</div>
				<div>
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
					    <label class="input-group-text" for="inputGroupSelect01">Chủ đề</label>
					  </div>
					  <select class="custom-select" id="category" name="category">
					    <option selected>Chọn chủ đề cho bài viết...</option>
					    <c:forEach var="cat" items="${lstCat}">
					    	<option value="${cat.getName()}">${cat.getName()}</option>
					    </c:forEach>
					  </select>
					</div>
				</div>
				<textarea name="content" id="content"></textarea>
				<input type="hidden" name="is_create" value="True">
				<input class="btn btn-primary btn-sm btn-block" type="submit"
					value="Post">
			</div>
		</form>
	</div>

	<jsp:include page="../common/footer.jsp"/>
	<jsp:include page="../modals/modalUpload.jsp"></jsp:include>
	
	<hr>

	<script type="text/javascript">
		content = Editor();

		$('.image-upload-wrap').bind('dragover', function() {
			$('.image-upload-wrap').addClass('image-dropping');
		});
		$('.image-upload-wrap').bind('dragleave', function() {
			$('.image-upload-wrap').removeClass('image-dropping');
		});

		$('.upload-btn').hide();
		$('.remove-btn').hide();

	</script>
	<script type="text/javascript">
	function insertImage(simplemde, url)
	{
		var pos = simplemde.codemirror.getCursor();
		simplemde.codemirror.setSelection(pos, pos);
		simplemde.codemirror.replaceSelection("![Figure](" + url + ")");
		
	}
	</script>
</body>
</html>
-->
