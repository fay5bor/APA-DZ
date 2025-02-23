package com.younes.bdd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import com.younes.bdd.ConnectDB;


import java.sql.Statement;

public class RessourceManager {
	static public ArrayList<String> getRessourceGenById(int id) {
		ArrayList<String> output = new ArrayList<String>();
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();
			// String byteImg="";
			PreparedStatement ps = connection
					.prepareStatement("SELECT nom, contenu, type, image FROM ressource_gen WHERE id_ressource = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			output.add(rs.getString( "nom" ));
			output.add(rs.getString( "contenu" ));
			output.add(rs.getString( "type" ));
			byte[] encodeBase64 = Base64.getEncoder().encode(rs.getBytes("image"));
            String base64Encoded = new String(encodeBase64, "UTF-8");
            output.add(base64Encoded);
			rs.close();
			ps.close();

			return output;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	}

	

	static public void addRessourceGen(String nom, String contenu, String type, byte[] img) {
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();
			PreparedStatement ps;
			if (img==null || img.length==0)				
				ps = connection.prepareStatement(
						"INSERT INTO ressource_gen (nom, contenu, type) VALUES (?, ?, ?)");
			else {
				ps = connection.prepareStatement(
						"INSERT INTO ressource_gen (nom, contenu, type, image) VALUES (?, ?, ?, ?)");
				ps.setBytes(4, img);
			}
			ps.setString(1, nom);
			ps.setString(2, contenu);
			ps.setString(3, type);

			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
	}
	
	static public void deleteAllRessources() {
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();

			Statement statement = connection.createStatement();

	     
	        String query = "DELETE from ressource_gen ;";
	        statement.executeUpdate( query );		        
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
	}
	
	static public ArrayList<ArrayList<String>> getPageRessources(int perPage, int page, String search,
			ArrayList<String> categoriesList, ArrayList<String> regionsList){
		int skip = (perPage*page) - perPage;
		ArrayList<ArrayList<String>> output = new ArrayList<ArrayList<String>>();
		Connection connection = null;
	    ResultSet resultat = null;
	    int categoriesListSize= categoriesList.size();

		String query= "";
		String whereClause=(categoriesListSize==0) ? "" : "WHERE (";
		try {
			connection = ConnectDB.getConnection();

			for (int i=0; i<categoriesListSize;i++) {
				whereClause+="type = ?";
				if (i<categoriesListSize-1)
					whereClause+=" OR ";
				
				else 
					whereClause+=")";
			}

			if (search!= null &&  !search.isEmpty()) {
				if (whereClause.isEmpty())
					whereClause="Where ";
				else 
					whereClause+=" AND ";
				whereClause+="to_tsvector('French', nom ) @@ to_tsquery( ? )";

			}
			query += "Select nom, type, image from ressource_gen \n"+
					 whereClause + " \n" +
					 "order by update_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
			PreparedStatement ps = connection.prepareStatement(query);
			int i=1;
			for (String categorie : categoriesList) {
				ps.setString(i, categorie);
				i++;
			}
			if (search!= null &&  !search.isEmpty() ) {
				ps.setString(i, search);
				i++;
			}
			ps.setInt(i, skip);i++;	
			ps.setInt(i, perPage);
			resultat = ps.executeQuery();

	        while ( resultat.next() ) {
	            ArrayList<String> row = new ArrayList<String>();
	            row.add(resultat.getString("nom"));
	            row.add(resultat.getString("type"));
	            byte[] encodeBase64 = Base64.getEncoder().encode(resultat.getBytes("image"));
	            String base64Encoded = new String(encodeBase64, "UTF-8");
	            row.add(base64Encoded);
	            output.add(row);	            
	        }
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
		//System.out.println(query);
		return output;
	}
	static public int countRessources(String search, ArrayList<String> categoriesList ) {
		Connection connection = null;
	    ResultSet resultat = null;
	    int output=0;
	    int categoriesListSize= categoriesList.size();
		String query= "";
		String whereClause=(categoriesListSize==0 ) ? "" : "WHERE (";
		try {
			connection = ConnectDB.getConnection();
			for (int i=0; i<categoriesListSize;i++) {
				whereClause+="type = ?";
				if (i<categoriesListSize-1)
					whereClause+=" OR ";
				else 
					whereClause+=")";
			}
			if (search!= null &&  !search.isEmpty()) {
				if (whereClause.isEmpty())
					whereClause="Where ";
				else 
					whereClause+=" AND ";
				whereClause+="to_tsvector('French', nom ) @@ to_tsquery( ? )";

			}
			query += "SELECT COUNT (*) as count from ressource_gen \n"+
					 whereClause ;
			PreparedStatement ps = connection.prepareStatement(query);
			int i=1;
			for (String categorie : categoriesList) {
				ps.setString(i, categorie);
				i++;
			}
			if (search!= null &&  !search.isEmpty() ) {
				ps.setString(i, search);
				i++;
			}
		
			resultat = ps.executeQuery();
			resultat.next();
			output= resultat.getInt("count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();

			} catch (Exception e) {
				// TODO: handle exception
			}

		}
		return output;
	}
	
}