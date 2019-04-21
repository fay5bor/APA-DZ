package com.younes.bdd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import java.sql.Statement;

public class ConnectionBdRessource {
	public ArrayList<String> getRessourceById(int ressource_table, int id) {
		ArrayList<String> output = new ArrayList<String>();
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();
			// String byteImg="";
			PreparedStatement ps = connection
					.prepareStatement("SELECT nom, contenu, type, image FROM ressource_" + ressource_table + " WHERE id = ?");
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

	

	public void addRessource(int ressource_table, String nom, String contenu, String type, byte[] img) {
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();
			
			PreparedStatement ps = connection.prepareStatement(
					"INSERT INTO ressource_" + ressource_table + " (nom, contenu, type, image) VALUES (?, ?, ?, ?)");
			ps.setString(1, nom);
			ps.setString(2, contenu);
			ps.setString(3, type);
			ps.setBytes(4, img);

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
	
	public void deleteAllRessources() {
		Connection connection = null;
		try {
			connection = ConnectDB.getConnection();

			Statement statement = connection.createStatement();

	        for (int i=1; i< 6;i++) {
	        	String query = "DELETE from ressource_"+i+" ;";
	        	statement.executeUpdate( query );	
	        }
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
	
	public ArrayList<ArrayList> getPageRessources(int perPage, int page, String search, ArrayList<String> categoriesList){
		int skip = (perPage*page) - perPage;
		ArrayList<ArrayList> output = new ArrayList<ArrayList>();		
		Connection connection = null;
	    ResultSet resultat = null;
	    int categoriesListSize= categoriesList.size();

		try {
			connection = ConnectDB.getConnection();
			String query= "";
			int numFiltre=0;
			if (categoriesList.contains("Forestiere") || categoriesListSize==0) {
				query+="(SELECT nom, contenu, type, image, update_date from ressource_1) \n";
				numFiltre++;
			}
			
			if (categoriesList.contains("Microorganismes") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_2) \n";
				numFiltre++;
			}

			if (categoriesList.contains("Agriculture") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_3) \n";
				numFiltre++;
			}

			if (categoriesList.contains("Marine") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_4) \n";
				numFiltre++;
			}
			
			if (categoriesList.contains("Alimentaire") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_5)  \n";
			}
			
			if (search!= null &&  !search.isEmpty()) {
				query = "SELECT * FROM ( "+ query + " ) as ressource_table  \n"+
						"WHERE to_tsvector('French', nom ) @@ to_tsquery('"+search+"') \n";
			}
			query += "order by update_date desc OFFSET ? ROWS FETCH NEXT ? ROWS ONLY;";
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setInt(1, skip);
			ps.setInt(2, perPage);			
			resultat = ps.executeQuery();

	        while ( resultat.next() ) {
	            ArrayList<String> row = new ArrayList<String>();
	            row.add(resultat.getString("nom"));
	            row.add(resultat.getString("contenu"));
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
		return output;
	}
	public int countRessources(String search, ArrayList<String> categoriesList ) {
		Connection connection = null;
	    ResultSet resultat = null;
	    int output=0;
	    int categoriesListSize= categoriesList.size();

		try {
			connection = ConnectDB.getConnection();
			Statement statement = connection.createStatement();
			String query= "SELECT count(*) count from( \n";
			int numFiltre=0;
			if (categoriesList.contains("Forestiere") || categoriesListSize==0) {
				query+="(SELECT nom, contenu, type, image, update_date from ressource_1) \n";
				numFiltre++;
			}
			
			if (categoriesList.contains("Microorganismes") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_2) \n";
				numFiltre++;
			}

			if (categoriesList.contains("Agriculture") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_3) \n";
				numFiltre++;
			}

			if (categoriesList.contains("Marine") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_4) \n";
				numFiltre++;
			}
			
			if (categoriesList.contains("Alimentaire") || categoriesListSize==0) {
				if (numFiltre>0)
					query+="UNION ";
				query+="(SELECT nom, contenu, type, image, update_date from ressource_5)  \n";
			}
			query+=") as ressource_table \n";
			if (search!= null && !search.isEmpty()) {
				query += "WHERE to_tsvector('French', nom ) @@ to_tsquery('"+search+"') \n";
			}
			resultat = statement.executeQuery(query);
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