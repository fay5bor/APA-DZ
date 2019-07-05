<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="fichier" class="shadow-sm p-4">
	<div class="row">
		<div class="text-center col-3 center-block">
			<img
				src="${pageContext.request.contextPath}/ressources/images/file.png"
				class="card-img-left w-100">
		</div>
		<div class="col-9">
			<h4><c:out value="${requestScope.document.getNom()}" default="Nom du document"></c:out></h4>
			<h5><c:out value="${requestScope.document.getTaille()} MB" default="Taille du document (MB)"></c:out></h5>
			<p><c:out value="ajouté le ${requestScope.document.getDateAjout()}" default="Ajouté un jour !"></c:out></p>
		</div>
	</div>
</div>
