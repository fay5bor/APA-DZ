
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.ArrayList"
	%>
	
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Acceuil DZ APA</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style>
	body{
    zoom: 80%;
}
ol, ul, li, p {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;
    font: inherit;
    vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */

ol, ul {
    list-style: none;
}


/* nav bar css*/
.nav-searchbar:focus{
    border: 2px solid #2dd393;
    outline:none !important;
    outline-width: 0 !important;
    box-shadow: none;
    -moz-box-shadow: none;
    -webkit-box-shadow: none;
 }
.search-icon{
    color: #fff;
    background-color: #2dd393;
    border-radius: 0 15px 15px 0;
    height: 40px;
    width: 40px;
    text-align: center;
    padding: 15px 10px 15px 10px;
    margin-left: -3px
}
.my-btn-outline{
    color:#2dd393;
    border-color: #2dd393;
}
.my-btn-outline:hover, .my-btn-outline:focus, .my-btn-outline:active, .my-btn-outline.active, .open .dropdown-toggle.my-btn-outline {
    background-color: #2dd393;
    color:#FFF;
    border-color: #2dd393;
}
.my-btn{
    background-color: #2dd393;
    color:#FFF;
    border-color: #2dd393;
} 
.my-btn:hover, .my-btn:focus, .my-btn:active, .my-btn.active, .open .dropdown-toggle.my-btn {
    background-color: #198159;
    color:#FFF;
    border-color: #1ea772;
}
.my-sec-text{
    color: #2dd393
}
/* -------------------------------- 

xsigin/signup popup 

-------------------------------- */
.cd-user-modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(52, 54, 66, 0.9);
    z-index: 3;
    overflow-y: auto;
    cursor: pointer;
    visibility: hidden;
    opacity: 0;
    -webkit-transition: opacity 0.3s 0, visibility 0 0.3s;
    -moz-transition: opacity 0.3s 0, visibility 0 0.3s;
    transition: opacity 0.3s 0, visibility 0 0.3s;
  }
  .cd-user-modal.is-visible {
    visibility: visible;
    opacity: 1;
    -webkit-transition: opacity 0.3s 0, visibility 0 0;
    -moz-transition: opacity 0.3s 0, visibility 0 0;
    transition: opacity 0.3s 0, visibility 0 0;
  }
  .cd-user-modal.is-visible .cd-user-modal-container {
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
    -ms-transform: translateY(0);
    -o-transform: translateY(0);
    transform: translateY(0);
  }
  
  .cd-user-modal-container {
    position: relative;
    width: 90%;
    max-width: 600px;
    background: #FFF;
    margin: 3em auto 4em;
    cursor: auto;
    border-radius: 0.25em;
    -webkit-transform: translateY(-30px);
    -moz-transform: translateY(-30px);
    -ms-transform: translateY(-30px);
    -o-transform: translateY(-30px);
    transform: translateY(-30px);
    -webkit-transition-property: -webkit-transform;
    -moz-transition-property: -moz-transform;
    transition-property: transform;
    -webkit-transition-duration: 0.3s;
    -moz-transition-duration: 0.3s;
    transition-duration: 0.3s;
  }
  .cd-user-modal-container .cd-switcher:after {
    content: "";
    display: table;
    clear: both;
  }
  .cd-user-modal-container .cd-switcher li {
    width: 50%;
    float: left;
    text-align: center;
  }
  .cd-user-modal-container .cd-switcher li:first-child a {
    border-radius: .25em 0 0 0;
  }
  .cd-user-modal-container .cd-switcher li:last-child a {
    border-radius: 0 .25em 0 0;
  }
  .cd-user-modal-container .cd-switcher a {
    display: block;
    width: 100%;
    height: 50px;
    line-height: 50px;
    background: #c2c2c2;
    color: #fff;
    font-size: 20px;
  }
  .cd-user-modal-container .cd-switcher a.selected {
    background: #2dd393;
    color: #fff;
  }
  /* modal*/
  .cd-form {
    padding: 1.4em;
  }
  .cd-form .fieldset {
    position: relative;
    margin: 1.4em 0;
  }
  .cd-form .fieldset:first-child {
    margin-top: 0;
  }
  .cd-form .fieldset:last-child {
    margin-bottom: 0;
  }
  .cd-form input {
    margin: 0;
    padding: 0;
    border-radius: 0.25em;
  }
  .cd-form input.full-width {
    width: 100%;
  }
  .cd-form input.has-padding {
    padding: 12px 20px 12px 50px;
  }
  .cd-form input.has-border {
    border: 1px solid #d2d8d8;
    -webkit-appearance: none;
    -moz-appearance: none;
    -ms-appearance: none;
    -o-appearance: none;
    appearance: none;
  }
  .cd-form input.has-border:focus {
    border-color: #2dd393;
    box-shadow: 0 0 5px rgba(52, 54, 66, 0.1);
    outline: none;
  }
  .cd-form input.has-error {
    border: 1px solid #d76666;
  }
  .cd-form input[type=password] {
    /* space left for the HIDE button */
    padding-right: 65px;
  }
  
  .no-touch .cd-form input[type=submit]:hover, .no-touch .cd-form input[type=submit]:focus {
    background: #3599ae;
    outline: none;
  }
  .cd-form .hide-password {
    display: inline-block;
    position: absolute;
    right: 0;
    top: 0;
    padding: 6px 15px;
    border-left: 1px solid #d2d8d8;
    top: 50%;
    bottom: auto;
    -webkit-transform: translateY(-50%);
    -moz-transform: translateY(-50%);
    -ms-transform: translateY(-50%);
    -o-transform: translateY(-50%);
    transform: translateY(-50%);
    font-size: 14px;
    font-size: 0.875rem;
    color: #343642;
  }
  .cd-form .cd-error-message {
    display: inline-block;
    position: absolute;
    left: -5px;
    bottom: -35px;
    background: rgba(215, 102, 102, 0.9);
    padding: .8em;
    z-index: 2;
    color: #FFF;
    font-size: 13px;
    font-size: 0.8125rem;
    border-radius: 0.25em;
    /* prevent click and touch events */
    pointer-events: none;
    visibility: hidden;
    opacity: 0;
    -webkit-transition: opacity 0.2s 0, visibility 0 0.2s;
    -moz-transition: opacity 0.2s 0, visibility 0 0.2s;
    transition: opacity 0.2s 0, visibility 0 0.2s;
  }
  .cd-form .cd-error-message::after {
    /* triangle */
    content: '';
    position: absolute;
    left: 22px;
    bottom: 100%;
    height: 0;
    width: 0;
    border-left: 8px solid transparent;
    border-right: 8px solid transparent;
    border-bottom: 8px solid rgba(215, 102, 102, 0.9);
  }
  .cd-form .cd-error-message.is-visible {
    opacity: 1;
    visibility: visible;
    -webkit-transition: opacity 0.2s 0, visibility 0 0;
    -moz-transition: opacity 0.2s 0, visibility 0 0;
    transition: opacity 0.2s 0, visibility 0 0;
  }
  #cd-login, #cd-signup, #cd-reset-password {
    display: none;
  }
  
  #cd-login.is-selected, #cd-signup.is-selected, #cd-reset-password.is-selected {
    display: block;
  }

.cd-form-bottom-message {
  position: absolute;
  width: 100%;
  left: 0;
  bottom: -30px;
  text-align: center;
  font-size: 14px;
  font-size: 0.875rem;
}
.cd-form-bottom-message a {
  color: #FFF;
  text-decoration: underline;
}

.cd-close-form {
  /* form X button on top right */
  display: block;
  position: absolute;
  width: 40px;
  height: 40px;
  right: 0;
  top: -40px;
  text-indent: 100%;
  white-space: nowrap;
  overflow: hidden;
}



/* Devider css */
.devider{
    border-radius: 25px;
    border-style: solid;
    border-color: rgb(214, 214, 214);
    border-width: thin;
}
/* Contact us css */
.contact-us{
    background-color: #43425d;
    background-repeat: no-repeat;
    color: #fff;

}
/* Banner css*/
.banner-overlay {
    background: linear-gradient(rgba(0,0,0,.7), rgba(0,0,0,.7)), url("../images/banner.jpeg");
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center center;
    color: #fff;
}
.my-link{
    color: white;
    text-decoration: none;
}
.my-link:hover{
    color: white;
    text-decoration: none;
}

.place-icon{
    color: rgb(163, 163, 163);
}
.send-btn{
    margin-left: -45px;
}
.copyright {
  background-color: rgba(0, 0, 0, 0.3);
}

/* Emplacement  */
.carousel {
    width: 100%;
}  
.slide-box {
    display: flex;
    justify-content: space-between;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  height: 100px;
  width: 100px;
  background-image: none;
}

.carousel-control-next-icon:after
{
    content: '>';
    margin-right: -180%;
    font-size: 40px;
    color: rgb(0, 0, 0);
}

.carousel-control-prev-icon:after {
  content: '<';
  margin-left: -180%;
  font-size: 40px;
  color: rgb(0, 0, 0);
}

@media only screen and (max-width: 600px) {
    .nav-searchbar{
        width: 50%;
    }
    .banner-overlay {
        padding-top: 360px; /*312*/
        padding-bottom:15px; /*30*/
    }
    .help{
        padding-top: 100px;
        padding-bottom: 160px;
    }
    .newsletter{
        padding-top: 100px
    }
    .carousel {
        width: 45%;
    }

} 
@media only screen and (min-width: 600px) {
    .banner-overlay {
        padding-top: 360px; /*312*/
        padding-bottom:15px; /*30*/
    }
    .help{
        padding-top: 100px;
        padding-bottom: 160px;
    }
    .newsletter{
        padding-top: 100px
    }
    /*modal*/
    .cd-user-modal-container {
        margin: 4em auto;
    }
    .cd-user-modal-container .cd-switcher a {
        height: 70px;
        line-height: 70px;
    }
    .cd-form-message {
        padding: 2em 2em 0;
    }
    .cd-form {
        padding: 2em;
    }
    .cd-form .fieldset {
       margin: 2em 0;
    }
      .cd-form .fieldset:first-child {
        margin-top: 0;
    }
      .cd-form .fieldset:last-child {
        margin-bottom: 0;
    }
      .cd-form input.has-padding {
        padding: 16px 20px 16px 50px;
    }
      .cd-form input[type=submit] {
        padding: 16px 0;
    }
}
@media only screen and (min-width: 992px) { 
    .banner-overlay {
        padding-top: 312px; /*312 473px*/
        padding-bottom:30px; /*30 60px*/
    }
    .help{
        padding-top: 100px;
        padding-bottom: 160px;
    }
    .newsletter{
        padding-top: 150px
    }
    .social-media-icons{
        padding-top: 150px;
    }
    /*modal*/
    .cd-close-form {
        display: none;
    }    
    
    
    
} 
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

<!DOCTYPE html>
<html lang="fr">


<body>
	<% ArrayList<ArrayList> ressources =(ArrayList<ArrayList>) request.getAttribute("ressources");
	   int pages = (int) request.getAttribute("pages");
	   int current = (int) request.getAttribute("current");
	%>
	<jsp:include page="parts/nav-bar2.jsp"></jsp:include>	
    <!--                     Catalogue                                              -->
    <div class="m-4">
        <!--                     Search                                              -->
        <div class="row search-container">
            <div class="col-2">
                <a href="#" class="btn btn-block my-btn ">Ajouter Ressource</a>
            </div>
            <div class="col-10">
                <form class="form-inline my-2 my-lg-0 search-bar pl-3">
                    <i class="fas fa-search search-bar-icon"></i>
                    <input class="form-control search-bar-input" type="search" placeholder="Search" aria-label="Search">
                </form>
            </div>

        </div>

        <!--                     /Search                                              -->
        <div class="">
            <div class="row">
                <div class="col-2">
                    <h4>Région</h4>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Nord">
                        <label class="custom-control-label" for="Nord">Nord</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Est">
                        <label class="custom-control-label" for="Est">Est</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Ouest" checked>
                        <label class="custom-control-label" for="Est">Ouest</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Nord">
                        <label class="custom-control-label" for="Est">Nord</label>
                    </div>
                    <br>
                    <h4>Catégorie</h4>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Forestiere">
                        <label class="custom-control-label" for="Nord">Forestiere</label><br>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Microorganismes" checked>
                        <label class="custom-control-label" for="Est">Microorganismes</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Agriculture">
                        <label class="custom-control-label" for="Est">Agriculture</label>
                    </div>
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="Marine">
                        <label class="custom-control-label" for="Est">Marine</label>
                    </div>
                </div>
                <div class="col-10">
                	<%for(int i=0 ; i< ressources.size(); ) {
                			if(i%3 == 0){
                	%>              
                    		<div class="row d-flex justify-content-around  mt-4">
                    <%		} %>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" height="220px" width="260px" src="data:image/png;base64,<%= ressources.get(i).get(3) %>" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center"><%= ressources.get(i).get(0) %></h5>
                                    <p class="card-text text-center"><%= ressources.get(i).get(2) %></p>
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
	                                <a class="page-link" href="Catalogue" aria-label="First">
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
                            		<li class="page-item"><a class="page-link" href="Catalogue?page=<%= i %>"><%= i %></a></li>	                            
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
                                	<a class="page-link" href="Catalogue?page=<%= pages %>" aria-label="Last">
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

    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   <script>
   /* nav bar*/
   $(function () {
       $(".dropdown").hover(
           function () {
               $('.dropdown-menu', this).stop(true, true).fadeIn("fast");
               $(this).toggleClass('open');
               $('b', this).toggleClass("caret caret-up");
           },
           function () {
               $('.dropdown-menu', this).stop(true, true).fadeOut("fast");
               $(this).toggleClass('open');
               $('b', this).toggleClass("caret caret-up");
           });
   });

   /* modal */
   jQuery(document).ready(function($){
       var $form_modal = $('.cd-user-modal'),
           $form_login = $form_modal.find('#cd-login'),
           $form_signup = $form_modal.find('#cd-signup'),
           $form_forgot_password = $form_modal.find('#cd-reset-password'),
           $form_modal_tab = $('.cd-switcher'),
           $tab_login = $form_modal_tab.children('li').eq(0).children('a'),
           $tab_signup = $form_modal_tab.children('li').eq(1).children('a'),
           $forgot_password_link = $form_login.find('.cd-form-bottom-message a'),
           $back_to_login_link = $form_forgot_password.find('.cd-form-bottom-message a'),
           $connect_item = $('.connect-item');

       //open modal
       $connect_item.on('click', function(event){


               //show modal layer
               $form_modal.addClass('is-visible'); 
               //show the selected form
               ( $(event.target).is('.cd-sigin') ) ? signup_selected() : login_selected();
           

       });

       //close modal
       $('.cd-user-modal').on('click', function(event){
           if( $(event.target).is($form_modal) || $(event.target).is('.cd-close-form') ) {
               $form_modal.removeClass('is-visible');
           }   
       });
       //close modal when clicking the esc keyboard button
       $(document).keyup(function(event){
           if(event.which=='27'){
               $form_modal.removeClass('is-visible');
           }
       });

       //switch from a tab to another
       $form_modal_tab.on('click', function(event) {
           event.preventDefault();
           ( $(event.target).is( $tab_login ) ) ? login_selected() : signup_selected();
       });

       //hide or show password
       $('.hide-password').on('click', function(){
           var $this= $(this),
               $password_field = $this.prev('input');
           
           ( 'password' == $password_field.attr('type') ) ? $password_field.attr('type', 'text') : $password_field.attr('type', 'password');
           ( 'Hide' == $this.text() ) ? $this.text('Show') : $this.text('Hide');
           //focus and move cursor to the end of input field
           $password_field.putCursorAtEnd();
       });

       //show forgot-password form 
       $forgot_password_link.on('click', function(event){
           event.preventDefault();
           forgot_password_selected();
       });

       //back to login from the forgot-password form
       $back_to_login_link.on('click', function(event){
           event.preventDefault();
           login_selected();
       });

       function login_selected(){
           $form_login.addClass('is-selected');
           $form_signup.removeClass('is-selected');
           $form_forgot_password.removeClass('is-selected');
           $tab_login.addClass('selected');
           $tab_signup.removeClass('selected');
       }

       function signup_selected(){
           $form_login.removeClass('is-selected');
           $form_signup.addClass('is-selected');
           $form_forgot_password.removeClass('is-selected');
           $tab_login.removeClass('selected');
           $tab_signup.addClass('selected');
       }

       function forgot_password_selected(){
           $form_login.removeClass('is-selected');
           $form_signup.removeClass('is-selected');
           $form_forgot_password.addClass('is-selected');
       }

       //REMOVE THIS - it's just to show error messages 
       $form_login.find('input[type="submit"]').on('click', function(event){
           event.preventDefault();
           $form_login.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
       });
       $form_signup.find('input[type="submit"]').on('click', function(event){
           event.preventDefault();
           $form_signup.find('input[type="email"]').toggleClass('has-error').next('span').toggleClass('is-visible');
       });


       //IE9 placeholder fallback
       //credits http://www.hagenburger.net/BLOG/HTML5-Input-Placeholder-Fix-With-jQuery.html
       /*if(!Modernizr.input.placeholder){
           $('[placeholder]').focus(function() {
               var input = $(this);
               if (input.val() == input.attr('placeholder')) {
                   input.val('');
               }
           }).blur(function() {
               var input = $(this);
               if (input.val() == '' || input.val() == input.attr('placeholder')) {
                   input.val(input.attr('placeholder'));
               }
           }).blur();
           $('[placeholder]').parents('form').submit(function() {
               $(this).find('[placeholder]').each(function() {
                   var input = $(this);
                   if (input.val() == input.attr('placeholder')) {
                       input.val('');
                   }
               })
           });
       }*/

   });


   //credits https://css-tricks.com/snippets/jquery/move-cursor-to-end-of-textarea-or-input/
   jQuery.fn.putCursorAtEnd = function() {
       return this.each(function() {
           // If this function exists...
           if (this.setSelectionRange) {
               // ... then use it (Doesn't work in IE)
               // Double the length because Opera is inconsistent about whether a carriage return is one character or two. Sigh.
               var len = $(this).val().length * 2;
               this.setSelectionRange(len, len);
           } else {
               // ... otherwise replace the contents with itself
               // (Doesn't work in Google Chrome)
               $(this).val($(this).val());
           }
       });
   };

   jQuery('#cody-info ul li').eq(1).on('click', function(){
   $('#cody-info').hide();
   });
   console.log("sss");
   </script>

</body>

</html>