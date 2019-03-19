package com.younes.bdd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import java.sql.Statement;

public class ConnectionBdRessource {
	public ArrayList<String> getRessourceById(int ressource_table, int id) {
		ArrayList<String> output = new ArrayList<String>();
		ConnectDB connect = new ConnectDB();
		Connection connection = null;
		try {
			connection = connect.getConnection();
			// String byteImg="";
			PreparedStatement ps = connection
					.prepareStatement("SELECT nom, contenu, type FROM ressource_" + ressource_table + " WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			output.add(rs.getString( "nom" ));
			output.add(rs.getString( "contenu" ));
			output.add(rs.getString( "type" ));
			rs.close();
			ps.close();

			return output;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	}

	public byte[] getRessourceImageById(int ressource_table, int id) {
		byte[] byteImg = null;
		ConnectDB connect = new ConnectDB();
		Connection connection = null;
		try {
			connection = connect.getConnection();
			// String byteImg="";
			PreparedStatement ps = connection
					.prepareStatement("SELECT image FROM ressource_" + ressource_table + " WHERE id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				byteImg = rs.getBytes(1);
				// use the data in some way here
			}
			rs.close();
			ps.close();

			return byteImg;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}

	}

	public void addRessource(int ressource_table, String nom, String contenu, String type, byte[] img) {
		ConnectDB connect = new ConnectDB();
		Connection connection = null;
		try {
			connection = connect.getConnection();
			
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
		ConnectDB connect = new ConnectDB();
		Connection connection = null;
		try {
			connection = connect.getConnection();

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
	
	public ArrayList<ArrayList> getPageRessourcesInfos(int ressource_table, int perPage, int page){
		int skip = (perPage*page) - perPage;
		ArrayList<ArrayList> output = new ArrayList<ArrayList>();
		ConnectDB connect = new ConnectDB();
		Connection connection = null;
	    ResultSet resultat = null;

		try {
			connection = connect.getConnection();

			Statement statement = connection.createStatement();
			String query= "SELECT nom, contenu, type from ressource_"+ressource_table+" order by id_chercheur2"
					+ " OFFSET "+ skip +" ROWS FETCH NEXT "+ perPage  +" ROWS ONLY";
			resultat = statement.executeQuery(query);
	        while ( resultat.next() ) {
	            ArrayList<String> row = new ArrayList<String>();
	            row.add(resultat.getString("nom"));
	            row.add(resultat.getString("contenu"));
	            row.add(resultat.getString("type"));
	            output.add(row);	            
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
		return output;
	}
	
}