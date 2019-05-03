
    <nav class="navbar navbar-expand-lg navbar-light bg-light pl-5 pr-5">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/Home">
            <img src="${pageContext.request.contextPath}/ressources/images/applogo.png" width="60" height="60" alt="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " id="navbarTogglerDemo01">

            <ul class="navbar-nav mr-auto ml-lg-5 ml-sm-0">

                <li class="nav-item mr-4">
                    <a class="nav-link" href="${pageContext.request.contextPath}/Catalogue">Ressources</a>
                </li>
                <li class="nav-item mr-4">
                    <a class="nav-link" href="#">Instituts</a>
                </li>
                <li class="nav-item mr-4">
                    <a class="nav-link" href="#">Reglementations</a>
                </li>
                <li class="nav-item mr-4">
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
