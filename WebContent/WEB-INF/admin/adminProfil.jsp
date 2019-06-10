<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <%@ include file="adminHeader.jsp" %>
  <link rel="stylesheet" href="/projets2/source/css/style.css">
  <link rel="stylesheet" href="/projets2/source/css/t.css">
</head>

<body class="">
  <div class="wrapper ">
    <div class="main-panel">
      <!-- Navbar -->
    <%@ include file="adminNavbar.jsp" %>
      <!-- End Navbar -->
      <div class="content">
      	<div class="row">
	      <div class="col-md-8">
			            <div class="card card-profil">
			              <div class="card-header card-header-profil">
			                <h5 class="title"><b>Editer votre profile</b></h5>
			              </div>
			              <div class="card-body">
			              	<c:if test="${ !empty admin}">
			              	<form method="post" action="/projets2/admin/profil" id="formIns" accept-charset="UTF-8">
			                  <div class="row">
			                    <div class="col-md-5 pr-md-1">
			                      <div class="form-group">
			                        <label >Login</label>
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
			                  	<div class="col-md-6 pl-md-1">
			                      <div class="form-group">
			                        	<label >Niveau de Privilège</label>	                        
			                        	<c:if test="${admin.privilege=='A'}">			                        	
			                        		<input type="text" class="form-control" value="Niveau A">
			                        	</c:if>
			                        	<c:if test="${admin.privilege=='B'}">
			                        		<input type="text" class="form-control" value="Niveau B">
			                        	</c:if>
			                      </div>
			                  	</div>
			                  </div>			                  
			                  <div class="row">
			                    <div class="col-md-6 pr-md-1">
			                      <div class="form-group">
			                        <label>Nom</label>
			                        <input type="text" class="form-control" placeholder="Company" value="${admin.nom}" name="nom" id="nom">
			                      </div>
			                    </div>
			                    <div class="col-md-6 pr-md-1">
			                      <div class="form-group">
			                        <label>Prenom</label>
			                        <input type="text" class="form-control" placeholder="Company" value="${admin.prenom}" name="prenom" id="prenom">
			                      </div>
			                    </div>		                    
			                  </div>
			                  <div class="row">
			                    <div class="col-md-6 pr-md-1">
			                      <div class="form-group">
			                        <label>Date de naissance</label>
			                        <input type="date" class="form-control" value="${admin.dateNai}" name="dateN" id="dateN">
			                      </div>
			                    </div>		                    
			                  </div>
			                  <div class="row">
			                    <div class="col-md-12">
			                      <div class="form-group">
			                        <label>Address</label>
			                        <input type="text" class="form-control" placeholder="Home Address" value="${admin.adresse}" name="adresse" id="adresse">
			                      </div>
			                    </div>
			                  </div>
			                  <div class="row">
			                    <div class="col-md-12">
			                      <div class="form-group">
			                        <label>Email</label>
			                        <input type="email" class="form-control" placeholder="Home Address" value="${admin.email}" name="email" id="email">
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
	                    	<c:when test="${!empty admin }">
	                    		<img class="avatar" src="/projets2\profils\admin/${ admin.profil }" alt="...">
	                      		<h5 class="title">${ admin.nom } ${ admin.prenom }</h5>
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
    	
		$(".eventBtn").change(function(){
    		  if ($(this).children("option:selected").val().localeCompare("att")!=0) {
    			  $(this).closest('tr').find('.btnAppliquer').removeAttr('disabled');
    		  }else $(this).closest('tr').find('.btnAppliquer').attr("disabled","disabled");
    		});
		
		$(".btnAppliquer").click(function(){
			var nvEtat=$(this).closest('tr').find('.eventBtn').children("option:selected").val();
			var idDem=$(this).closest('tr').find('.idDem').html();
			var typeDem=$(this).closest('tbody').attr('id');
			var ligne=$(this).closest('tr');
			$.ajax({
				type: 'POST',
				url: 'adminDI',
				data: {
					id: idDem,
		            etat: nvEtat,
		            type: typeDem
				},
				success: function (data) {
					if (nvEtat.localeCompare("att")!=0)
					ligne.remove();
				}
				});			
			
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
  <script src="/projets2/source/js/java-script.js"></script>
  <script src="/projets2/source/js/profil.js"></script>
</body>

</html>