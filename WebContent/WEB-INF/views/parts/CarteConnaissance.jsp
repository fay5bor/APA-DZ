<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<div id="carteConnaissance" onclick="location.href='FicheConnaissance?id_con=${requestScope.carte.getIdConnaissance()}';" class="shadow-sm p-4 mb-4">
	<h4> <c:out value="${requestScope.carte.getTitre()}">Nom de la connaissance</c:out> </h4>
	<h5> <c:out value="${requestScope.carte.getType()}">Type de la connaissance</c:out> </h5>
	<p> <c:out value="${requestScope.carte.getResume()}">Aucun resume disponible</c:out> </p>
	<hr/>

	<div class="mt-3">
	<c:choose>
			<c:when test="${empty requestScope.carte.getImage()}">
				<img alt="id photo" src="${pageContext.request.contextPath}/ressources/images/default_image.png" class="rounded w-100">
			</c:when>
			<c:when test="${!empty requestScope.connaissance.getImage()}">
				<img alt="id photo" src="data:image/png;base64,${requestScope.carte.getImageString()}" class="rounded w-100">
			</c:when>
		</c:choose>
	</div>
</div>
