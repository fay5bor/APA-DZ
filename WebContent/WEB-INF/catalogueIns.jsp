<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>APA DZ</title>
<link rel="stylesheet" href="/projets2/source/vendors/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="/projets2/source/vendors/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/projets2/source/css/style.css">
<link rel="stylesheet" href="/projets2/source/css/t.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
        .search-container {
            height: 70px;
        }

        .search-bar-icon {
            color: rgb(172, 172, 172);
            font-size: 20px
        }

        .search-bar-input {
            border: 0;
            width: 90% !important;
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
            height: 100%
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>	

    <!--                     Catalogue                                              -->
    <div class="m-4">
            <div class="row">
                <div class="col-2 position-sticky-1">
                	<form action="institutions" method="post" class="">
						<div class="search input-group">
						      <input type="text" class="searchTerm form-control width100" placeholder="Rechercher ..." id="searchKey" name="searchKey">
						      <button type="submit" class="searchButton">
						        <i class="fa fa-search"></i>
						     </button>
						</div>
						<br>
                		<h5>Filtrer votre recherche :</h5>
                		<br>
                    	<h5>Type</h5>
	                    <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="insPublique" name="insPublique">
	                        <label class="custom-control-label" for="insPublique">Institut publique </label><br>
	                    </div>
	                    <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="insPrive" name="insPrive">
	                        <label class="custom-control-label" for="insPrive">Institut privé</label>
	                    </div>
	                    <div class="custom-control custom-checkbox">
	                        <input type="checkbox" class="custom-control-input" id="entreprise" name="entreprise">
	                        <label class="custom-control-label" for="entreprise">Entreprise</label>
	                    </div>                  
                    	<br>
                    	<h5>Ressources Génétiques</h5>
	                    <div class="custom-control custom-checkbox">
	                        <select id="resUsed" name="resUsed" class="ins-select">
	                        	<option value="" selected></option>
	                        	<c:forEach items="${ressources}" var="ressource">
	                        		<option value="${ressource.id}"><c:out value="${ressource.nom}"></c:out></option>
	                        	</c:forEach>
	                        </select>
	                    </div>   
                    	<button type="submit" class="btn btn-outline-success btn-block btn-filter" value="rechercher">Rechercher</button>
                	</form>                      	               
                </div>
                <div class="col-10 space-div">                 
                    <div class="row">                      
                        <c:forEach items="${institutions}" var="institution">
                          	<div class="col-3 space-card">
                            	<div class="card">                               	
                                	<c:if test = "${institution.idCmp == '-1'}">
										<img class="card-img-top img-catalogue-ins" src="/projets2\profils\institution\institutionSansCompte/${ institution.profil }" alt="Card image cap">
  									</c:if>
									<c:if test = "${institution.idCmp != '-1'}">
										<img class="card-img-top img-catalogue-ins" src="/projets2\profils\institution/${ institution.profil }" alt="Card image cap">
									</c:if>     
                                	<div class="card-body">
                                		<span id="insID" disabled></span>
                            		 	<h5 class="card-title text-center"><c:out value="${institution.nom }"></c:out></h5>
                                    	<p class="card-text text-center">Institution <c:out value="${institution.type }"></c:out></p>
                                    <div class="row" id="${institution.id }">
                                        <div class="col-2 "></div>
                                        <div class="col-8 idcmp" id="${institution.idCmp }">
                                            <button type="button" class="btn btn-primary btn-block detailsBtnIns">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     	</c:forEach>
                     	<c:forEach items="${entreprises}" var="entreprise">
                          	<div class="col-3 space-card">
                            	<div class="card">                               	
                                	<img class="card-img-top img-catalogue-ins" src="/projets2\profils\entreprise/${ entreprise.profil }" alt="Card image cap">   
                                	<div class="card-body">
                                		<span id="insID" disabled></span>
                            		 	<h5 class="card-title text-center"><c:out value="${entreprise.nom }"></c:out></h5>
                                    	<p class="card-text text-center"><c:out value="Entreprise"></c:out></p>
                                    <div class="row" id="${entreprise.id }">
                                        <div class="col-2 "></div>
                                        <div class="col-8 idcmp" id="${entreprise.idCmp }">
                                            <button type="button" class="btn btn-primary btn-block detailsBtnEnt">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                     	</c:forEach>
                     </div>                   
                    </div>
            </div>
    </div>
	
	<div id="modal-wrapper" class="modal">
      	<div class="col-md-10 modal-content animate">
        	<div class="container-fluid">
          <div class="card border-0">
            <div class="card-header card-header-primary">
              <h4 class="card-title card-title-primary" id="nomIns">Le nom</h4>
              <p class="card-category card-title-primary-2" id="typeIns">Le type</p>
            </div>
            <div class="card-body .card-body-primary">
              <div id="typography">
                <br>
                <div class="row">
                  <div class="tim-typo-2">
                  	<img class="card-img-top profile-circle-2" src="" alt="Card image cap" id="imgIns">
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Email :</span><span id="mailIns">Le mail</span></h4>
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Adresse :</span><span id="adresseIns">L'adresse</span></h4>
                  </div>                                   
                  <div class="tim-typo-2">                   
                    <div class="card">
                    <div class="card-header">
                    	<h4><span class="tim-note text-center">Ressources génétiques utilisées</span></h4>
                    </div>
                    	<ul class="list-group list-group-flush" id="resIns"></ul>
                    </div>
                  </div>                  
                </div>
              </div>
            </div>
          </div>
        </div>
            
        </div>
        </div>

	<div id="modal-wrapper-ent" class="modal">
      	<div class="col-md-10 modal-content animate">
        	<div class="container-fluid">
          <div class="card border-0">
            <div class="card-header card-header-primary">
              <h4 class="card-title card-title-primary" id="nomEnt">Le nom</h4>
              <p class="card-category card-title-primary-2">Entreprise</p>
            </div>
            <div class="card-body .card-body-primary">
              <div id="typography">
                <br>
                <div class="row">
                  <div class="tim-typo-2">
                  	<img class="card-img-top profile-circle-2" src="" alt="Card image cap" id="imgEnt">
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Email :</span><span id="mailEnt">Le mail</span></h4>
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Adresse :</span><span id="adresseEnt">L'adresse</span></h4>
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Statut :</span><span id="statutEnt">Le mail</span></h4>
                  </div>
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Domaine :</span><span id="domaineEnt">L'adresse</span></h4>
                  </div> 
                  <div class="tim-typo">
                    <h4>
                      <span class="tim-note">Secteur :</span><span id="secteurEnt">L'adresse</span></h4>
                  </div>                                      
                  <div class="tim-typo-2">                   
                    <div class="card">
                    <div class="card-header">
                    	<h4><span class="tim-note text-center">Ressources génétiques utilisées</span></h4>
                    </div>
                    	<ul class="list-group list-group-flush" id="resEnt"></ul>
                    </div>
                  </div>                  
                </div>
              </div>
            </div>
          </div>
        </div>
            
        </div>
        </div>
	

    <!--                     /Catalogue                                              -->


<script src="/projets2/source/vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="/projets2/source/vendors/jquery/jquery.min.js"></script>    
<script src="/projets2/source/vendors/magnific-popup/jquery.magnific-popup.js"></script>
<script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>
<script src="/projets2/source/js/java-script.js"></script>
<script src="/projets2/source/js/profil.js"></script>
<c:if test="${ !empty cnx.erreurs}">
<script type="text/javascript" src="/projets2/source/js/loginErr.js"></script>
</c:if>
<script type="text/javascript">
var modal = document.getElementById('modal-wrapper');
var modalEnt = document.getElementById('modal-wrapper-ent');
window.onclick = function(event) {
    if (event.target == modal || event.target == modalEnt) {
        modal.style.display = "none";
        modalEnt.style.display = "none";
    }
};

$(".detailsBtnIns").click(function(){
	var idIns=$(this).closest('.row').attr('id');
	var idC=$(this).closest('.idcmp').attr('id');
	$.ajax( {
		type: 'POST',
		url: 'institutions',
		headers: {"Ins-Details":"true"},
    data: {
        id: idIns,
        idCmp:idC,
        type: 'ins'
    },
    dataType: 'xml',
    success: function (data) {
    	$('#nomIns').html($(data).find("nom").text());
    	$('#typeIns').html($(data).find("type").text());
    	$('#mailIns').html($(data).find("email").text());
    	$('#adresseIns').html($(data).find("adresse").text());
    	
    	var idCmp=$(data).find("idCmp").text();
    	if(idCmp==-1){
    		$('#imgIns').attr("src","/projets2/profils/institution/institutionSansCompte/"+$(data).find("profil").text());
    	}
    	else $('#imgIns').attr("src","/projets2/profils/institution/"+$(data).find("profil").text());
    	
    	var resSelect=$('#resIns');
    	resSelect.empty();
    	$(data).find('ressource').each(function(index){
            var ressource = $(this).text();
            resSelect.append($("<li></li>").attr("class", "list-group-item").text(ressource));
        });
	},
	error: function(xhr, status, error) {
		  alert("Chargement impossible");
		}

	} );
	
	document.getElementById('modal-wrapper').style.display='block';
});

$(".detailsBtnEnt").click(function(){
	var idIns=$(this).closest('.row').attr('id');
	var idC=$(this).closest('.idcmp').attr('id');
	$.ajax( {
		type: 'POST',
		url: 'institutions',
		headers: {"Ins-Details":"true"},
    data: {
        id: idIns,
        idCmp:idC,
        type: 'Ent'
    },
    dataType: 'xml',
    success: function (data) {
    	$('#nomEnt').html($(data).find("nom").text());    	
    	$('#mailEnt').html($(data).find("email").text());
    	$('#adresseEnt').html($(data).find("adresse").text());
    	$('#statutEnt').html($(data).find("statut").text());
    	$('#domaineEnt').html($(data).find("domaine").text());
    	$('#secteurEnt').html($(data).find("secteur").text());
    	
    	$('#imgEnt').attr("src","/projets2/profils/entreprise/"+$(data).find("profil").text());
    	
    	var resSelect=$('#resEnt');
    	resSelect.empty();
    	$(data).find('ressource').each(function(index){
            var ressource = $(this).text();
            resSelect.append($("<li></li>").attr("class", "list-group-item").text(ressource));
        });
	},
	error: function(xhr, status, error) {
		  alert("Chargement impossible");
		}

	} );
	
	document.getElementById('modal-wrapper-ent').style.display='block';
});
</script>
</body>
</html>