package com.younes.bdd;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.younes.beans.CarteConnaissance;
import com.younes.beans.Connaissance;


public class ConnaissanceMng {
	
	static public Connaissance getConnaissanceById(int id) {
		Connaissance output = new Connaissance();
		PreparedStatement ps = null; 

		try {
			Connection connection = ConnectDB.getConnection();
			ps = connection
					.prepareStatement("SELECT * FROM connaissance WHERE id_con = " + String.valueOf(id));
			ResultSet rs = ps.executeQuery();
			rs.next();
			if (rs.getInt("id_con") == 0) return null;
			output.setIdConnaissance(rs.getInt("id_con"));
			output.setIdChercheur(rs.getInt("id_chercheur"));
			output.setIdRessource(rs.getInt("id_ressource"));
			output.setTitre(rs.getString( "titre" ));
			output.setType(rs.getString( "type" ));
			output.setContenu(rs.getString( "contenu" ));
			output.setResume(rs.getString( "resume" ));
            output.setImage(rs.getBytes("image"));
			ps.close();
			ps = connection
					.prepareStatement("SELECT id_chercheur, nom, prenom, laboratoire FROM chercheur WHERE id_chercheur = " + String.valueOf(output.getIdChercheur()));
			rs = ps.executeQuery();
			rs.next();
			output.setChercheur(rs.getString("nom") + " " + rs.getString("prenom") + ", " + rs.getString("laboratoire"));
			
			return output;
            } catch (SQLException e) {
                e.printStackTrace(System.err);
                return null;
            } catch (Exception e) {
                e.printStackTrace(System.err);
                return null;
            } finally {
            	if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            }
			
            
	}
	
	static public String getPath(Connaissance con) throws UnsupportedEncodingException {

	    String path = con.getClass().getClassLoader().getResource("").getPath();
	    String fullPath = URLDecoder.decode(path, "UTF-8");
	    String pathArr[] = fullPath.split("/WEB-INF/classes/");
	    fullPath = pathArr[0];

	    return fullPath;

	}

	static public ArrayList<CarteConnaissance> getConnaissancesForRessource(int idRessource, int idConnaissance) {
		ArrayList<CarteConnaissance> output = new ArrayList<CarteConnaissance>();
		PreparedStatement ps = null; 

		try {
			Connection connection = ConnectDB.getConnection();
			ps = connection
					.prepareStatement("SELECT id_con, titre, type, resume, image FROM connaissance WHERE id_ressource = " + String.valueOf(idRessource));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if (rs.getInt("id_con") != idConnaissance) {
					CarteConnaissance carte = new CarteConnaissance();
					
					carte.setIdConnaissance(rs.getInt("id_con"));
					carte.setTitre(rs.getString( "titre" ));
					carte.setType(rs.getString( "type" ));
					carte.setResume(rs.getString( "resume" ));
		            carte.setImage(rs.getBytes("image"));
		            
		            output.add(carte);
				}
			}
			
			return output;
            } catch (SQLException e) {
                e.printStackTrace(System.err);
                return null;
            } catch (Exception e) {
                e.printStackTrace(System.err);
                return null;
            } finally {
            	if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            }	
	}
	
	static public HashMap<String, String> getConnaissancePath (int idRessource) {
		HashMap<String, String> path = new HashMap<String, String>();
		PreparedStatement ps = null; 

		try {
			Connection connection = ConnectDB.getConnection();
			ps = connection
					.prepareStatement("SELECT nom, type FROM ressource_gen WHERE id_ressource = " + String.valueOf(idRessource));
			ResultSet rs = ps.executeQuery();	
			rs.next();
			
			path.put("nom", rs.getString( "nom" ));
			path.put("type", rs.getString( "type" ));

			return path;
			
            } catch (SQLException e) {
                e.printStackTrace(System.err);
                return null;
            } catch (Exception e) {
                e.printStackTrace(System.err);
                return null;
            } finally {
            	if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            }
	}


	static public void addConnaissance(Connaissance connaissance) {
		PreparedStatement ps = null; 
		Connection connection = null;
	
		try {
			connection = ConnectDB.getConnection();

			if (connaissance.getImage() == null) { //le cas où on n'introduit de photo pour mettre la photo par default
				ps = connection.prepareStatement(
						"INSERT INTO connaissance (id_ressource, id_chercheur, titre, type, contenu, resume) VALUES (?, ?, ?, ?, ?, ?)");
				ps.setInt(1, connaissance.getIdRessource());
				ps.setInt(2, connaissance.getIdChercheur());
				ps.setString(3, connaissance.getTitre());
				ps.setString(4, connaissance.getType());
				ps.setString(5, connaissance.getContenu());
				ps.setString(6, connaissance.getResume());
			} else {
				ps = connection.prepareStatement(
						"INSERT INTO connaissance (id_ressource, id_chercheur, titre, type, contenu, image, resume) VALUES (?, ?, ?, ?, ?, ?, ?)");
				ps.setInt(1, connaissance.getIdRessource());
				ps.setInt(2, connaissance.getIdChercheur());
				ps.setString(3, connaissance.getTitre());
				ps.setString(4, connaissance.getType());
				ps.setString(5, connaissance.getContenu());
				ps.setBytes(6, connaissance.getImage());
				ps.setString(7, connaissance.getResume());
			}
			
			ps.executeUpdate();
			
	        } catch (SQLException e) {
	            e.printStackTrace(System.err);
	        } catch (Exception e) {
	            e.printStackTrace(System.err);
	        } finally {
	        	if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						e.printStackTrace(System.err);
					}
	        	if (connection != null) {
	        		try {
		        		connection.close();
		        	} catch (Exception e) {
		        		e.printStackTrace(System.err);
		        	}
	        	}
	        	
	        }
	}
        
}