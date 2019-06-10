package com.lot3.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.lot3.beans.Admin;
import com.lot3.beans.Chercheur;
import com.lot3.beans.DemEntreprise;
import com.lot3.beans.Institution;
import com.lot3.beans.User;

public class CompteManager {
	
    public Map<String, String> erreurs = new HashMap<String, String>();    
    public Connection connexion;
    public PreparedStatement stmt;

	
    public List<Chercheur> getCmpCher(){
    	List<Chercheur> liste=new ArrayList<Chercheur>();
    	Chercheur c;
    	this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT id_chercheur,user_c_chercheur, nom, prenom, date_nai, laboratoire,profil FROM public.chercheur;");
			while(resultSet.next()) {
				c=new Chercheur();
				c.setId(resultSet.getInt("user_c_chercheur"));
				c.setNom(resultSet.getString("nom"));
				c.setPrenom(resultSet.getString("prenom"));
				c.setDateNai(resultSet.getDate("date_nai"));
				c.setLabo(resultSet.getString("laboratoire"));
				c.setProfil(resultSet.getString("profil"));
				
				String query = "SELECT \"Activer\" FROM public.\"USER\" where user_id=?;";
				stmt = connexion.prepareStatement(query);
				stmt.setInt(1, c.getId());
	        	ResultSet resultSet1=stmt.executeQuery();
				if(resultSet1.next()) {
					c.setActive(resultSet1.getBoolean("Activer"));							
				}						
				
				liste.add(c);								
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	
    	return liste;
    }
    
    public List<Admin> getCmpAdmin(){
    	List<Admin> liste=new ArrayList<Admin>();
    	Admin a;
    	this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT user_a_id, nom, prenom, date_nai, privilege, email, adresse,profil FROM public.admin;");
			while(resultSet.next()) {
				a=new Admin();
				a.setId(resultSet.getInt("user_a_id"));
				a.setNom(resultSet.getString("nom"));
				a.setPrenom(resultSet.getString("prenom"));
				a.setDateNai(resultSet.getDate("date_nai"));
				a.setPrivilege(resultSet.getString("privilege"));
				a.setEmail(resultSet.getString("email"));
				a.setProfil(resultSet.getString("profil"));
				
				String query = "SELECT \"Activer\" FROM public.\"USER\" where user_id=?;";
				stmt = connexion.prepareStatement(query);
				stmt.setInt(1, a.getId());
	        	ResultSet resultSet1=stmt.executeQuery();
				if(resultSet1.next()) {
					a.setActive(resultSet1.getBoolean("Activer"));							
				}						
				
				liste.add(a);								
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	
    	return liste;
    }
    
    public void creCptCher(HttpServletRequest request,String pathImg) {
    	String login = getValeurChamp( request, "login" );
        String mdp = getValeurChamp( request, "mdp" );
        String email = getValeurChamp( request, "email" );
        String nom = getValeurChamp( request, "nom" );
        String prenom = getValeurChamp( request, "prenom" );
        String date = getValeurChamp( request, "date" );
        String adresse = getValeurChamp( request, "adresse" );
        String labo = getValeurChamp( request, "laboratoire" );
        
        this.loadDatabase();
		try {
			if(login==null || mdp==null || email==null || nom==null || prenom==null || date==null || adresse==null)
				this.erreurs.put("creation", "Veuillez remplir tous les champs");
			else if(this.newLogin(login)) this.erreurs.put("creation", "Ce login existe déja");
			else {
				String query = "INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'chercheur', 'true');";
				stmt = connexion.prepareStatement(query);       	        	
		        stmt.setString(1, login);
		        stmt.setString(2, mdp);
		        stmt.executeUpdate();
		        
		        query="SELECT user_id from public.\"USER\" where login=?;";
		    	stmt = connexion.prepareStatement(query);       	        	
	        	stmt.setString(1, login);
	        	ResultSet resultSet=stmt.executeQuery();
	        	resultSet.next();
	        	int idUser=resultSet.getInt("user_id");
	        	
	        	query="INSERT INTO public.chercheur(user_c_chercheur, nom, prenom, date_nai, laboratoire, email, adresse,profil) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
				stmt = connexion.prepareStatement(query);       	        	
		        stmt.setInt(1, idUser);
		        stmt.setString(2, nom);
		        stmt.setString(3, prenom);
		        stmt.setTimestamp(4,new java.sql.Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime()));
		        stmt.setString(5, labo);
	        	stmt.setString(6, email);
	        	stmt.setString(7, adresse);
	        	stmt.setString(8, login+".png");
		        stmt.executeUpdate();
	        	
		     // creates the save directory if it does not exists
	            File fileSaveDir = new File(pathImg);
	            if (!fileSaveDir.exists()) {
	                fileSaveDir.mkdir();
	            }

	            String extention;
	            if(request.getPart("img").getSize()!=0){
	            	   
	            	Part part=request.getPart("img");
		            String filename="";
		            for (String cd : part.getHeader("content-disposition").split(";")) {
		                if (cd.trim().startsWith("filename")) {
		                    filename=cd.substring(cd.indexOf('=') + 1).trim()
		                            .replace("\"", "");
		                }	                
		            }	  
		            extention=filename.substring(filename.lastIndexOf("."));
		            part.write(pathImg+"/chercheur" + File.separator+login+".png");
	            	   
	            }
	            else {	
	            	extention=".png";
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"chercheur.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/chercheur" + File.separator +login+extention);           	
	            	IOUtils.copy(input, output);	            	
	            }	
		        
			}
		} catch (Exception e) {
			e.printStackTrace();
			this.erreurs.put("creation", "Erreur de connexion, veuillez réessayer plus tard");
		}
    }
    
    public void creCptAdmin(HttpServletRequest request,String pathImg) {
    	String login = getValeurChamp( request, "login" );
        String mdp = getValeurChamp( request, "mdp" );
        String email = getValeurChamp( request, "email" );
        String nom = getValeurChamp( request, "nom" );
        String prenom = getValeurChamp( request, "prenom" );
        String date = getValeurChamp( request, "date" );
        String adresse = getValeurChamp( request, "adresse" );
        String privilege = getValeurChamp( request, "privilege" );
        
        this.loadDatabase();
		try {
			if(login==null || mdp==null || email==null || nom==null || prenom==null || date==null || adresse==null || privilege==null)
				this.erreurs.put("creation", "Veuillez remplir tous les champs");
			else if(this.newLogin(login)) this.erreurs.put("creation", "Ce login existe déja");
			else {
				String query="";
				if(privilege.equals("A")) 
					query = "INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'adminA', 'true');";
				if(privilege.equals("B"))
					query = "INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'adminB', 'true');";
				stmt = connexion.prepareStatement(query);       	        	
		        stmt.setString(1, login);
		        stmt.setString(2, mdp);
		        stmt.executeUpdate();
		        
		        query="SELECT user_id from public.\"USER\" where login=?;";
		    	stmt = connexion.prepareStatement(query);       	        	
	        	stmt.setString(1, login);
	        	ResultSet resultSet=stmt.executeQuery();
	        	resultSet.next();
	        	int idUser=resultSet.getInt("user_id");
	        	
	        	query="INSERT INTO public.admin(user_a_id, nom, prenom, date_nai, privilege, email, adresse, profil) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
				stmt = connexion.prepareStatement(query);       	        	
		        stmt.setInt(1, idUser);
		        stmt.setString(2, nom);
		        stmt.setString(3, prenom);
		        stmt.setTimestamp(4,new java.sql.Timestamp(new SimpleDateFormat("yyyy-MM-dd").parse(date).getTime()));
		        stmt.setString(5, privilege);
	        	stmt.setString(6, email);
	        	stmt.setString(7, adresse);
	        	stmt.setString(8, login+".png");
		        stmt.executeUpdate();
	        	
		        // creates the save directory if it does not exists
	            File fileSaveDir = new File(pathImg);
	            if (!fileSaveDir.exists()) {
	                fileSaveDir.mkdir();
	            }

	            String extention;
	            if(request.getPart("img").getSize()!=0){
	            	   
	            	Part part=request.getPart("img");
		            String filename="";
		            for (String cd : part.getHeader("content-disposition").split(";")) {
		                if (cd.trim().startsWith("filename")) {
		                    filename=cd.substring(cd.indexOf('=') + 1).trim()
		                            .replace("\"", "");
		                }	                
		            }	  
		            extention=filename.substring(filename.lastIndexOf("."));
		            part.write(pathImg+"/admin" + File.separator+login+".png");
	            	   
	            }
	            else {	
	            	extention=".png";
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"admin.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/admin" + File.separator +login+".png");           	
	            	IOUtils.copy(input, output);	            	
	            }	
		        
			}
		} catch (Exception e) {
			this.erreurs.put("creation", "Erreur de connexion, veuillez réessayer plus tard");
		}
    }
    
    public Chercheur getProfilChercheur(String login) {
    	Chercheur c=null;
		
		this.loadDatabase();
		try {
			String requete="SELECT user_id FROM public.\"USER\" where login=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setString(1, login);
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				int id=resultSet.getInt("user_id");
				String requete1="SELECT id_chercheur, user_c_chercheur, nom, prenom, date_nai, laboratoire, email, adresse, profil FROM public.chercheur where user_c_chercheur=?;";
				PreparedStatement st1=connexion.prepareStatement(requete1);
				st1.setInt(1, id);
				ResultSet resultSet1=st1.executeQuery();
				if(resultSet1.next()) {
					c=new Chercheur();
					c.setId(resultSet1.getInt("id_chercheur"));
					c.setIdCmp(resultSet1.getInt("user_c_chercheur"));
					c.setNom(resultSet1.getString("nom"));
					c.setPrenom(resultSet1.getString("prenom"));
					c.setDateNai(resultSet1.getDate("date_nai"));
					c.setEmail(resultSet1.getString("email"));
					c.setAdresse(resultSet1.getString("adresse"));
					c.setLabo(resultSet1.getString("laboratoire"));
					c.setProfil(resultSet1.getString("profil"));							
				}						
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return c;
	}
	
    public String setProfilChercheur(HttpServletRequest request, String login) {
		String mdp=getValeurChamp(request,"mdp");
		String email=getValeurChamp(request,"email");
		String adresse=getValeurChamp(request,"adresse");
		String nom=getValeurChamp(request,"nom");
		String prenom=getValeurChamp(request,"prenom");
		String laboratoire=getValeurChamp(request,"laboratoire");
		String dateN=getValeurChamp(request,"dateN");
		
		this.loadDatabase();
		try {
			if(laboratoire==null || email==null || mdp==null || nom==null || prenom==null || dateN==null || adresse==null )
				return "Veuillez remplir tous les champs SVP";			
			else {
				Date dateNai=new SimpleDateFormat("yyyy-MM-dd").parse(dateN);
				java.sql.Timestamp sqlDate = new java.sql.Timestamp(dateNai.getTime());
				String requete="SELECT user_id FROM public.\"USER\" where login=?;";
				PreparedStatement st=connexion.prepareStatement(requete);
				st.setString(1, login);
				ResultSet resultSet=st.executeQuery();
				if(resultSet.next()) {
					int id=resultSet.getInt("user_id");
					String requete1="UPDATE public.\"USER\" SET mdp=? WHERE login=?;";
					PreparedStatement st1=connexion.prepareStatement(requete1);
					st1.setString(1, mdp);
					st1.setString(2, login);					
					st1.executeUpdate();
									
					String query = "UPDATE public.chercheur SET nom=?, prenom=?, date_nai=?, laboratoire=?, email=?, adresse=? WHERE user_c_chercheur=?;";
		        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

		        	stmt.setString(1, nom);
		        	stmt.setString(2, prenom);
		        	stmt.setTimestamp(3, sqlDate);
		        	stmt.setString(5, email);
		        	stmt.setString(4, laboratoire);
		        	stmt.setString(6, adresse);
		        	stmt.setInt(7, id);
		            stmt.executeUpdate();
		            
		            HttpSession session = request.getSession();
		    		User utilisateur=(User)session.getAttribute("utilisateur");
		    		utilisateur.setMdp(mdp);
		            return "success";
					}
				else return "Echec";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "erreur de connexion";
		}
	}
	
    public Admin getProfilAdmin(String login) {
    	Admin admin=null;
		
		this.loadDatabase();
		try {
			String requete="SELECT user_id FROM public.\"USER\" where login=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setString(1, login);
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				int id=resultSet.getInt("user_id");
				String requete1="SELECT id_admin, user_a_id, nom, prenom, date_nai, privilege, email, adresse, profil FROM public.admin where user_a_id=?;";
				PreparedStatement st1=connexion.prepareStatement(requete1);
				st1.setInt(1, id);
				ResultSet resultSet1=st1.executeQuery();
				if(resultSet1.next()) {
					admin=new Admin();
					admin.setId(resultSet1.getInt("id_admin"));
					admin.setIdCmp(resultSet1.getInt("user_a_id"));
					admin.setNom(resultSet1.getString("nom"));
					admin.setPrenom(resultSet1.getString("prenom"));
					admin.setDateNai(resultSet1.getDate("date_nai"));
					admin.setEmail(resultSet1.getString("email"));
					admin.setAdresse(resultSet1.getString("adresse"));
					admin.setPrivilege(resultSet1.getString("privilege"));									
				}						
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return admin;
	}
	
    public String setProfilAdmin(HttpServletRequest request, String login) {
		String mdp=getValeurChamp(request,"mdp");
		String email=getValeurChamp(request,"email");
		String adresse=getValeurChamp(request,"adresse");
		String nom=getValeurChamp(request,"nom");
		String prenom=getValeurChamp(request,"prenom");
		String dateN=getValeurChamp(request,"dateN");
		
		this.loadDatabase();
		try {
			if(email==null || mdp==null || nom==null || prenom==null || dateN==null || adresse==null )
				return "Veuillez remplir tous les champs SVP";			
			else {
				Date dateNai=new SimpleDateFormat("yyyy-MM-dd").parse(dateN);
				java.sql.Timestamp sqlDate = new java.sql.Timestamp(dateNai.getTime());
				String requete="SELECT user_id FROM public.\"USER\" where login=?;";
				PreparedStatement st=connexion.prepareStatement(requete);
				st.setString(1, login);
				ResultSet resultSet=st.executeQuery();
				if(resultSet.next()) {
					int id=resultSet.getInt("user_id");
					String requete1="UPDATE public.\"USER\" SET mdp=? WHERE login=?;";
					PreparedStatement st1=connexion.prepareStatement(requete1);
					st1.setString(1, mdp);
					st1.setString(2, login);					
					st1.executeUpdate();
									
					String query = "UPDATE public.admin SET nom=?, prenom=?, date_nai=?, email=?, adresse=? WHERE user_a_id=?;";
		        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

		        	stmt.setString(1, nom);
		        	stmt.setString(2, prenom);
		        	stmt.setTimestamp(3, sqlDate);
		        	stmt.setString(4, email);
		        	stmt.setString(5, adresse);
		        	stmt.setInt(6, id);
		            stmt.executeUpdate();
		            
		            HttpSession session = request.getSession();
		    		User utilisateur=(User)session.getAttribute("utilisateur");
		    		utilisateur.setMdp(mdp);
		            return "success";
					}
				else return "Echec";
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "erreur de connexion";
		}
	}
	
    
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
    
    private Boolean newLogin( String login ) throws Exception {
    	
    	String query = "SELECT * FROM public.\"USER\" WHERE LOGIN = ?";
    	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    	stmt.setString(1, login);
        ResultSet rs = stmt.executeQuery();
       
        if(!rs.next()) {
        	query = "SELECT * FROM public.dem_entreprise WHERE LOGIN = ?";
        	stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        	stmt.setString(1, login);
            rs = stmt.executeQuery();
            if(!rs.next()) {
            	query = "SELECT * FROM public.dem_per_p WHERE LOGIN = ?";
            	stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            	stmt.setString(1, login);
                rs = stmt.executeQuery();
                if(!rs.next()) {
                	query = "SELECT * FROM public.dem_institution WHERE LOGIN = ?";
                	stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                	stmt.setString(1, login);
                    rs = stmt.executeQuery();
                    if(!rs.next()) {
                    	rs.beforeFirst();
                    	return false;
                    }
                    else return true;
                }
                else return true;
            }
            else return true;
        }
        else return true;       
       }
    
    public void enableCompte(int id) {
    	
    	String requete="UPDATE public.\"USER\" SET \"Activer\"='true' WHERE user_id=?;";
		try {
			this.loadDatabase();
			stmt = connexion.prepareStatement(requete);
	    	stmt.setInt(1, id);
	        stmt.executeUpdate();
		} catch (SQLException e) {
			this.erreurs.put("activerCpt", "erreur de connexion");
		}       	        	    	
    }
    
    public void desableCompte(int id) {
    	
    	String requete="UPDATE public.\"USER\" SET \"Activer\"='false' WHERE user_id=?;";
		try {
			this.loadDatabase();
			stmt = connexion.prepareStatement(requete);
	    	stmt.setInt(1, id);
	        stmt.executeUpdate();
		} catch (SQLException e) {
			this.erreurs.put("activerCpt", "erreur de connexion");
		}
    }

}
