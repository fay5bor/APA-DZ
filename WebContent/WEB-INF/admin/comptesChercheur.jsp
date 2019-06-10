<!DOCTYPE html>
<html lang="fr">

<head>
  <%@ include file="adminHeader.jsp" %>
  <style>
*{margin:0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}

/* The Modal (background) */
.modal {
	display:none;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

/* Modal Content Box */
.modal-content {
    background-color: #fefefe;
    margin: 4% auto 15% auto;
    border: 1px solid #888;
    width: 40%; 
	padding-bottom: 30px;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}
.close:hover,.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    animation: zoom 0.6s
}
@keyframes zoom {
    from {transform: scale(0)} 
    to {transform: scale(1)}
}
</style>
</head>

<body class="">
  <div class="wrapper ">
    <div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

        Tip 2: you can also add an image using data-image tag
    -->
      <div class="logo">
        <a href="" class="simple-text logo-normal">
          <img src="/projets2/source/images/applogo.png" width="60" height="60" alt="">
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="/projets2/admin/DP">
              <p>Demandes de permis</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/projets2/admin/DI">
              <p>Demandes d'inscription</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="/projets2/admin/CC">
              <p>Comptes chercheurs</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/projets2/admin/CA">
              <p>Comptes admins</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="/projets2/admin/Ins">
              <p>Institutions</p>
            </a>
          </li>       
        </ul>
      </div>
    
      </div>
    <div class="main-panel">
      <!-- Navbar -->
      <%@ include file="adminNavbar.jsp" %>
      <!-- End Navbar -->
      	<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <div class="card">
                <div class="card-header card-header-tabs card-header-primary">
                  <div class="nav-tabs-navigation">
                    <div class="nav-tabs-wrapper">
                       <span class=""><b>Les comptes chercheurs</b> </span>   
                       <button class="btn pull-right btn-success" id="addBtn">Ajouter</button>  
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="tab-content">
                      <table class="table">
                      	<thead class="text-primary">
                      		<th>ID</th>
                      		<th>Nom</th>
                      		<th>Prenom</th>
                      		<th>Date de naissence</th>
                      		<th>Laboratoire</th>
                      		<th></th>
                   	 	</thead>
                   	 	<tbody >                  	 		
                          <c:forEach items="${cmpChercheurs}" var="cmpChercheur">
                          	<tr>
                          		<td class="idCpt"><c:out value="${cmpChercheur.id }"></c:out></td>
                          		<td><c:out value="${cmpChercheur.nom }"></c:out></td>
                          		<td><c:out value="${cmpChercheur.prenom }"></c:out></td>
                          		<td><c:out value="${cmpChercheur.dateNai }"></c:out></td>
                          		<td><c:out value="${cmpChercheur.labo }"></c:out></td>                                   		
                          		<c:if test = "${cmpChercheur.active == 'true'}">
									<td>
                          			<button class="btn pull-right btn-danger btnAppliquerD" id="btnAppliquerD">Désactiver</button>
                          		    </td> 
  								</c:if>
								<c:if test = "${cmpChercheur.active == 'false'}">
									<td>
                          			<button class="btn pull-right btn-success btnAppliquerA" id="btnAppliquerA">Activer</button>
                          		    </td> 
								</c:if>
                          		        		
                          	</tr>
                          </c:forEach>
                   	 	</tbody>                    
                      </table>
                    </div>
                </div>
              </div>
            </div>
            </div>
        </div>
      	<div id="modal-wrapper" class="modal">
      	<div class="col-md-8 modal-content animate">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title">Chercheurs</h4>
                  <p class="card-category">Créer nouveau compte</p>
                </div>
                <div class="card-body">
                  <form method="post" action="adminCC"  encType="multipart/form-data">
                    <div class="row">                  
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Nom</label>
                          <input type="text" class="form-control" name="nom">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Prenom</label>
                          <input type="text" class="form-control" name="prenom">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Date de naissence</label>
                          <input type="date" class="form-control" name="date" value="1960-08-26">
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Email</label>
                          <input type="email" class="form-control" name="email">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="bmd-label-floating">Laboratoire de recherche</label>
                          <input type="text" class="form-control" name="laboratoire">
                        </div>
                      </div>                      
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label class="bmd-label-floating">Adresse</label>
                          <input type="text" class="form-control" name="adresse">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">login</label>
                          <input type="text" class="form-control" name="login">
                        </div>
                      </div>  
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-group">
                          <label class="bmd-label-floating">mot de passe</label>
                          <input type="password" class="form-control" name="mdp">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="">
                          <label for="img" class="bmd-label-floating">Image de profile :</label>
    					  <input type="file" name="img" accept="image/png, image/jpeg" value="selectionner l'images"/>
                        </div>
                      </div>  
                    </div>  
                    <button type="submit" class="btn btn-primary pull-right">Créer</button>
                    <div class="clearfix"></div>
                  </form>
                </div>
              </div>
            </div>               
        </div>
      </div>
      
      </div>
    </div>
  <!--   Core JS Files   -->
  <script src="/projets2/assets/js/core/jquery.min.js"></script>
  <script src="/projets2/assets/js/core/popper.min.js"></script>
  <script src="/projets2/assets/js/core/bootstrap-material-design.min.js"></script>
  <script src="/projets2/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!-- Plugin for the momentJs  -->
  <script src="/projets2/assets/js/plugins/moment.min.js"></script>
  <!--  Plugin for Sweet Alert -->
  <script src="/projets2/assets/js/plugins/sweetalert2.js"></script>
  <!-- Forms Validations Plugin -->
  <script src="/projets2/assets/js/plugins/jquery.validate.min.js"></script>
  <!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
  <script src="/projets2/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
  <!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
  <script src="/projets2/assets/js/plugins/bootstrap-selectpicker.js"></script>
  <!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
  <script src="/projets2/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
  <!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
  <script src="/projets2/assets/js/plugins/jquery.dataTables.min.js"></script>
  <!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
  <script src="/projets2/assets/js/plugins/bootstrap-tagsinput.js"></script>
  <!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
  <script src="/projets2/assets/js/plugins/jasny-bootstrap.min.js"></script>
  <!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
  <script src="/projets2/assets/js/plugins/fullcalendar.min.js"></script>
  <!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
  <script src="/projets2/assets/js/plugins/jquery-jvectormap.js"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="/projets2/assets/js/plugins/nouislider.min.js"></script>
  <!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <!-- Library for adding dinamically elements -->
  <script src="/projets2/assets/js/plugins/arrive.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chartist JS -->
  <script src="/projets2/assets/js/plugins/chartist.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/projets2/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/projets2/assets/js/material-dashboard.js?v=2.1.1" type="text/javascript"></script>
  <script>
    $(document).ready(function() {   	

    	$(".btnAppliquerD").click(function(){
			var idCpt=$(this).closest('tr').find('.idCpt').html();
			$.ajax({
				type: 'POST',
				url: 'adminCC',
				headers: {"X-My-Header":"Bob"},
				data: {
					id: idCpt,
		            op: 'd'
				},
				success: function (data) {
					location.reload();
				}
				});
			});
		
    	$(".btnAppliquerA").click(function(){
			var idCpt=$(this).closest('tr').find('.idCpt').html();
			$.ajax({
				type: 'POST',
				url: 'adminCC',
				headers: {"X-My-Header":"Bob"},
				data: {
					id: idCpt,
		            op: 'a'
				},
				success: function (data) {
					location.reload();
				}
				});
			});
    	
    	var modal = document.getElementById('modal-wrapper');
    	window.onclick = function(event) {
    	    if (event.target == modal) {
    	        modal.style.display = "none";
    	    }
    	};
    	
    	$("#addBtn").click(function(){
    		document.getElementById('modal-wrapper').style.display='block';
    	});
    	
      $().ready(function() {
        $sidebar = $('.sidebar');

        $sidebar_img_container = $sidebar.find('.sidebar-background');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

        if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
          if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
            $('.fixed-plugin .dropdown').addClass('open');
          }

        }

        $('.fixed-plugin a').click(function(event) {
          // Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .active-color span').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-color', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data-color', new_color);
          }
        });

        $('.fixed-plugin .background-color .badge').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('background-color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data-background-color', new_color);
          }
        });

        $('.fixed-plugin .img-holder').click(function() {
          $full_page_background = $('.full-page-background');

          $(this).parent('li').siblings().removeClass('active');
          $(this).parent('li').addClass('active');


          var new_image = $(this).find("img").attr('src');

          if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            $sidebar_img_container.fadeOut('fast', function() {
              $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
              $sidebar_img_container.fadeIn('fast');
            });
          }

          if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $full_page_background.fadeOut('fast', function() {
              $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
              $full_page_background.fadeIn('fast');
            });
          }

          if ($('.switch-sidebar-image input:checked').length == 0) {
            var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
            var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

            $sidebar_img_container.css('background-image', 'url("' + new_image + '")');
            $full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.css('background-image', 'url("' + new_image + '")');
          }
        });

        $('.switch-sidebar-image input').change(function() {
          $full_page_background = $('.full-page-background');

          $input = $(this);

          if ($input.is(':checked')) {
            if ($sidebar_img_container.length != 0) {
              $sidebar_img_container.fadeIn('fast');
              $sidebar.attr('data-image', '#');
            }

            if ($full_page_background.length != 0) {
              $full_page_background.fadeIn('fast');
              $full_page.attr('data-image', '#');
            }

            background_image = true;
          } else {
            if ($sidebar_img_container.length != 0) {
              $sidebar.removeAttr('data-image');
              $sidebar_img_container.fadeOut('fast');
            }

            if ($full_page_background.length != 0) {
              $full_page.removeAttr('data-image', '#');
              $full_page_background.fadeOut('fast');
            }

            background_image = false;
          }
        });

        $('.switch-sidebar-mini input').change(function() {
          $body = $('body');

          $input = $(this);

          if (md.misc.sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            md.misc.sidebar_mini_active = false;

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

          } else {

            $('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

            setTimeout(function() {
              $('body').addClass('sidebar-mini');

              md.misc.sidebar_mini_active = true;
            }, 300);
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);

        });
      });
    });
  </script>
  <c:if test="${ !empty creationOP}">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <c:if test = "${creationOP.equals('success')}">
	<script type="text/javascript">
	swal({
		  title: "Compte créée avec succès",
		  icon: "success",
		});
	</script>
  </c:if>
  <c:if test = "${!creationOP.equals('success')}">
	<script type="text/javascript">
	swal({
		  title: "Erreur de création",
		  text: "${creationOP }",
		  icon: "error",
		});
	</script>
  </c:if>
</c:if>
</body>
</html>