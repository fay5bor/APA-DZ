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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.lot3.beans.DemEntreprise;
import com.lot3.beans.DemPersonne;
import com.lot3.beans.Institution;
import com.lot3.beans.Personne;
import com.lot3.beans.User;

public final class PersonneManager {

Connection connexion;
	
	public PersonneManager() {
	}
	
	public String createDemPersonne(HttpServletRequest request,String pathImg) {
		String email=getValeurChamp(request,"email");
		String login=getValeurChamp(request,"login");
		String mdp=getValeurChamp(request,"mdp");
		String nom=getValeurChamp(request,"nom");
		String prenom=getValeurChamp(request,"prenom");
		String dateN=getValeurChamp(request,"dateN");	
		String adresse=getValeurChamp(request,"adresse");
		String profession=getValeurChamp(request,"profession");
		String motif=getValeurChamp(request,"motif");
		
		this.loadDatabase();
		try {
			if(email==null || login==null || mdp==null || nom==null|| prenom==null || dateN==null || adresse==null|| profession==null || motif==null)
				return "Veuillez remplir tous les champs SVP";
			else if(this.newLogin(login)) return "Le login existe déja veuillez introduire un autre";
			else {
				
				String query = "INSERT INTO public.dem_per_p(nom_dem, date, etat, motif, prenom, date_n, profession, login, mdp, email, adresse) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	        	
	        	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	        	Date dateNai=new SimpleDateFormat("yyyy-MM-dd").parse(dateN); 
	        	
	        	//java.sql.Date sqlDate = new java.sql.Date(dateNai.getTime());
	        	java.sql.Timestamp sqlDate = new java.sql.Timestamp(dateNai.getTime());
	        	
	        	stmt.setString(1, nom);
	        	stmt.setTimestamp(2,date);
	        	stmt.setString(3, "att");
	        	stmt.setString(4, motif);
	        	stmt.setString(5, prenom);
	        	stmt.setTimestamp(6, sqlDate);
	        	stmt.setString(7, profession);
	        	stmt.setString(8, login);
	        	stmt.setString(9, mdp);
	        	stmt.setString(10, email);
	        	stmt.setString(11, adresse);
	            stmt.executeUpdate();	
	            
	         // creates the save directory if it does not exists
	            File fileSaveDir = new File(pathImg);
	            if (!fileSaveDir.exists()) {
	                fileSaveDir.mkdir();
	            }

	            if(request.getPart("img").getSize()!=0){
	            	   
	            	Part part=request.getPart("img");
		            String filename="";
		            for (String cd : part.getHeader("content-disposition").split(";")) {
		                if (cd.trim().startsWith("filename")) {
		                    filename=cd.substring(cd.indexOf('=') + 1).trim()
		                            .replace("\"", "");
		                }	                
		            }	  
		            String extention=filename.substring(filename.lastIndexOf("."));
		            part.write(pathImg+"/personne_physique" + File.separator + login+".png");
	            	   
	            }
	            else {
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"personne.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/personne_physique" + File.separator + login+".png");	           	
	            	IOUtils.copy(input, output);
	            	
	            }
	            
	            return "Votre demande à été créée avec succès";
			}
		} catch (Exception e) {
			return "Erreur de connexion ... Veuillez réessayer plus tard";
		}
	}
	
	public List<DemPersonne> getDemPer() {
	      
		List<DemPersonne> dems=new ArrayList<DemPersonne>();
		DemPersonne d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT id_dem, nom_dem, date, etat, motif, prenom, date_n, profession, email, adresse FROM public.dem_per_p where etat='att';");
			while(resultSet.next()) {
				d=new DemPersonne();
				d.setId(resultSet.getInt("id_dem"));
				d.setNom(resultSet.getString("nom_dem"));
				d.setEmail(resultSet.getString("email"));
				d.setDate(resultSet.getDate("date"));
				d.setEtat(resultSet.getString("etat"));
				d.setMotif(resultSet.getString("motif"));
				d.setAdresse(resultSet.getString("adresse"));
				d.setPrenom(resultSet.getString("prenom"));
				d.setProfession(resultSet.getString("profession"));
				d.setDateNai(resultSet.getDate("date_n"));
				
				dems.add(d);								
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
		return dems;
	}
	
	public String majDemPer(String id,String etat) {
	     
		String resultat;
		DemPersonne d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		
		String nom;
		String prenom;
		Date dateNai;
		String adresse;
		String login;
		String mdp;
		String email;
		String profession;
		
		if(etat.equals("att")) {
			return "succes";
		}else if (etat.equals("acc")){
		    try {
			//creer le compte 
		    	
		    	String requete="SELECT nom_dem, prenom, date_n, profession, login, mdp, email, adresse FROM public.dem_per_p where id_dem=?;";
		    	PreparedStatement stmt = connexion.prepareStatement(requete);       	        	
	        	stmt.setInt(1, Integer.parseInt(id));
	        	ResultSet resultSet=stmt.executeQuery();
	        	if(resultSet.next()) {
					nom =resultSet.getString("nom_dem");
					prenom =resultSet.getString("prenom");
					dateNai=resultSet.getDate("date_n");
					adresse =resultSet.getString("adresse");
					login =resultSet.getString("login");
					mdp =resultSet.getString("mdp");
					email =resultSet.getString("email");
					profession =resultSet.getString("profession");
					
					requete="INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'personne_physique', 'true');";
					stmt = connexion.prepareStatement(requete);       	        	
			        stmt.setString(1, login);
			        stmt.setString(2, mdp);
			        stmt.executeUpdate();
			        
			        requete="SELECT user_id from public.\"USER\" where login=?;";
			    	stmt = connexion.prepareStatement(requete);       	        	
		        	stmt.setString(1, login);
		        	resultSet=stmt.executeQuery();
		        	resultSet.next();
		        	int idUser=resultSet.getInt("user_id");
		        	
		        	requete="INSERT INTO public.personne_physique(user_p_identifiant, nom, prenom, date_n, profession, email,profil) VALUES (?, ?, ?, ?, ?, ?, ?);";
					stmt = connexion.prepareStatement(requete);       	        	
			        stmt.setInt(1, idUser);
			        stmt.setString(2, nom);
			        stmt.setString(3, prenom);
			        stmt.setTimestamp(4, new java.sql.Timestamp(dateNai.getTime()));
			        stmt.setString(5, profession);
			        stmt.setString(6, email);
			        stmt.setString(7, login+".png");
			        stmt.executeUpdate();
			        
			        //envoyer le mail
			        System.out.println("arrivée successfully"); 
			        Mailer.send("rgdzprojet2019@gmail.com", "rgdzmdp8", email, "Equipe Ressource Génétique", login, mdp);
				}
			
			//modifier la demande 
			requete="UPDATE public.dem_per_p SET etat='acc' WHERE id_dem=?;";
			stmt = connexion.prepareStatement(requete);       	        	
        	stmt.setInt(1, Integer.parseInt(id));
            stmt.executeUpdate();	
            
			//envoyer le mail
			
            
             return "succes";
		    }
		    catch(SQLException e) {
		    	e.printStackTrace();
		    	return "echec";
		    }
		}else {
			try {
				String requete="UPDATE public.dem_per_p SET etat='ref' WHERE id_dem=?;";
				PreparedStatement stmt = connexion.prepareStatement(requete);       	        	
	        	stmt.setInt(1, Integer.parseInt(id));
	            stmt.executeUpdate();
	            
	            //envoyer le mail
	            
	            return "succes";
			}
			catch (SQLException e) {
				e.printStackTrace();
				return "echec";	
			}
		}
		
	}
	
	public Personne getProfil(String login) {
		Personne p=null;
		
		this.loadDatabase();
		try {
			String requete="SELECT user_id FROM public.\"USER\" where login=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setString(1, login);
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				int id=resultSet.getInt("user_id");
				String requete1="SELECT personne_id, user_p_identifiant, nom, prenom, date_n, profession, email, profil FROM public.personne_physique where user_p_identifiant=?;";
				PreparedStatement st1=connexion.prepareStatement(requete1);
				st1.setInt(1, id);
				ResultSet resultSet1=st1.executeQuery();
				if(resultSet1.next()){
					p=new Personne();
					p.setId(resultSet1.getInt("personne_id"));
					p.setIdCmp(resultSet1.getInt("user_p_identifiant"));
					p.setNom(resultSet1.getString("nom"));
					p.setPrenom(resultSet1.getString("prenom"));
					p.setEmail(resultSet1.getString("email"));
					p.setProfession(resultSet1.getString("profession"));
					p.setDateN(resultSet1.getString("date_n"));
					/*try {
						p.setDateN(new SimpleDateFormat("yyyy/MM/dd").parse(resultSet1.getString("date_n")));
					} catch (ParseException e) {
						p.setDateN(new Date());
					}*/
					p.setProfil(resultSet1.getString("profil"));							
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
		return p;
	}
	
	public String setProfil(HttpServletRequest request, String login) {
		String mdp=getValeurChamp(request,"mdp");
		String email=getValeurChamp(request,"email");
		String nom=getValeurChamp(request,"nom");
		String prenom=getValeurChamp(request,"prenom");
		String profession=getValeurChamp(request,"profession");
		String dateN=getValeurChamp(request,"dateN");
		
		this.loadDatabase();
		try {
			if(profession==null || email==null || mdp==null || nom==null || prenom==null || dateN==null )
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
									
					String query = "UPDATE public.personne_physique SET nom=?, prenom=?, date_n=?, profession=?, email=? WHERE user_p_identifiant=?;";
		        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

		        	stmt.setString(1, nom);
		        	stmt.setString(2, prenom);
		        	stmt.setTimestamp(3, sqlDate);
		        	stmt.setString(5, email);
		        	stmt.setString(4, profession);
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
}
