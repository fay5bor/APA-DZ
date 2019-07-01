<%@page import="org.eclipse.jdt.core.compiler.CategorizedProblem"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.ArrayList"
	%>
	
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 0.7">
    <title>Acceuil DZ APA</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ressources/css/style.css">
<style type="text/css">
/*Catalogue css*/
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


.float{
	position:fixed;
	width:60px;
	height:60px;
	bottom:28px;
	right:40px;
	background-color:#2dd393;
	color:#FFF;
	border-radius:50px;
	text-align:center;
	box-shadow: 2px 2px 3px #999;
}

.my-float{
	margin-top:22px;
}
@media (max-width: 575.98px) { 
	.card-list-catalogue div:not(:first-child) {
		margin-top : 35px;
	}
	.search-bar-input {
        width: 95% !important;
  	}
  	.mobile-filter-btn{
		margin-left : -24px
	}
}
@media (min-width: 576px) and (max-width: 767.98px) {
 	.card-list-catalogue :nth-child(n+3){
		margin-top : 35px;
	}
	.search-bar-input {
        width: 96% !important;
  	}
  	.mobile-filter-btn{
		margin-left : -19px
	}
}

@media (min-width: 768px) and (max-width: 991.98px) {
	.card-list-catalogue :nth-child(n+4){
		margin-top : 35px;
	} 
	.search-bar-input {
        width: 97% !important;
  	}
  	.mobile-filter-btn{
		margin-left : -14px
	}
}

@media (min-width: 992px)  {
	.card-list-catalogue :nth-child(n+5){
		margin-top : 35px;
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
	<c:set var="current" >
   		<c:out value="${param.page}" default="1"/>
	</c:set>
	<c:set var="i">
		<c:out value="${current > 5 ? current-4 : 1}" />
	</c:set>
	<c:set var="min_loop">
		<c:out value="${current+4 >= pages ? pages : current+4}" />
	</c:set>
	<c:choose>                        	
		<c:when test="${empty link}">
			<c:set var = "sep" value = "?"/>
	    </c:when>
		<c:otherwise>	                            	                        
			<c:set var = "sep" value = "&"/>
	    </c:otherwise>
	</c:choose>
	
	<jsp:include page="parts/nav-bar2.jsp"></jsp:include>	
	
	
    <!--                     Catalogue                                              -->
        <!--                     Search                                              -->
        <div class="row m-4">
            <div class="d-none d-lg-block col-lg-2 mt-1 search-container" >
                     <button form="searchForm" type="submit" class="btn btn-block my-btn h-75">
					<i class="fas fa-filter"></i>
                     Filtrer
                     </button>                              
                <!-- <a href="#" class="btn btn-block my-btn ">Ajouter Ressource</a> -->
                                <h4 class="mt-4">Catégorie</h4>
                    <c:forEach items="${types}" var="type">                                
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="${ type}" type="checkbox" class="custom-control-input" id="${type }"
                           	<c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, type)? 'checked' : ''}" />
							</c:forEach>    
                        />
                        <label class="custom-control-label" for="${type }"><c:out  value="${type}" /></label><br>
                    </div>
                    </c:forEach>
                    <br/>
                    <h4>Région</h4>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Nord" type="checkbox" class="custom-control-input" id="Nord"
             		        <c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Nord')? 'checked' : ''}" />
							</c:forEach> 
                          />
                        <label class="custom-control-label" for="Nord">Nord</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Sud" type="checkbox" class="custom-control-input" id="Sud"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Sud')? 'checked' : ''}" />
							</c:forEach>                         
                        />
                        <label class="custom-control-label" for="Sud">Sud</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Est" type="checkbox" class="custom-control-input" id="Est"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Est')? 'checked' : ''}" />
							</c:forEach>                           
                        />
                        <label class="custom-control-label" for="Est">Est</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Ouest" type="checkbox" class="custom-control-input" id="Ouest"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Ouest')? 'checked' : ''}" />
							</c:forEach>                           
                        />
                        <label class="custom-control-label" for="Ouest">Ouest</label>
                    </div>
            </div>
            <div class="col-lg-10 col-md-12">
            	<div class="row search-bar">
            	<div class="col-lg-12 col-11">
            	<form id="searchForm" method="get" action="${pageContext.request.contextPath}/Catalogue" class="form-inline my-2 pl-3">
                    <i class="fas fa-search search-bar-icon"></i>
                    <input name="search" class="form-control search-bar-input" type="search" placeholder="Search" aria-label="Search" value="<c:out value="${search}" default="" />">
                </form>
            	</div>
            	<div class="d-block d-lg-none d-xl-none col-1 mt-2">
            		<a class="btn mobile-filter-btn my-btn dropdown-toggle connect-item2" href="#exampleModal" data-toggle="modal" data-target="#exampleModal" >
						<i class="fas fa-filter"></i>
        			</a>



                    <!-- <button form="searchForm" type="submit" class="btn mobile-filter-btn my-btn ">
					 <i class="fas fa-filter"></i>
                     </button> -->                              
            	</div>
            	</div>

					<c:if test="${fn:length(ressources) eq 0}">
                		<h1>Ressource introuvable</h1>
                		<h4>Veuillez recherchez</h4>
                	</c:if>
                	<div class="row mt-4 d-flex justiy-content-center card-list-catalogue">
						<c:forEach items="${ressources}" var="ressource">
											            
                        <div class="col-lg-3 col-md-4 col-sm-6 col-7 offset-sm-0 offset-2">
                            <div class="card">
                                <img class="card-img-top" height="220px" width="260px" src="data:image/png;base64,<c:out value="${ressource[2]}" />" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center"><c:out value="${ressource[0]}" /></h5>
                                    <p class="card-text text-center"><c:out value="${ressource[1]}" /></p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
						</c:forEach>
                        </div>                       
						<c:if test="${pages > 0}">
                        <nav class="mt-5 d-flex align-items-center flex-column" aria-label="Page navigation example">
                        <ul class="pagination">
                        	<c:choose>                        	
							<c:when test="${current eq 1}">
	                            <li class="page-item disabled">
	                                <a class="page-link" href="#" aria-label="First">
	                                    <span aria-hidden="true">First</span>
	                                    <span class="sr-only">First</span>
	                                </a>
	                            </li>
	                        </c:when>
						    <c:otherwise>	                            
	                        	<li class="page-item">
	                                <a class="page-link" href="${pageContext.request.contextPath}/Catalogue<c:out value="${link}" default=""/>"
									aria-label="First">
	                                    <span aria-hidden="true">First</span>
	                                	<span class="sr-only">First</span>
	                                </a>
	                            </li>     
	                        </c:otherwise>
	                        </c:choose>
	                        <c:if test="${i !=1 }">
                     	        <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                     	    </c:if>
                     	    <c:forEach var="j" begin="${i}" end="${min_loop}" step="1" >
                     	    	<c:choose>                     	    
                     	    	<c:when test="${j eq current }" >
                     	   			<li class="page-item active"><a class="page-link"><c:out value="${ j }" /><span
	                                        class="sr-only">(current)</span></a></li>  
                     	    	</c:when>
                     	    	<c:otherwise>
                     	   			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/Catalogue<c:out value="${link}" default=""/><c:out value= "${sep}" /><c:out value="page=${j}" default=""/>" >
                     	   			<c:out value="${j}" /></a></li>                                                 	    	
                     	    	</c:otherwise>
                     	    	</c:choose>
                     	    	<c:if test="${j eq current+4 && j < pages }" >
                     	   			<li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                     	    	</c:if>
                     	    </c:forEach>
							<c:choose>
                     	    	<c:when test="${current eq pages}" >
                        		<li class="page-item disabled">
                                	<a class="page-link" href="#" aria-label="Last">
                                    	<span aria-hidden="true">Last</span>
                                    	<span class="sr-only">Last</span>
                                	</a>
                            	</li>
                      			</c:when>
                      			<c:otherwise>
                      			<li class="page-item">
                                	<a class="page-link" href="${pageContext.request.contextPath}/Catalogue<c:out value="${link}" default=""/><c:out value= "${sep}" /><c:out value="page=${pages}" default=""/>" 
                                	aria-label="Last">
                                    	<span aria-hidden="true">Last</span>
                                    	<span class="sr-only">Last</span>
                                	</a>
                            	</li>
                      			</c:otherwise>
                      		</c:choose>                            

                        </ul>
                    </nav>
                    </c:if> 
            </div>

        </div>

        <!--                     /Search                                              -->

		<a href="#" class="float">
			<i class="fa fa-plus my-float"></i>
		</a>
    <!--                     /Catalogue                                              -->
     <div class="my-modal mt-5">
            <!-- this is the entire modal form, including the background -->
            <div class="my-modal-container">
         
                    <!-- log in form -->
                    <h2 class="text-center mt-5 my-sec-text">Filtrer</h2>
                                           <h4 class="mt-4">Catégorie</h4>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Forestiere" type="checkbox" class="custom-control-input" id="Forestiere_mob"
                           	<c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, 'Forestiere')? 'checked' : ''}" />
							</c:forEach>    
                        />
                        <label class="custom-control-label" for="Forestiere_mob">Forestiere</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Microorganismes" type="checkbox" class="custom-control-input" id="Microorganismes_mob"
                            <c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, 'Microorganismes')? 'checked' : ''}" />
							</c:forEach>    
                        />
                        <label class="custom-control-label" for="Microorganismes_mob">Microorganismes</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Agriculture" type="checkbox" class="custom-control-input" id="Agriculture_mob"
                          	<c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, 'Agriculture')? 'checked' : ''}" />
							</c:forEach>     
                        />
                        <label class="custom-control-label" for="Agriculture_mob">Agriculture</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Marine" type="checkbox" class="custom-control-input" id="Marine_mob"
                          	<c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, 'Marine')? 'checked' : ''}" />
							</c:forEach>     
                        />
                        <label class="custom-control-label" for="Marine_mob">Marine</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Alimentaire" type="checkbox" class="custom-control-input" id="Alimentaire_mob"
                        	<c:forEach items="${paramValues.categorie}" var="item">
								<c:out  value="${fn:contains(item, 'Alimentaire')? 'checked' : ''}" />
							</c:forEach>   
                        />
                        <label class="custom-control-label" for="Alimentaire_mob">Alimentaire</label>
                    </div> <br/>
                    <h4>Région</h4>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Nord" type="checkbox" class="custom-control-input" id="Nord_mob"
             		        <c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Nord')? 'checked' : ''}" />
							</c:forEach> 
                          />
                        <label class="custom-control-label" for="Nord_mob">Nord</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Sud" type="checkbox" class="custom-control-input" id="Sud_mob"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Sud')? 'checked' : ''}" />
							</c:forEach>                         
                        />
                        <label class="custom-control-label" for="Sud_mob">Sud</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Est" type="checkbox" class="custom-control-input" id="Est_mob"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Est')? 'checked' : ''}" />
							</c:forEach>                           
                        />
                        <label class="custom-control-label" for="Est_mob">Est</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="region" value="Ouest" type="checkbox" class="custom-control-input" id="Ouest_mob"
                        	<c:forEach items="${paramValues.region}" var="item">
								<c:out  value="${fn:contains(item, 'Ouest')? 'checked' : ''}" />
							</c:forEach>                           
                        />
                        <label class="custom-control-label" for="Ouest_mob">Ouest</label>
                    </div>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->

                <a href="#0" class="cd-close-form">Close</a>
            </div> <!-- cd-user-modal-container -->
        </div> <!-- cd-user-modal -->

    
    <script src="${pageContext.request.contextPath}/ressources/vendors/popper/popper.min.js"></script>    
    <script src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>

</body>

</html>