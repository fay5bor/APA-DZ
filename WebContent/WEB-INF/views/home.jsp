<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width = device-width, initial-scale = 0.7">
    <title>Acceuil DZ APA</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>

    <!------------------------------>

    <!------------             header                   ------------------>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="${pageContext.request.contextPath}/images/applogo.png" width="60" height="60" alt="">
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
                        <a class="nav-link" href="#">Instituts</a>
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
                <button type="button" class="btn my-btn-outline">CONNECTER</button>
            </div>
        </div>
    </nav>
    <!--------------              /header                         ---------------->

    <!--------------              Banner                         ---------------->
    <div class="banner-overlay">
        <div class="container">
            <div class="row justify-content-lg-end align-items-lg-end">
                <div class="col-lg-6 offset-lg-0 order-lg-1 col-md-8 offset-md-2
            col-sm-12 order-sm-2 d-flex justify-content-lg-end justify-content-md-center justify-content-sm-center">
                    <h5><a class="my-link" href="#">Comment demander une ressource ?</a></h5>
                </div>
                <div class="col-lg-4 offset-lg-0 order-lg-2 col-md-8 offset-md-2 order-md-1 col-sm-12 order-sm-1">
                    <button type="button" class="btn my-btn btn-lg btn-block">Demander une ressource</button>
                </div>

            </div>
        </div>
    </div>
    <!--------------              /Banner                         ---------------->

    <!--------------              Help                         ---------------->
    <div class="container help">
        <div class="row">
            <div class="col-lg-6 order-lg-1 order-md-2 order-sm-2 d-flex justify-content-center
         mt-lg-0 mt-md-3 mt-sm-3">
                <img src="${pageContext.request.contextPath}/images/clipboard.svg" width="250" height="250" alt="">
            </div>
            <div
                class="col-lg-6 order-lg-2 order-md-1 order-sm-1  align-items-center text-lg-left text-md-center text-sm-center">
                <h3>C'EST QUOI APA DZ</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                    when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                    It has survived not only five centuries, but also the leap into electronic typesetting,
                    remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                    sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                    like Aldus PageMaker including versions of Lorem Ipsum.</p>
            </div>
        </div>
    </div>
    <!--------------              /Help                         ---------------->

    <!--------------              Devider                         ---------------->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 devider"></div>
        </div>
    </div>
    <!--------------              /Devider                         ---------------->

    <!--------------              Ressources                         ---------------->
    <div class="container">
        <div class="card-group mt-5 mb-5">
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Nom ressource</h5>
                    <p class="card-text text-center">Description</p>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 text-centeralign-items-center">
                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Nom ressource</h5>
                    <p class="card-text text-center">Description</p>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 text-center">
                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Nom ressource</h5>
                    <p class="card-text text-center">Description</p>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 text-center">
                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Nom ressource</h5>
                    <p class="card-text text-center">Description</p>
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-8 text-center">
                            <button type="button" class="btn btn-primary btn-block">Détail</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--------------              /Ressources                         ---------------->

    <!--------------              Devider                         ---------------->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 devider"></div>
        </div>
    </div>
    <!--------------              /Devider                         ---------------->

    <!--------------              Emplacement                         ---------------->
    <div class="container">
        <div class="card-group mt-5 mb-5">
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" height="260" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Emplacement</h5>
                    <p class="card-text text-center"><i class="fas fa-map-marker-alt place-icon"></i> Description</p>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" height="260" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Emplacement</h5>
                    <p class="card-text text-center"><i class="fas fa-map-marker-alt place-icon"></i> Description</p>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" height="260" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Emplacement</h5>
                    <p class="card-text text-center"><i class="fas fa-map-marker-alt place-icon"></i> Description</p>
                </div>
            </div>
            <div class="card mr-3 ml-3">
                <img class="card-img-top" src="${pageContext.request.contextPath}/images/card.svg" height="260" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title text-center">Emplacement</h5>
                    <p class="card-text text-center"><i class="fas fa-map-marker-alt place-icon"></i> Description</p>
                </div>
            </div>
        </div>
    </div>
    <!--------------              /Emplacement                         ---------------->


    <!--------------              Devider                         ---------------->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 devider"></div>
        </div>
    </div>
    <!--------------              /Devider                         ---------------->


    <!--------------              Newsletter                         ---------------->
    <div class="container newsletter mb-5">
        <div class="row">
            <div class="col-lg-7 col-md-12 text-lg-left text-md-center text-sm-center">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2 offset-md-0">
                        <h3>REJOIGNEZ NOTRE</h2>
                    </div>
                </div><br />
                <div class="row">
                    <div class="col-lg-8 offset-lg-3 offset-md-0">
                        <h2 class="font-weight-bold my-sec-text">NEWS LETTER</h2>
                    </div>
                </div><br />
                <div class="row">
                    <div class="col-lg-8 offset-lg-3 offset-md-0">
                        <h4>POUR RECEVOIR DES NOUVEATES SUR L'APA EN ALGERIE</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-8 offset-lg-0 offset-md-2 pt-5">
                <form>
                    <div class="form-group shadow p-3 mb-5 bg-black rounded ">
                        <input class="form-control form-control-lg mt-4" type="text" placeholder="Nom"><br />
                        <input class="form-control form-control-lg mt-2" type="text"
                            placeholder="email@gmail.com"><br />
                        <button type="button" class="btn btn-lg btn-block my-btn mt-2">REJOINDRE</button><br />
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!--------------              Contact us                         ---------------->
    <div class="contact-us">
        <div class="container">
            <div class="row pt-5 d-flex justify-content-lg-start justify-content-md-center">
                <div class="col-lg-5 col-md-8 offset-lg-0 col-sm-12">
                    <h2 class="font-weight-bold my-sec-text">Contactez nous</h2>
                    <form>
                        <div class="form-group  p-3 mb-5 rounded">
                            <div class="row">
                                <input class="form-control form-control-lg" type="text" placeholder="Nom"><br />
                            </div><br>
                            <div class="row">
                                <input class="form-control form-control-lg" type="text"
                                    placeholder="email@gmail.com"><br />
                            </div><br>
                            <div class="row">
                                <input class="form-control form-control-lg" type="text" placeholder="Sujet">
                            </div><br>
                            <div class="row align-items-center">
                                <textarea class="col-12 form-control form-control-lg" rows="4" cols="50"
                                    placeholder="Message"></textarea>
                                <a class="send-btn col-1" href="#"><img src="images/send-btn.png" width="60" height="60"
                                        alt=""></a>
                            </div>

                        </div>
                    </form>
                </div>
                <div
                    class="social-media-icons col-lg-3 col-md-6 col-sm-8 col-sm-6 offset-lg-2 pb-5 d-flex justify-content-lg-start justify-content-md-center justify-content-sm-end">
                    <a href="#">
                        <img src="images/facebook.svg" width="40" height="40" alt="">
                    </a>
                    <a class="ml-3" href="#">
                        <img src="images/twitter.svg" width="45" height="45" alt="">
                    </a>
                    <a class="ml-4" href="#">
                        <img src="images/youtube.svg" width="45" height="45" alt="">
                    </a>
                </div>
            </div>


        </div>
        <div class="copyright py-4 text-center text-white">
            <div class="container">
                <small>Copyright &copy; APA-DZ</small>
            </div>
        </div>

    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/java-script.js"></script>

</body>

</html>