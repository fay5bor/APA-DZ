<%@page import="org.eclipse.jdt.core.compiler.CategorizedProblem"%>
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
	<% ArrayList<ArrayList> ressources =(ArrayList<ArrayList>) request.getAttribute("ressources");
	   int pages = (int) request.getAttribute("pages");
	   int current = (int) request.getAttribute("current");
	   String search = (String) request.getAttribute("search");
	   ArrayList<String> categorie = (ArrayList<String>) request.getAttribute("categorie");
   	   String catFiltre = ""  ;
   	   for(String cat: categorie){
   			catFiltre+="categorie="+cat+"&";
   	   }
	%>
	<jsp:include page="parts/nav-bar2.jsp"></jsp:include>	
	
	
    <!--                     Catalogue                                              -->
    <div class="m-4">
        <!--                     Search                                              -->
        <div class="row search-container">
            <div class="col-2 mt-2">
                     <button form="searchForm" type="submit" class="btn btn-block my-btn ">Filtrer</button>                              
                <!-- <a href="#" class="btn btn-block my-btn ">Ajouter Ressource</a> -->
            </div>
            <div class="col-10">
                <form id="searchForm" method="get" action="${pageContext.request.contextPath}/Catalogue" class="form-inline my-2 my-lg-0 search-bar pl-3">
                    <i class="fas fa-search search-bar-icon"></i>
                    <input name="search" class="form-control search-bar-input" type="search" placeholder="Search" aria-label="Search" value="<%= ((search!=null) ? search : "") %>" >
                </form>
            </div>

        </div>

        <!--                     /Search                                              -->
        <div class="">
            <div class="row">
                <div class="col-2">
                    
                    <h4>Catégorie</h4>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Forestiere" type="checkbox" class="custom-control-input" id="Forestiere" <%= (categorie.contains("Forestiere")) ? "checked" : ""  %>>
                        <label class="custom-control-label" for="Forestiere">Forestiere</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Microorganismes" type="checkbox" class="custom-control-input" id="Microorganismes" <%= (categorie.contains("Microorganismes")) ? "checked" : ""  %> >
                        <label class="custom-control-label" for="Microorganismes">Microorganismes</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Agriculture" type="checkbox" class="custom-control-input" id="Agriculture" <%= (categorie.contains("Agriculture")) ? "checked" : ""  %>>
                        <label class="custom-control-label" for="Agriculture">Agriculture</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Marine" type="checkbox" class="custom-control-input" id="Marine" <%= (categorie.contains("Marine")) ? "checked" : ""  %>>
                        <label class="custom-control-label" for="Marine">Marine</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input form="searchForm" name="categorie" value="Alimentaire" type="checkbox" class="custom-control-input" id="Alimentaire" <%= (categorie.contains("Alimentaire")) ? "checked" : ""  %>>
                        <label class="custom-control-label" for="Alimentaire">Alimentaire</label>
                    </div> 
                </div>
                <div class="col-10">
                	<%if(ressources.size()==0){ %>
                	<h1>Ressource introuvable</h1>
                	<h4>Veuillez recherchez</h4>
                	<% } %>
                	<%for(int i=0 ; i< ressources.size(); ) {
                			if(i%3 == 0){
                	%>              
                    		<div class="row d-flex justify-content-around  mt-4">
                    <%		} %>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" height="220px" width="260px" src="data:image/png;base64,<%= ressources.get(i).get(2) %>" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center"><%= ressources.get(i).get(0) %></h5>
                                    <p class="card-text text-center"><%= ressources.get(i).get(1) %></p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% i++; 	
                           if(i%3 == 0 || i== ressources.size()){ %>
                        		</div>
                        <%  }       
                        }
                		if (pages > 0) {
                		%>
                        <nav class="mt-5 d-flex align-items-center flex-column" aria-label="Page navigation example">
                        <ul class="pagination">
                            <% if (current == 1) { %>                       
	                            <li class="page-item disabled">
	                                <a class="page-link" href="#" aria-label="First">
	                                    <span aria-hidden="true">First</span>
	                                    <span class="sr-only">First</span>
	                                </a>
	                            </li>
	                        <% } else { %>	   
	                        	<li class="page-item">
	                                <a class="page-link" href="${pageContext.request.contextPath}/Catalogue<%= ((search!=null) ? "?search="+search : "") %><%= "&"+catFiltre %>" aria-label="First">
	                                    <span aria-hidden="true">First</span>
	                                	<span class="sr-only">First</span>
	                                </a>
	                            </li>     
	                        <% } %>	    
	                        <% int i = ( current > 5 ? current- 4 : 1) ; %>
	                        <% if (i != 1) { %>	
                     	        <li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                     	    <% } %>   
                     	    <% for (; i <= (current + 4) && i <= pages; i++) { %>
                     	    	<% if (i == current) { %>    
	                              <li class="page-item active"><a class="page-link"><%= i %><span
	                                        class="sr-only">(current)</a></li>   
	                            <% } else { %>
                            		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/Catalogue?<%= ((search!=null) ? "search="+search+"&" : "") %><%= catFiltre %>page=<%= i %>"><%= i %></a></li>	                            
                        		<% } %>            
                        	    <% if (i == current + 4 && i < pages) { %>
                            		<li class="page-item disabled"><a class="page-link" href="#">...</a></li>
                        		<% } %>	    	                 	 
                        	<% } %>
                    		<% if (current == pages) { %>
                        		<li class="page-item disabled">
                                	<a class="page-link" href="#" aria-label="Last">
                                    	<span aria-hidden="true">Last</span>
                                    	<span class="sr-only">Last</span>
                                	</a>
                            	</li>
                    		<% } else { %>
                        		<li class="page-item">
                                	<a class="page-link" href="${pageContext.request.contextPath}/Catalogue?<%= ((search!=null) ? "search="+search+"&" : "") %><%= catFiltre %>page=<%= pages %>" aria-label="Last">
                                    	<span aria-hidden="true">Last</span>
                                    	<span class="sr-only">Last</span>
                                	</a>
                            	</li>
                    		<% } %>                     	    	                        	                      	                                                    
                           
                        </ul>
                        <%} %>
                    </nav>                  
                    </div>

                    
                </div>
            </div>

        </div>
    </div>


    <!--                     /Catalogue                                              -->

    

    <script src="${pageContext.request.contextPath}/ressources/vendors/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/ressources/js/java-script.js"></script>

</body>

</html>