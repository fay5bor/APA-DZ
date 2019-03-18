package com.younes.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class TestJDBC {
    /* La liste qui contiendra tous les résultats de nos essais */
	public List<String> executerTests( HttpServletRequest request ) {
		List<String> messages= new ArrayList<String>();
	    /* Chargement du driver JDBC pour MySQL */
	    try {
	        messages.add( "Chargement du driver..." );
	        Class.forName( "com.mysql.jdbc.Driver" );
	        messages.add( "Driver chargé !" );
	    } catch ( ClassNotFoundException e ) {
	        messages.add( "Erreur lors du chargement : le driver n'a pas été trouvé dans le classpath ! <br/>"
	                + e.getMessage() );
	    }

	    /* Connexion à la base de données */
	    String url = "jdbc:mysql://localhost:5432/RG";
	    String utilisateur = "postgres";
	    String motDePasse = "postgres";
	    Connection connexion = null;
	    Statement statement = null;
	    ResultSet resultat = null;
	    try {
	        messages.add( "Connexion à la base de données..." );
	        connexion = DriverManager.getConnection( url, utilisateur, motDePasse );
	        messages.add( "Connexion réussie !" );

	        /* Création de l'objet gérant les requêtes */
	        statement = connexion.createStatement();
	        messages.add( "Objet requête créé !" );

	        /* Exécution d'une requête de lecture */
	        resultat = statement.executeQuery( "SELECT user_table_id, type FROM utilisateur;" );
	        messages.add( "Requête \"SELECT id, email, mot_de_passe, nom FROM Utilisateur;\" effectuée !" );
	 
	        /* Récupération des données du résultat de la requête de lecture */
	        while ( resultat.next() ) {
	            int user_table_id = resultat.getInt( "user_table_id" );
	            String type = resultat.getString( "type" );
	            /* Formatage des données pour affichage dans la JSP finale. */
	            messages.add( "Données retournées par la requête : id = " + user_table_id + ", type = " + type + "." );
	        }
	    } catch ( SQLException e ) {
	        messages.add( "Erreur lors de la connexion : <br/>"
	                + e.getMessage() );
	    } finally {
	        messages.add( "Fermeture de l'objet ResultSet." );
	        if ( resultat != null ) {
	            try {
	                resultat.close();
	            } catch ( SQLException ignore ) {
	            }
	        }
	        messages.add( "Fermeture de l'objet Statement." );
	        if ( statement != null ) {
	            try {
	                statement.close();
	            } catch ( SQLException ignore ) {
	            }
	        }
	        messages.add( "Fermeture de l'objet Connection." );
	        if ( connexion != null ) {
	            try {
	                connexion.close();
	            } catch ( SQLException ignore ) {
	            }
	        }
	    }

	    return messages;
	}
}