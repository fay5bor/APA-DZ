<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="/projets2/source/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="/projets2/source/bootstrap/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="/projets2/source/script/script.js"></script>
<title>S'inscrire</title>
</head>
<body>
<%@ include file="header.jsp" %>
<c:if test="${ !empty resultatCD}">
<script type="text/javascript">
swal("Echec de l'opération!", "${resultatCD}", "error");
</script>
</c:if>
<div id="registration">
<h2>Demandez la création de votre compte</h2>

	<div class="form-group col-md-4">
      <label for="typeDem">Vous etes une : </label>
      <select id="typeDem" class="form-control" onchange="showDiv(this)">
        <option value="vide" selected></option>
        <option value="ins">Institution</option>
        <option value="ent">Entreprise</option>
        <option value="per">Personne physique</option>
      </select>
    </div>

<div class="container" id="insForm" style="display:none;">
<form method="post" action="signin" encType="multipart/form-data">
<div class="form-row">
    <label for="img">Image de profile :</label>
    <input type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
  </div>
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="typeIns">Type de l'institution </label>
      <select id="typeIns" name="typeIns" class="form-control">
        <option value="publique">Publique</option>
        <option value="privée">Privée</option>
      </select>
    </div>
    <div class="form-group col-md-6">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="login">Login</label>
      <input type="text" class="form-control" id="login" name="login" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="mdp">Password</label>
      <input type="password" class="form-control" id="mdp" name="mdp" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="nom">Nom de l'institution</label>
    <input type="text" class="form-control" id="nom" name="nom">
    <label for="adresse">Address </label>
    <input type="text" class="form-control" id="adresse" name="adresse"> 
  </div>

  <div class="form-row">
    <label for="motif">Votre motif d'inscription :</label>
    <textarea class="form-control" name="motif" id="motif" rows="3"></textarea>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="signature" name="signature">
      <label class="form-check-label" for="signature">
        J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter
      </label>
    </div>
  </div>
  <input type="text" id="ty" name="ty" value="institution" style="display:none;">
  <button type="submit" class="btn btn-primary">Valider la demande</button>
</form>
</div>

<div class="container" id="entForm" style="display:none;">
<form method="post" action="signin" encType="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="typeEnt">Type de l'entreprise </label>
      <select id="typeEnt" name="typeEnt" class="form-control" >
        <option value="publique">Publique</option>
        <option value="privée">Privée</option>
      </select>
    </div>
    <div class="form-group col-md-6">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="login">Login</label>
      <input type="text" class="form-control" id="login" name="login" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="mdp">Password</label>
      <input type="password" class="form-control" id="mdp" name="mdp" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="nom">Nom de l'entreprise</label>
    <input type="text" class="form-control" id="nom" name="nom">
    <label for="adresse">Address </label>
    <input type="text" class="form-control" id="adresse" name="adresse"> 
  </div>
  <div class="form-group">
    <label for="statut">Statut juridique</label>
    <input type="text" class="form-control" id="statut" name="statut">
    <label for="secteur">Secteur </label>
    <input type="text" class="form-control" id="secteur" name="secteur"> 
    <label for="domaine">Domaine </label>
    <input type="text" class="form-control" id="domaine" name="domaine"> 
  </div>

  <div class="form-row">
    <label for="motif">Votre motif d'inscription :</label>
    <textarea class="form-control" name="motif" id="textArea1" rows="3"></textarea>
  </div>
  <div class="form-row">
    <label for="img">Image de profile :</label>
    <input type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="signature" name="signature">
      <label class="form-check-label" for="signature">
        J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter
      </label>
    </div>
  </div>
  <input type="text" id="ty" name="ty" value="entreprise" style="display:none;">
  <button type="submit" class="btn btn-primary">Valider la demande</button>
</form>
</div>

<div class="container" id="perForm" style="display:none;">
<form method="post" action="signin" encType="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="email">Email</label>
      <input type="email" class="form-control" id="email" name="email" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="login">Login</label>
      <input type="text" class="form-control" id="login" name="login" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="mdp">Password</label>
      <input type="password" class="form-control" id="mdp" name="mdp" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="nom">Votre nom</label>
    <input type="text" class="form-control" id="nom" name="nom">
    <label for="prenom">Votre prenom</label>
    <input type="text" class="form-control" id="prenom" name="prenom">
    <label for="dateN">Votre date de naissence</label>
    <input type="date" class="form-control" id="dateN" name="dateN">
    <label for="adresse">Votre address </label>
    <input type="text" class="form-control" id="adresse" name="adresse"> 
    <label for="profession">Votre profession </label>
    <input type="text" class="form-control" id="profession" name="profession"> 
  </div>

  <div class="form-row">
    <label for="motif">Votre motif d'inscription :</label>
    <textarea class="form-control" name="motif" id="textArea1" rows="3"></textarea>
  </div>
  <div class="form-row">
    <label for="img">Image de profile :</label>
    <input type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="signature" name="signature">
      <label class="form-check-label" for="signature">
        J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter
      </label>
    </div>
  </div>
  <input type="text" id="ty" name="ty" value="personne" style="display:none;">
  <button type="submit" class="btn btn-primary">Valider la demande</button>
</form>
</div>


</div>
</body>
</html>