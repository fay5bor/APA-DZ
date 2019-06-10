<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APA DZ</title>
<link rel="stylesheet" href="/projets2/source/vendors/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/projets2/source/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/projets2/source/css/style.css">
<link rel="stylesheet" href="/projets2/source/css/t.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>

<script src="/projets2/source/vendors/jquery/jquery.min.js"></script>
<script src="/projets2/source/vendors/magnific-popup/jquery.magnific-popup.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script type="text/javascript" src="/projets2/source/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="/projets2/source/js/java-script.js"></script>
<script src="/projets2/source/js/profil.js"></script>
<c:if test="${ !empty cnx.erreurs}">
<script type="text/javascript" src="/projets2/source/js/loginErr.js"></script>
</c:if>
</body>
</html>