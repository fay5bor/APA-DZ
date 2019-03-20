<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Fiche de Connaissance</title>
	<link rel="stylesheet" href="ressources\css\bootstrap.min.css">
	<link rel="stylesheet" href="ressources\css\all.min.css">
	<link rel="stylesheet" href="ressources\css\style.css">
	<link href="https://fonts.googleapis.com/css?family=Lato|Roboto" rel="stylesheet">
	
	<script src="ressources\js\bootstrap.min.js"></script>
	<script defer src="ressources\css\js\all.js"></script>
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
	<div class="form-group has-search">
		<span class="fa fa-search form-control-feedback"></span> <input
			type="text" class="form-control" placeholder="Recherche">
	</div>

		<div class="row px-2">
			<div class="col-sm-9 border border-left-0 border-top-0 border-bottom-0 container">
				<h4>${path}</h4>
				<div class="row m-2">
					<div class="col-sm-4 py-3">
							<img alt="id photo" src="ressources\img\ecology.png" class="rounded w-100">
					</div>
					<div class="col-sm-8">
						<h1>Nom de la connaissance</h1>
						<h4>Nom de l'auteur</h4>
						<span class="tag border p-1 rounded"> Type tag </span>
					</div>
				</div>
				<h1 class="mx-2">Contenu</h1>
				<p class="mx-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid
				nt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
				ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repre
				henderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca</p>
				<h1 class="mx-2">Titre</h1>
				<p class="mx-2">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid
				nt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
				ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repre
				henderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaeca</p>
				
  			</div>
			<div class="col-sm-3">
				<div class="m-2 px-2 border">
					<h4> Nom de la connaissance </h4>
					<p> Résumé sur la connaissance </p>
					<hr/>
					<div class=" border m-3">
							<img alt="id photo" src="ressources\img\plant1.jpg" class="rounded w-100">
					</div>
				</div>
				
				<div class="m-2 px-2 border">
					<h4> Nom de la connaissance </h4>
					<p> Résumé sur la connaissance </p>
					<hr/>
					<div class=" border m-3">
							<img alt="id photo" src="ressources\img\plant2.jpg" class="rounded w-100">
					</div>
				</div>
			</div>
  				
		</div>

</body>
</html>