<%@page import="org.eclipse.jdt.core.compiler.CategorizedProblem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="fr">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width = device-width, initial-scale = 0.7">
<title>Documents APA</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/css/style.css">
<style type="text/css">
/*DocumentsAPA css*/
.search-container {
	height: 70px;
}

.search-bar-icon {
	color: rgb(172, 172, 172);
	font-size: 20px
}

.search-bar-input {
	border: 0;
	border-radius: 0%;
	border-right: 2px solid #2dd393
}

.search-bar-input:focus {
	border-right: 2px solid #2dd393;
	-webkit-box-shadow: none;
	box-shadow: none;
}

.search-bar {
	border-bottom: 3px solid #2dd393;
	border-top: 3px solid #2dd393;
}

@media ( max-width : 575.98px) {
	.card-list-catalogue div :not (:first-child ){
		margin-top: 35 px;
	}
	.search-bar-input {
		width: 95% !important;
	}
	.mobile-filter-btn {
		margin-left: -24px
	}
}

@media ( min-width : 576px) and (max-width: 767.98px) {
	.card-list-catalogue :nth-child(n+3) {
		margin-top: 35px;
	}
	.search-bar-input {
		width: 96% !important;
	}
	.mobile-filter-btn {
		margin-left: -19px
	}
}

@media ( min-width : 768px) and (max-width: 991.98px) {
	.card-list-catalogue :nth-child(n+4) {
		margin-top: 35px;
	}
	.search-bar-input {
		width: 97% !important;
	}
	.mobile-filter-btn {
		margin-left: -14px
	}
}

@media ( min-width : 992px) {
	.card-list-catalogue :nth-child(n+5) {
		margin-top: 35px;
	}
	.search-bar-input {
		width: 97% !important;
	}
}
</style>

</head>

<body>
	<c:set var="search">
		<c:out value="${param.search}" default="" />
	</c:set>
	<c:set var="current">
		<c:out value="${param.page}" default="1" />
	</c:set>
	<c:set var="i">
		<c:out value="${current > 5 ? current-4 : 1}" />
	</c:set>
	<c:set var="min_loop">
		<c:out value="${current+4 >= pages ? pages : current+4}" />
	</c:set>
	<c:choose>
		<c:when test="${empty link}">
			<c:set var="sep" value="?" />
		</c:when>
		<c:otherwise>
			<c:set var="sep" value="&" />
		</c:otherwise>
	</c:choose>

	<jsp:include page="parts/nav-bar2.jsp"></jsp:include>

	<!--                     DocumentsAPA                                              -->
	<div class="m-4">
		<!--                     Search                                              -->
		<div class="row search-container">
			<div class="col-lg-12 col-md-12">
				<div class="row search-bar">
					<div class="col-lg-12 col-11">
						<form id="searchForm" method="get"
							action="${pageContext.request.contextPath}/DocumentsAPA"
							class="form-inline my-2 pl-3">
							<i class="fas fa-search search-bar-icon"></i> <input
								name="search" class="form-control search-bar-input"
								type="search" placeholder="Search" aria-label="Search"
								value="<c:out value="${search}" default="" />">
						</form>
					</div>
				</div>
			</div>

		</div>

		<!--                     /Search                                              -->
		<div class="">
			<div class="row">
				<div class="col-lg-10 col-md-12">
					<c:if test="${fn:length(documents) eq 0}">
						<h1>Pas de documents</h1>
						<h4>Veuillez recherchez</h4>
					</c:if>
					<div class="container">
						<div
							class="row mt-4 d-flex justiy-content-center card-list-catalogue">
							<c:forEach items="${documents}" var="ressource">

								<div
									class="col-lg-4 col-md-4 col-sm-6 col-7 offset-sm-0 offset-2 m-2">
									<div class="card" >
										<c:import url="parts/Fichier.jsp" />
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<%--	<c:if test="${pages > 1}">
						<nav class="mt-5 d-flex align-items-center flex-column"
							aria-label="Page navigation example">
							<ul class="pagination">
								<c:choose>
									<c:when test="${current eq 1}">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="First"> <span aria-hidden="true">First</span>
												<span class="sr-only">First</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/DocumentsAPA<c:out value="${link}" default=""/>"
											aria-label="First"> <span aria-hidden="true">First</span>
												<span class="sr-only">First</span>
										</a></li>
									</c:otherwise>
								</c:choose>
								<c:if test="${i !=1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">...</a></li>
								</c:if>
								<c:forEach var="j" begin="${i}" end="${min_loop}" step="1">
									<c:choose>
										<c:when test="${j eq current }">
											<li class="page-item active"><a class="page-link"><c:out
														value="${ j }" /><span class="sr-only">(current)</span></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="${pageContext.request.contextPath}/DocumentsAPA<c:out value="${link}" default=""/><c:out value= "${sep}" /><c:out value="page=${j}" default=""/>">
													<c:out value="${j}" />
											</a></li>
										</c:otherwise>
									</c:choose>
									<c:if test="${j eq current+4 && j < pages }">
										<li class="page-item disabled"><a class="page-link"
											href="#">...</a></li>
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${current eq pages}">
										<li class="page-item disabled"><a class="page-link"
											href="#" aria-label="Last"> <span aria-hidden="true">Last</span>
												<span class="sr-only">Last</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="${pageContext.request.contextPath}/DocumentsAPA<c:out value="${link}" default=""/><c:out value= "${sep}" /><c:out value="page=${pages}" default=""/>"
											aria-label="Last"> <span aria-hidden="true">Last</span> <span
												class="sr-only">Last</span>
										</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</nav> 
					</c:if> --%>
				</div>


			</div>
		</div>

	</div>
	<!--                     /DocumentsAPA                                              -->

	<!-- --------------------------------------- JavaScript --------------------------------------- -->
	<script
		src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/magnific-popup/jquery.magnific-popup.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/js/all.min.js"></script>

</body>

</html>