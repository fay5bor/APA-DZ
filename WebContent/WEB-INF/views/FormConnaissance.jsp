<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.younes.beans.Connaissance"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width = device-width, initial-scale = 0.7">
<title>Formulaire d'une Connaissance</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ressources/vendors/summernote/summernote-bs4.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato|Roboto"
	rel="stylesheet">






</head>
<body>
	<jsp:include page="parts/nav-bar.jsp"></jsp:include>

	<div class="w-75 mx-auto">
		<div class="rounded w-100 shadow-sm p-1 m-2 bg-light">
			<h4>${path}</h4>
		</div>

		<form method="POST" action="FormConnaissance" class="needs-validation" enctype="multipart/form-data" novalidate>
			<div class="row my-2 shadow p-2 mb-4 bg-white">
				<div class="col-sm-3">
					<label class="custom-file" id="customJs">
						<span
						class="custom-file-control form-control-file"> 
							<c:choose>
								<c:when test="${empty requestScope.connaissance}">
									<img
									id="id-photo-affich"
									alt="id photo"
									src="${pageContext.request.contextPath}/ressources/images/add-image.svg"
									style="cursor: pointer; width:100%;" class="rounded m-1 p-1 shadow-sm">
								</c:when>
								<c:when test="${!empty requestScope.connaissance}">
									<img
									id="id-photo-affich"
									alt="id photo"
									src="data:image/png;base64,${requestScope.connaissance.getImgString()}"
									style="cursor: pointer; width:100%;" class="rounded m-1 p-1 shadow-sm">
								</c:when>
							</c:choose>
							
						</span>
						<input
						type="file" class="custom-file-input" id="id-photo-input" name="id-photo-input" >
					</label>
				</div>
				<div class="col-sm-9 mt-1">
					<div class="form-group">
						<!-- <label for="nomConnaissance">Titre de cette connaissance</label> -->
						<input type="text" class="form-control rounded"
							id="nomConnaissance" name="nomConnaissance"
							placeholder="Nom de la connaissance"
							value="<c:out value='${requestScope.connaissance.getTitre()}'/>"
							required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">SVP remplissez ce champs.</div>
					</div>

					<div class="form-group">
						<!-- <label for="typeConnaissance">Catégorie de cette connaissance</label> -->
						<input type="text" class="form-control rounded"
							id="typeConnaissance" name="typeConnaissance"
							placeholder="Type de la connaissance"
							value="<c:out value='${requestScope.connaissance.getType()}'/>"
							required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">SVP remplissez ce champs.</div>
					</div>

					<div class="form-group  h-100">
						<!-- <label for="resumeConnaissance">Un petit résume sur cette connaissance</label> -->
						<textarea name="resumeConnaissance" id="resumeConnaissance"
							class="form-control" rows="3"
							placeholder="Résumé sur la connaissance"><c:out
								value='${requestScope.connaissance.getResume()}' /></textarea>
					</div>

				</div>
				<div class="col-sm-12">
					<textarea id="summernote" name="detailConnaissance"> ${requestScope.connaissance.getContenu()} </textarea>
					<button type="submit" class="btn btn-primary my-1">Enregistrer</button>
				</div>
				<div class="col-sm-12">
					<!-- Place for hidden inputs needed to be passed from jsp to doPOST -->
					<c:choose>
						<c:when test="${empty requestScope.connaissance}">
							<input type="hidden" name="idRessource" value="${id_ressource}" />
						</c:when>
						<c:when test="${!empty requestScope.connaissance}">
							<input type="hidden" name="idConnaissance" value="${requestScope.connaissance.getIdConnaissance()}" />
						</c:when>
					</c:choose>
				</div>
			</div>
		</form>

	</div>

	<!-- --------------------------------------- JavaScript --------------------------------------- -->
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.slim.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/popper/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/js/all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/vendors/summernote/summernote-bs4.js"></script>
	<script
		src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>

	<!-- JS pour vérifier les champs obligatoires -->
	<script>
		// Disable form submissions if there are invalid fields
		(function() {
			'use strict';
			window.addEventListener('load',
					function() {
						// Get the forms we want to add validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');
						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}

										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
	<!-- JS pour charger l'editeur summernote -->
	<script>
		$('#summernote')
				.summernote(
						{
							placeholder : 'Veuillez introduire les détails de la connaissance',
							tabsize : 2,
							height : 500,
							toolbar : [
									[ 'misc', [ 'undo', 'redo' ] ],
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[
											'font',
											[ 'strikethrough', 'superscript',
													'subscript' ] ],
									[ 'fontsize', [ 'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									[
											'para',
											[ 'ul', 'ol', 'paragraph', 'style',
													'height' ] ],
									[
											'insert',
											[ 'hr', 'link', 'picture', 'table' ] ],
									[ 'Tools', [ 'fullscreen', 'help' ] ] ]
						});
		$('#summernote').summernote('fontName', 'Lato');
	</script>
	<!-- JS pour charger la photo de connaissance en preview -->
	<script>
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				
				reader.onload = function(e) {
					$('#id-photo-affich').attr('src', e.target.result);
				}
				
				  reader.readAsDataURL(input.files[0]);
			}
		}
			
		$("#id-photo-input").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>