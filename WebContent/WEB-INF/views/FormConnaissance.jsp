<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Formulaire d'une Connaissance</title>

<!-- include summernote css -->
<link rel="stylesheet" href="ressources/css/bootstrap.min.css">
<link rel="stylesheet" href="ressources/css/all.min.css">
<link rel="stylesheet" href="ressources/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
 
	
<!-- include js -->
<script src="ressources/js/jquery-3.3.1.min.js"></script>
<script src="ressources/js/popper.min.js"></script>
<script src="ressources/js/bootstrap.min.js"></script>
<script defer src="ressources/js/all.min.js"></script>

<!-- include summernote css/js -->
<link href="ressources/summernote/summernote-bs4.css" rel="stylesheet">
<script src="ressources/summernote/summernote-bs4.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
			</ul>
		</div>
	</nav>

	<div class="w-75 mx-auto">
		<div class="rounded w-100 shadow-sm p-1 m-2 bg-light">
			<h4>${path}</h4>
		</div>
		
			

		<form method="POST" action="FormConnaissance" class="needs-validation" novalidate>
			<div class="row my-2 shadow p-2 mb-4 bg-white">
				<div class="col-sm-3">
					<img alt="id photo" src="ressources\img\add_photo.svg"
						class="rounded h-100">
				</div>
				<div class="col-sm-9 mt-1">
					<div class="form-group">
						<input type="text" class="form-control rounded" id="nomConnaissance" name="nomConnaissance"
						 placeholder="Nom de la connaissance" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">SVP remplissez ce champs.</div>
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control rounded" id="nomAuteur" name="nomAuteur"
						 placeholder="Nom de l'auteur" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">SVP remplissez ce champs.</div>
					</div>
					
					<div class="m-1">
						<span class="tag border mx-1 p-1 rounded" style="height : 2em;"> Type tag </span>
						<span class="tag border mx-1 p-1 rounded" style="height : 2em;"> Type tag </span>
						<span class="fa fa-plus border mx-1 p-1 rounded" style="height : 2em; width : 2em"></span>
					</div>
				</div>
				<div class ="col-sm-12">
					<textarea id="summernote" name="detailConnaissance"></textarea>
					<button type="submit" class="btn btn-primary my-1">Enregistrer</button>
				</div>	
			</div>
		</form>

	</div>

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
	<script>
      $('#summernote').summernote({
	        placeholder: 'Veuillez introduire les détails de la connaissance',
	        tabsize: 2,
	        height: 500,
	        toolbar: [            
	        	['misc', ['undo', 'redo']],
	            ['style', ['bold', 'italic', 'underline', 'clear']],
	            ['font', ['strikethrough', 'superscript', 'subscript']],
	            ['fontsize', ['fontsize']],
	            ['color', ['color']],
	            ['para', ['ul', 'ol', 'paragraph', 'style', 'height']],
	            ['insert', ['hr', 'link', 'picture', 'table']],
	            ['Tools', ['fullscreen', 'help']]
	          ]
      });
      $('#summernote').summernote('fontName', 'Lato');
    </script>
</body>
</html>