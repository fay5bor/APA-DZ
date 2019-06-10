<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/projets2/source/vendors/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/projets2/source/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/projets2/source/css/style.css">
<link rel="stylesheet" href="/projets2/source/css/t.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>	

<div class="content content-profil">
        <div class="row">          
          <c:if test="${ !empty sessionScope['utilisateur']}">
          	<c:choose>
          		<c:when test="${ sessionScope['utilisateur'].type=='institution' }">
  				  <div class="col-md-8">
		            <div class="card card-profil">
		              <div class="card-header card-header-profil">
		                <h5 class="title"><b>Editer votre profile</b></h5>
		              </div>
		              <div class="card-body">
		              	<c:if test="${ !empty institution}">
		              	<form method="post" action="profil" id="formIns" accept-charset="UTF-8">
		                  <div class="row">
		                    <div class="col-md-5 pr-md-1">
		                      <div class="form-group">
		                        <label>Login</label>
		                        <input type="text" class="form-control" disabled value="${sessionScope['utilisateur'].login}" name="login" id="login">
		                      </div>
		                    </div>
		                    <div class="col-md-3 px-md-1">
		                      <div class="form-group">
		                        <label>Mot de passe</label>
		                        <input type="password" class="form-control" value="${sessionScope['utilisateur'].mdp}" name="mdp" id="mdp">
		                        <a href="#0" class="hide-password">show</a>
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Nom</label>
		                        <input type="text" class="form-control" placeholder="Company" value="${institution.nom}" name="nom" id="nom">
		                      </div>
		                    </div>
		                    <div class="col-md-6 pl-md-1">
		                      <div class="form-group">
		                        <label style = "display: block;">Type</label>
		                        <select id="resUsed" name="resUsed" class="ins-select">
		                        	<c:if test="${institution.type=='publique'}">
		                        		<option value="publique" selected>Publique</option>
		                        		<option value="privée">Privée</option>
		                        	</c:if>
		                        	<c:if test="${institution.type=='privée'}">
		                        		<option value="publique">Publique</option>
		                        		<option value="privée" selected>Privée</option>
		                        	</c:if>
	                        	</select>
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Address</label>
		                        <input type="text" class="form-control" placeholder="Home Address" value="${institution.adresse}" name="adresse" id="adresse">
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" placeholder="Home Address" value="${institution.email}" name="email" id="email">
		                      </div>
		                    </div>
		                  </div>		                  		                  
		                </form>
		              	</c:if>		                
		              </div>
		              <div class="card-footer">
		                <button type="submit" class="btn btn-fill btn-primary-profil" form="formIns">Save</button>
		              </div>
		            </div>
          		</div>
				</c:when>
				<c:when test="${ sessionScope['utilisateur'].type=='entreprise' }">
  					<div class="col-md-8">
		            <div class="card card-profil">
		              <div class="card-header card-header-profil">
		                <h5 class="title"><b>Editer votre profile</b></h5>
		              </div>
		              <div class="card-body">
		              	<c:if test="${ !empty entreprise}">
		              	  <form method="post" action="profil" id="formEnt">
		                  <div class="row">
			                    <div class="col-md-5 pr-md-1">
			                      <div class="form-group">
			                        <label>Login</label>
			                        <input type="text" class="form-control" disabled value="${sessionScope['utilisateur'].login}" name="login" id="login">
			                      </div>
			                    </div>
			                    <div class="col-md-3 px-md-1">
			                      <div class="form-group">
			                        <label>Mot de passe</label>
			                        <input type="password" class="form-control" value="${sessionScope['utilisateur'].mdp}" name="mdp" id="mdp">
			                        <a href="#0" class="hide-password">show</a>
			                      </div>
			                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Nom</label>
		                        <input type="text" class="form-control" value="${entreprise.nom}" name="nom" id="nom">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Statut juridique</label>
		                        <input type="text" class="form-control" value="${entreprise.statut}" name="statut" id="statut">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Secteur</label>
		                        <input type="text" class="form-control" value="${entreprise.secteur}" name="secteur" id="secteur">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Domaine</label>
		                        <input type="text" class="form-control" value="${entreprise.domaine}" name="domaine" id="domaine">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Address</label>
		                        <input type="text" class="form-control" value="${entreprise.adresse}" name="adresse" id="adresse">
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" value="${entreprise.email}" name="email" id="email">
		                      </div>
		                    </div>
		                  </div>		                  		                  
		                </form>		              
		              	</c:if>
		              </div>
		              <div class="card-footer">
		                <button type="submit" class="btn btn-fill btn-primary-profil" form="formEnt">Save</button>
		              </div>
		            </div>
          		</div>
				</c:when>
				<c:when test="${ sessionScope['utilisateur'].type=='personne_physique' }">
  					<div class="col-md-8">
		            <div class="card card-profil">
		              <div class="card-header card-header-profil">
		                <h5 class="title"><b>Editer votre profile</b></h5>
		              </div>
		              <div class="card-body">
		              	<c:if test="${ !empty personne}">
		              	<form method="post" action="profil" id="formPer">
		                  <div class="row">
			                    <div class="col-md-5 pr-md-1">
			                      <div class="form-group">
			                        <label>Login</label>
			                        <input type="text" class="form-control" disabled value="${sessionScope['utilisateur'].login}" name="login" id="login">
			                      </div>
			                    </div>
			                    <div class="col-md-3 px-md-1">
			                      <div class="form-group">
			                        <label>Mot de passe</label>
			                        <input type="password" class="form-control" value="${sessionScope['utilisateur'].mdp}" name="mdp" id="mdp">
			                        <a href="#0" class="hide-password">show</a>
			                      </div>
			                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Nom</label>
		                        <input type="text" class="form-control" value="${personne.nom}" name="nom" id="nom">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Prenom</label>
		                        <input type="text" class="form-control" value="${personne.prenom}" name="prenom" id="prenom">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Date de naissance</label>${personne.dateN}
		                        <input type="date" class="form-control" value="${personne.dateN}" name="dateN" id="dateN">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Profession</label>
		                        <input type="text" class="form-control" value="${personne.profession}" name="profession" id="profession">
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" value="${personne.email}" name="email" id="email">
		                      </div>
		                    </div>
		                  </div>		                  		                  
		                </form>
		              	</c:if>
		              </div>
		              <div class="card-footer">
		                <button type="submit" class="btn btn-fill btn-primary-profil" form="formPer">Save</button>
		              </div>
		            </div>
          		</div>
				</c:when>
				<c:when test="${ sessionScope['utilisateur'].type=='chercheur' }">
  					<div class="col-md-8">
		            <div class="card card-profil">
		              <div class="card-header card-header-profil">
		                <h5 class="title"><b>Editer votre profile</b></h5>
		              </div>
		              <div class="card-body">
		              	<c:if test="${ !empty chercheur}">
		              	  <form method="post" action="profil" id="formCher">
		                  <div class="row">
			                    <div class="col-md-5 pr-md-1">
			                      <div class="form-group">
			                        <label>Login</label>
			                        <input type="text" class="form-control" disabled value="${sessionScope['utilisateur'].login}" name="login" id="login">
			                      </div>
			                    </div>
			                    <div class="col-md-3 px-md-1">
			                      <div class="form-group">
			                        <label>Mot de passe</label>
			                        <input type="password" class="form-control" value="${sessionScope['utilisateur'].mdp}" name="mdp" id="mdp">
			                        <a href="#0" class="hide-password">show</a>
			                      </div>
			                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Nom</label>
		                        <input type="text" class="form-control" value="${chercheur.nom}" name="nom" id="nom">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Prenom</label>
		                        <input type="text" class="form-control" value="${chercheur.prenom}" name="prenom" id="prenom">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-6 pr-md-1">
		                      <div class="form-group">
		                        <label>Date de naissance</label>
		                        <input type="date" class="form-control" value="${chercheur.dateNai}" name="dateN" id="dateN">
		                      </div>
		                    </div>		                    
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Laboratoire</label>
		                        <input type="text" class="form-control" value="${chercheur.labo}" name="laboratoire" id="laboratoire">
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Adresse</label>
		                        <input type="text" class="form-control" value="${chercheur.adresse}" name="adresse" id="adresse">
		                      </div>
		                    </div>
		                  </div>
		                  <div class="row">
		                    <div class="col-md-12">
		                      <div class="form-group">
		                        <label>Email</label>
		                        <input type="email" class="form-control" value="${chercheur.email}" name="email" id="email">
		                      </div>
		                    </div>
		                  </div>		                  		                  
		                </form>		        
		              	</c:if>
		              </div>
		              <div class="card-footer">
		                <button type="submit" class="btn btn-fill btn-primary-profil" form="formCher">Save</button>
		              </div>
		            </div>
          		</div>
				</c:when>				
          	</c:choose>
          </c:if>
          <div class="col-md-4">
            <div class="card card-user">
              <div class="card-body">
                <p class="card-text">
                  <div class="author">
                    <div class="block block-one"></div>
                    <div class="block block-two"></div>
                    <div class="block block-three"></div>
                    <div class="block block-four"></div>
                    <a href="javascript:void(0)">
                    <c:choose>
                    	<c:when test="${!empty institution }">
                    		<img class="avatar" src="/projets2\profils\institution/${ institution.profil }" alt="...">
                      		<h5 class="title">${ institution.nom }</h5>
                    	</c:when>
                    	<c:when test="${!empty entreprise }">
                    		<img class="avatar" src="/projets2\profils\entreprise/${ entreprise.profil }" alt="...">
                      		<h5 class="title">${ entreprise.nom }</h5>
                    	</c:when>
                    	<c:when test="${!empty personne }">
                    		<img class="avatar" src="/projets2\profils\personne_physique/${ personne.profil }" alt="...">
                      		<h5 class="title">${ personne.nom }  ${ personne.prenom }</h5>
                    	</c:when>
                    	<c:when test="${!empty chercheur }">
                    		<img class="avatar" src="/projets2\profils\chercheur/${ chercheur.profil }" alt="...">
                      		<h5 class="title">${ chercheur.nom }  ${ chercheur.prenom }</h5>
                    	</c:when>
                    </c:choose>                      
                    </a>
                  </div>
                </p>                
              </div>
              </div>
          </div>
        </div>
      </div>
      
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