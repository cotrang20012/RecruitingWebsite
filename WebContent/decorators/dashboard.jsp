
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title><dec:title default="Insert title here" /></title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/icon-font.min.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/core.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style.css' />">


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="<c:url value='/assets/script/core.js' />"></script>
<script src="<c:url value='/assets/script/script.min.js' />"></script>
<script src="<c:url value='/assets/script/layout-settings.js' />"></script>
<script src="<c:url value='/assets/script/dashboard.js' />"></script>
  
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
<dec:head/>
</head>
<body>
	<%@include file="/common/dashboard-header.jsp"%>
	<dec:body />

</body>
</html>