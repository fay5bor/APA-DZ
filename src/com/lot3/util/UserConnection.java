package com.lot3.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.lot3.beans.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public final class UserConnection {
	
    private static final String CHAMP_LOGIN  = "login";
    private static final String CHAMP_PASS   = "mdp";

    private String log;
    public String password;
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();
    
    private Connection connexion;
    private PreparedStatement stmt;
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public User connecterUtilisateur( HttpServletRequest request ) {
        /* Récupération des champs du formulaire */
        String login = getValeurChamp( request, CHAMP_LOGIN );
        String mdp = getValeurChamp( request, CHAMP_PASS );

        log = getValeurChamp( request, CHAMP_LOGIN );
        password = getValeurChamp( request, CHAMP_PASS );
        User utilisateur = new User();
        ResultSet rs=null;
    	loadDatabase();
        /* Validation du champ login */
        try {
            rs=validationLogin( login );
            /* Validation du champ mot de passe */
            try {
                validationMotDePasse( rs,mdp );
            } catch ( Exception e ) {
                setErreur( CHAMP_PASS, e.getMessage() );
            }
        } catch ( Exception e ) {
            setErreur( CHAMP_LOGIN, e.getMessage() );
        }

        /* Initialisation du résultat global de la validation */
        if ( erreurs.isEmpty() ) {
        	try {
				utilisateur.setLogin( rs.getString("login") );
	            utilisateur.setMdp( rs.getString("mdp") );
	            utilisateur.setType( rs.getString("type") );
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            resultat = "Succès de la connexion ";
        } else {
            resultat = "Échec de la connexion ";
        }

      //fermeture de la connexion 
        try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return utilisateur;
    }

    /**
     * Valide l'adresse email saisie.
     */
    private ResultSet validationLogin( String login ) throws Exception {
    	ResultSet rs=null;
    	if ( login == null ) {
        	throw new Exception( "Veuillez entrez votre Login SVP " );
        }
        else {
        	String query = "SELECT * FROM public.\"USER\" WHERE LOGIN = ?";
        	stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        	stmt.setString(1, login);
            rs = stmt.executeQuery();
           
            if(!rs.next()) {
            	rs.beforeFirst();
            	throw new Exception( "Merci de vérifier votre Login " );
            }
        }
        return rs;
    }

    /**
     * Valide le mot de passe saisi.
     */
    private void validationMotDePasse( ResultSet rs,String motDePasse ) throws Exception {
        if ( motDePasse != null ) {
            if ( !motDePasse.equals(rs.getString("mdp")) ) {
                throw new Exception( "Veuillez vérifiez votre mot de passe " );
            }
        } else {
            throw new Exception( "Merci de saisir votre mot de passe " );
        }
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
    
    private void loadDatabase() {
        // Chargement du driver
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
        	System.out.println("blem de chargement ");
        }
    	
        try {
            connexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/RG", "postgres", "postgres");
        } catch (SQLException e) {
        	System.out.println("blem de connexion ");
            e.printStackTrace();
        }
    }

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}
    
}