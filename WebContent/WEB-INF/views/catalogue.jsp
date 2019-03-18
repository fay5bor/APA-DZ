<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 0.7">
    <title>Acceuil DZ APA</title>
    <link rel="stylesheet" href="vendors/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
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

    <nav class="navbar navbar-expand-lg navbar-light bg-light pl-5 pr-5">
        <a class="navbar-brand" href="#">
            <img src="images/applogo.png" width="60" height="60" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarTogglerDemo01">

            <ul class="navbar-nav mr-auto ml-md-5 ml-sm-0">

                <li class="nav-item mr-5">
                    <a class="nav-link" href="#">Ressources</a>
                </li>
                <li class="nav-item mr-5">
                    <a class="nav-link" href="#">Instituts</a>
                </li>
                <li class="nav-item mr-5">
                    <a class="nav-link" href="#">Reglementations</a>
                </li>
                <li class="nav-item mr-5">
                    <a class="nav-link" href="#">A propos</a>
                </li>


            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control nav-searchbar" type="search" placeholder="Search" aria-label="Search">
                <i class="fas fa-search search-icon mr-3"></i>
            </form>
            <a href="#0" class="cd-signin btn my-btn-outline connect-item mr-4">CONNECTER</a>


        </div>

        <div class="cd-user-modal">
            <!-- this is the entire modal form, including the background -->
            <div class="cd-user-modal-container">
                <!-- this is the container wrapper -->
                <ul class="cd-switcher">
                    <li><a href="#0">Se connecter</a></li>
                    <li><a href="#0">S'inscrire</a></li>
                </ul>
                <div id="cd-login">
                    <!-- log in form -->
                    <h1 class="text-center mt-5 my-sec-text">Connectez Vous</h1>
                    <form class="cd-form">
                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signin-email" type="email"
                                placeholder="E-mail">
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signin-password" type="text"
                                placeholder="Mot de passe">
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" checked>
                            <label for="remember-me">Se souvenir de moi</label>
                        </p>

                        <p class="fieldset">
                            <input class="full-width btn my-btn" type="submit" value="Login">
                        </p>
                    </form>

                    <p class="cd-form-bottom-message"><a href="#0">Mot de passe oublié?</a></p>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div> <!-- cd-login -->

                <div id="cd-signup">
                    <!-- sign up form -->
                    <h1 class="text-center mt-5 my-sec-text">Inscrivez vous</h1>
                    <form class="cd-form">
                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signup-name" type="text"
                                placeholder="Nom">
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signup-username" type="text"
                                placeholder="Username">
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signup-email" type="email"
                                placeholder="E-mail">
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="signup-password" type="text"
                                placeholder="Mot de passe">
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding btn my-btn" type="submit" value="S'inscrire">
                        </p>
                    </form>

                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </div> <!-- cd-signup -->

                <div id="cd-reset-password">
                    <!-- reset password form -->
                    <p class="cd-form-message">Mot de passe oublié? Entrez votre adresse mail s'il vous plait. Vous
                        allez recevoir un lien pour réinitialiser le mot de passe.</p>

                    <form class="cd-form">
                        <p class="fieldset">
                            <input class="full-width has-padding has-border" id="reset-email" type="email"
                                placeholder="E-mail">
                            <span class="cd-error-message">
                                <!--Error message here!--></span>
                        </p>

                        <p class="fieldset">
                            <input class="full-width has-padding btn my-btn" type="submit" value="Réinitialiser">
                        </p>
                    </form>

                    <p class="cd-form-bottom-message"><a href="#0">Retour au log-in</a></p>
                </div> <!-- cd-reset-password -->
                <a href="#0" class="cd-close-form">Close</a>
            </div> <!-- cd-user-modal-container -->
        </div> <!-- cd-user-modal -->

    </nav>
    <!--------------              /header                         ---------------->

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
                    <div class="row d-flex justify-content-around  mt-4">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-around  mt-4">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row d-flex justify-content-around  mt-4">
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="card">
                                <img class="card-img-top" src="images/card.svg" alt="Card image cap">
                                <div class="card-body">
                                    <h5 class="card-title text-center">Nom ressource1</h5>
                                    <p class="card-text text-center">Description</p>
                                    <div class="row">
                                        <div class="col-2"></div>
                                        <div class="col-8 ">
                                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <nav class="mt-5 d-flex align-items-center flex-column" aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item active"><a class="page-link" href="#">2<span
                                        class="sr-only">(current)</a></li>
                            <li class="page-item"><a class="page-link" href="/catalogue?page=2">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item"><a class="page-link" href="#">6</a></li>
                            <li class="page-item"><a class="page-link" href="#">7</a></li>
                            <li class="page-item"><a class="page-link" href="#">...</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>


    <!--                     /Catalogue                                              -->


    <script src="vendors/jquery/jquery.min.js"></script>
    <script src="vendors/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="vendors/popper.min.js"></script>
    <script src="vendors/tooltip.min.js"></script>
    <script src="vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/java-script.js"></script>

</body>

</html>