<%@ include file="/common/taglib.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="<c:url value='/assets/img/favicon.ico'/>">
<title><dec:title default="Insert title here" /></title>
<dec:head />
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/icon-font.min.css' />">

<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/style.css' />">
<link rel="stylesheet" type="text/css" href="<c:url value='/assets/css/main.css' />">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script src="<c:url value='/assets/script/core.js' />"></script>
<script src="<c:url value='/assets/script/script.min.js' />"></script>
<script>
	window.dataLayer = window.dataLayer || [];

	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
</head>
<body>
	<%@include file="/common/header.jsp" %>
	<dec:body/>
	<%@include file="/common/footer.jsp" %>

</body>
</html>