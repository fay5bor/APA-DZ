<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 0.7">
	<title>Fiche de Connaissance</title>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
	<style type="text/css">
	/* ------------------------ Younes CSS ------------------------ */
	
	.search-container {
	    height: 50px;
	}
	
	.search-bar-icon {
	    color: #84B750;
	    font-size: 20px
	}
	
	.search-bar-input {
		font-family: 'Lato', sans-serif;
	    border: 0;
	    width: 90% !important;
	    border-radius: 0%	
	}
	
	.search-bar-input:focus {
		font-family: 'Lato', sans-serif;
	    -webkit-box-shadow: none;
	    box-shadow: none;
	}
	
	.search-bar {
		font-family: 'Lato', sans-serif;
	    border-bottom: 3px solid #84B750;
	    border-top: 3px solid #84B750;
	    height: 100%
	}
	
	/* ------------------------ Younes CSS - end ------------------------ */
	</style>
</head>
<body>
	<jsp:include page="parts/nav-bar.jsp"></jsp:include>	
		
	<div class="search-container mb-1">
	    <form id="searchForm" method="get" action="${pageContext.request.contextPath}/Catalogue" class="form-inline my-2 my-lg-0 search-bar pl-3">
	        <i class="fas fa-search search-bar-icon"></i>
	        <input name="search" class="form-control search-bar-input" type="search" placeholder="Search" aria-label="Search" value="${empty search ? search : ''}" >
	    </form>
    </div>
	<div class="row px-2">
		<div class="col-sm-9 border border-left-0 border-top-0 border-bottom-0 container">
			<div class="rounded w-100 shadow-sm p-1 mb-2 bg-light"> <h4>${path}</h4> </div>
			
			<div class="shadow p-2 mb-4 bg-white h-100">
				<div class="row m-2 p-2 mb-4">
					<div class="col-sm-3 py-3">
						<c:choose>
							<c:when test="${empty requestScope.connaissance.getImage()}">
								<img alt="id photo" src="${pageContext.request.contextPath}/ressources/images/default_image.png" class="rounded w-100">
							</c:when>
							<c:when test="${!empty requestScope.connaissance.getImage()}">
								<img alt="id photo" src="data:image/png;base64,${requestScope.connaissance.getImageString()}" class="rounded w-100">
							</c:when>
						</c:choose>
					
					
							
					</div>
					<div class="col-sm-9 my-1">
						<h1><c:out value="${requestScope.connaissance.getTitre()}" default="Nom de la connaissance"/></h1>
						<h4><c:out value="${requestScope.connaissance.getChercheur()}" default="Nom de l'auteur"/></h4>
						<h4><c:out value="${requestScope.connaissance.getType()}" default="Type de la connaissance"/></h4>
						<a href="FormConnaissance?id_con=${requestScope.connaissance.getIdConnaissance()}" class="btn my-btn-outline">Modifier</a>
						
					</div>
				</div>
				<hr class="w-75"/>
				<p class="mx-3" style =" align: justify;"><c:out value="${requestScope.connaissance.getContenu()}" default="Détails sur la connaissance" escapeXml="false"/></p>
			</div>
 			</div>
		<div class="col-sm-3">
			<div class="rounded w-100 shadow-sm p-1 mb-2 bg-light"> <h4>Autres</h4> </div>
			<c:forEach   items="${cartes}" var="carte">
				<c:set var="carte" value="${carte}" scope="request"/>
				<c:import url="parts/CarteConnaissance.jsp"/>
			</c:forEach>
		</div>
 				
	</div>
	
	<!-- --------------------------------------- JavaScript --------------------------------------- -->
	<script src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>
	<script src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/js/all.min.js"></script>
    
</body>
</html>