<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="">
                <img src="/projets2/source/images/applogo.png" width="60" height="60" alt="">
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Ressources</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="institutions">Instituts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Reglementations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">A propos</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control nav-searchbar" type="search" placeholder="Search" aria-label="Search">
                    <i class="fas fa-search search-icon mr-3"></i>
                </form>
                                                       
                <c:choose>
  				<c:when test="${ !empty sessionScope['utilisateur']}">
  				<div>
  					<div class="dropdown">
					<a href="#" class="account" id="0">
						<span><b>${ sessionScope['utilisateur'].login }</b></span>
						<img src="/projets2/profils/${ sessionScope['utilisateur'].type }/${ sessionScope['utilisateur'].login }.png" class="profile-circle"/>						
					</a>
					<div class="submenu" style="display: none;">
						<ul class="root">
							<li class="profil-element"><a href="/projets2/profil">Mon Profile</a></li>
							<li class="profil-element"><a href="/projets2/logout">Logout</a></li>
						</ul>
					</div>
				</div>
  				</div>
				</c:when>
				<c:when test="${ empty sessionScope.login }">
				<div><a href="#0" class="cd-signin btn my-btn-outline connect-item ">CONNECTER</a></div>
  				</c:when>
  				</c:choose>
            </div>
        </div>

        <div class="cd-user-modal"> <!-- this is the entire modal form, including the background -->
            <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
                <ul class="cd-switcher">
                    <li><a href="">Se connecter</a></li>
                    <li><a href="">S'inscrire</a></li>
                </ul>
                <div id="cd-login">
                    <h1 class="text-center mt-5 my-sec-text">Connectez Vous</h1>
                    <form class="cd-form" method="post" action="login">
                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="login" name="login" type="text" placeholder="Votre Login" value="${cnx.log}">
                        </p>   
                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="mdp" name="mdp" type="text"  placeholder="Votre Mot de passe">
                            <a href="#0" class="hide-password">Hide</a>
                            <div class="text-center"><span class="text-danger"><b>${cnx.erreurs['login']}${cnx.erreurs['mdp']}</b></span></div>
                        </p>
    
                        <p class="fieldset">
                            <input class="full-width btn my-btn" type="submit" value="Login">
                        </p>
                    </form>                   
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div>
    
                <div id="cd-signup"> <!-- sign up form -->
                    <h1 class="text-center mt-5 my-sec-text">Inscrivez vous</h1>
                    <br>
                    <div class="sel-div pb-3">
      						<label class="ins-label">Vous êtes une : </label>
   							<select id="typeDem" class="ins-select" onchange="showDiv(this)">
        						<option value="vide" selected></option>
        						<option value="ins">Institution</option>
        						<option value="ent">Entreprise</option>
        						<option value="per">Personne physique</option>
      						</select>
    				</div>
    				
    				<div class="container" id="insForm" style="display:none;">
						<form method="post" action="signin" class="cd-form" encType="multipart/form-data">
  							<div class="sel-div">
							     <div class="circle profil-div">
							       <img class="profile-pic" src="http://cdn.cutestpaw.com/wp-content/uploads/2012/07/l-Wittle-puppy-yawning.jpg">							
							     </div>
							     <div class="p-image">
							       	<i class="fa fa-camera upload-button"></i>
							        <input class="file-upload" type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
							     </div>
 							</div>  							
							<div class="sel-div">
							      <label class="ins-label">Type de l'institution </label>
							      <select id="typeIns" name="typeIns" class="ins-select">
							        <option value="publique">Publique</option>
							        <option value="privée">Privée</option>
							      </select>
							</div>
							<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="nom" name="nom" type="text" placeholder="Nom de l'institution" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
						    <p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="email" name="email" type="email" placeholder="E-mail" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="adresse" name="adresse" type="text" placeholder="Adresse" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                       		
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="login" name="login" type="text" placeholder="Login" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="mdp" name="mdp" type="password" placeholder="Mot de passe" required>
                            	<a href="#0" class="hide-password">show</a>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<textarea class="full-width has-padding has-border form-control" name="motif" id="motif" rows="3" placeholder="Votre motif d'inscription" required></textarea>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>	
                       		<div class="form-check">
    							<input type="checkbox" class="form-check-input" id="signature" name="signature" required>
    							<label class="form-check-label sign-label" for="signature">J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter</label>    							
                            	<span class="cd-error-message"><!--Error message here!--></span>
 							</div>					    								
							<input type="text" id="ty" name="ty" value="institution" style="display:none;">
							<p class="fieldset">
                            	<input class="full-width has-padding btn my-btn" type="submit" value="Finaliser la demande">
                        	</p>
						</form>
					</div>

					<div class="container" id="entForm" style="display:none;">
						<form method="post" action="signin" class="cd-form" encType="multipart/form-data">
  							<div class="sel-div">
							     <div class="circle profil-div">
							       <img class="profile-pic" src="http://cdn.cutestpaw.com/wp-content/uploads/2012/07/l-Wittle-puppy-yawning.jpg">							
							     </div>
							     <div class="p-image">
							       	<i class="fa fa-camera upload-button-1"></i>
							        <input class="file-upload-1" type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
							     </div>
 							</div> 
						    <div class="sel-div">
						      <label class="ins-label">Type de l'entreprise </label>
						      <select id="typeEnt" name="typeEnt" class="ins-select" >
						        <option value="publique">Publique</option>
						        <option value="privée">Privée</option>
						      </select>
						    </div>
						    <p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="nom" name="nom" type="text" placeholder="Nom de l'entreprise" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="statut" name="statut" type="text" placeholder="Statut ex: SARL" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                       		
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="secteur" name="secteur" type="text" placeholder="Secteur ex: Industrie" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="domaine" name="domaine" type="text" placeholder="Domaine ex: Cosmétique" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>						    
						    <p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="email" name="email" type="email" placeholder="E-mail" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="adresse" name="adresse" type="text" placeholder="Adresse" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                       		
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="login" name="login" type="text" placeholder="Login" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="mdp" name="mdp" type="password" placeholder="Mot de passe" required>
                            	<a href="#0" class="hide-password">show</a>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                      		
                       		<p class="fieldset">
                            	<textarea class="full-width has-padding has-border form-control" name="motif" id="motif" rows="3" placeholder="Votre motif d'inscription" required></textarea>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>	
                       		<div class="form-check">
    							<input type="checkbox" class="form-check-input" id="signature1" name="signature" required>
    							<label class="form-check-label sign-label" for="signature1">J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter</label>    							
                            	<span class="cd-error-message"><!--Error message here!--></span>
 							</div>	
                       		<input type="text" id="ty" name="ty" value="entreprise" style="display:none;">
                       		<p class="fieldset">
                            	<input class="full-width has-padding btn my-btn" type="submit" value="Finaliser la demande">
                        	</p>
						</form>
					</div>

					<div class="container" id="perForm" style="display:none;">
						<form method="post" action="signin" class="cd-form" encType="multipart/form-data">    							
  							<div class="sel-div">
							     <div class="circle profil-div">
							       <img class="profile-pic" src="http://cdn.cutestpaw.com/wp-content/uploads/2012/07/l-Wittle-puppy-yawning.jpg">							
							     </div>
							     <div class="p-image">
							       	<i class="fa fa-camera upload-button-2"></i>
							        <input class="file-upload-2" type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
							     </div>
 							</div>							
  							<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="nom" name="nom" type="text" placeholder="Nom" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="prenom" name="prenom" type="text" placeholder="Prenom" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="dateN" name="dateN" type="date" placeholder="Date de naissence" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="profession" name="profession" type="text" placeholder="Profession" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p> 
					    	<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="email" name="email" type="email" placeholder="E-mail" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="adresse" name="adresse" type="text" placeholder="Adresse" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                       		
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="login" name="login" type="text" placeholder="Login" required>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>
                       		<p class="fieldset">
                            	<input class="full-width has-padding has-border form-control" id="mdp" name="mdp" type="password" placeholder="Mot de passe" required>
                            	<a href="#0" class="hide-password">show</a>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>                     	 
                       		<p class="fieldset">
                            	<textarea class="full-width has-padding has-border form-control" name="motif" id="motif" rows="3" placeholder="Votre motif d'inscription" required></textarea>
                            	<span class="cd-error-message"><!--Error message here!--></span>
                       		</p>	
                       		<div class="form-check">
    							<input type="checkbox" class="form-check-input" id="signature2" name="signature">
    							<label class="form-check-label sign-label" for="signature2">J'approuve que j'ai lu les exigences de l'APA et je m'engage à les respecter</label>    							
                            	<span class="cd-error-message"><!--Error message here!--></span>
 							</div>
                       		<input type="text" id="ty" name="ty" value="personne" style="display:none;">     
                       		<p class="fieldset">
                            	<input class="full-width has-padding btn my-btn" type="submit" value="Finaliser la demande">
                        	</p>        
						</form>
					</div>
    				
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div> <!-- cd-signup -->                  
                <a href="#0" class="cd-close-form">Close</a>
            </div> <!-- cd-user-modal-container -->
        </div> <!-- cd-user-modal -->   
    </nav>