<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Connexion</title>
        <link type="text/css" rel="stylesheet" href="form.css" />
    </head>
    <body>
        <form method="post" action="login">
            <fieldset>
                <legend>Connexion</legend>
                <p>Vous pouvez vous connecter via ce formulaire.</p>

                <label for="login">Votre Login <span class="requis">*</span></label>
                <input type="text" id="login" name="login" size="20" maxlength="60" />
                <span class="erreur">${cnx.erreurs['login']}</span>
                <br />

                <label for="mdp">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="mdp" name="mdp" value="" size="20" maxlength="20" />
                <span class="erreur">${cnx.erreurs['mdp']}</span>
                <br />

                <input type="submit" value="Connexion" class="sansLabel" />
                <br />
                
                <p class="${empty cnx.erreurs ? 'succes' : 'erreur'}">${cnx.resultat}</p>
            </fieldset>
        </form>
    </body>
</html>