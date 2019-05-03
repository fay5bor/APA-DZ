<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Acceuil DZ APA</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style.css">
</head>

<body>

    <!------------------------------>

   <jsp:include page="parts/nav-bar.jsp"></jsp:include>
   
   <jsp:include page="parts/banner.jsp"></jsp:include>
   
   <jsp:include page="parts/help.jsp"></jsp:include>

   <jsp:include page="parts/devider.jsp"></jsp:include>

   <jsp:include page="parts/ressource.jsp"></jsp:include>
   
   <jsp:include page="parts/devider.jsp"></jsp:include>
    
   <jsp:include page="parts/emplacement.jsp"></jsp:include>
   
   <jsp:include page="parts/devider.jsp"></jsp:include>
   
   <jsp:include page="parts/news-letter.jsp"></jsp:include>
   
   <jsp:include page="parts/contact-us.jsp"></jsp:include>
    
    <script src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>


</body>

</html>