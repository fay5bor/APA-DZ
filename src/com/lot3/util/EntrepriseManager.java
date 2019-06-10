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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.lot3.beans.DemEntreprise;
import com.lot3.beans.DemInstitution;
import com.lot3.beans.Entreprise;
import com.lot3.beans.Institution;
import com.lot3.beans.User;

public final class EntrepriseManager {

Connection connexion;
	
	public EntrepriseManager() {
	}
	
	public String createDemEntreprise(HttpServletRequest request,String pathImg) {
		String typeEnt=getValeurChamp(request,"typeEnt");
		String email=getValeurChamp(request,"email");
		String login=getValeurChamp(request,"login");
		String mdp=getValeurChamp(request,"mdp");
		String nom=getValeurChamp(request,"nom");
		String adresse=getValeurChamp(request,"adresse");
		String statut=getValeurChamp(request,"statut");
		String secteur=getValeurChamp(request,"secteur");
		String domaine=getValeurChamp(request,"domaine");
		String motif=getValeurChamp(request,"motif");
		
		this.loadDatabase();
		try {
			if(typeEnt==null || email==null || login==null || mdp==null || nom==null || adresse==null || statut==null || secteur==null || domaine==null || motif==null)
				return "Veuillez remplir tous les champs SVP";
			else if(this.newLogin(login)) return "Le login existe déja veuillez introduire un autre";
			else {
				
				String query = "INSERT INTO public.dem_entreprise(nom_dem, type, date, etat, motif, adresse, stat_jur, secteur, domaine, login, mdp, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	        	
	        	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	        	
	        	stmt.setString(1, nom);
	        	stmt.setTimestamp(3,date);
	        	stmt.setString(4, "att");
	        	stmt.setString(5, motif);
	        	stmt.setString(6, adresse);
	        	stmt.setString(2, typeEnt);
	        	stmt.setString(7, statut);
	        	stmt.setString(8, secteur);
	        	stmt.setString(9, domaine);
	        	stmt.setString(10, login);
	        	stmt.setString(11, mdp);
	        	stmt.setString(12, email);
	            stmt.executeUpdate();	
	            
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
		            part.write(pathImg+"/entreprise" + File.separator + login+".png");
	            	   
	            }
	            else {	
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"entreprise.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/entreprise" + File.separator + login+".png");	           	
	            	IOUtils.copy(input, output);
	            	
	            }
	            System.out.println("arrivé0");
	            return "Votre demande à été créée avec succès";
			}
		} catch (Exception e) {
			System.out.println("arrivé1");
			e.printStackTrace();
			return "Erreur de connexion ... Veuillez réessayer plus tard";
		}
	}
	
	public List<DemEntreprise> getDemEnt() {
	      
		List<DemEntreprise> dems=new ArrayList<DemEntreprise>();
		DemEntreprise d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT id_dem, nom_dem, type, date, etat, motif, adresse, stat_jur, secteur, domaine, email FROM public.dem_entreprise where etat='att';");
			while(resultSet.next()) {
				d=new DemEntreprise();
				d.setId(resultSet.getInt("id_dem"));
				d.setNom(resultSet.getString("nom_dem"));
				d.setEmail(resultSet.getString("email"));
				d.setDate(resultSet.getDate("date"));
				d.setEtat(resultSet.getString("etat"));
				d.setMotif(resultSet.getString("motif"));
				d.setAdresse(resultSet.getString("adresse"));
				d.setType(resultSet.getString("type"));
				d.setStat_jur(resultSet.getString("motif"));
				d.setSecteur(resultSet.getString("secteur"));
				d.setDomaine(resultSet.getString("domaine"));
				
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
	
	public List<Entreprise> getEnt() {
	      
		List<Entreprise> ent=new ArrayList<Entreprise>();
		Entreprise e;

		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT ent_id, ent_identifiant, nom, adresse, stat_jur, secteur, domaine, profil, email FROM public.entreprise;");
			while(resultSet.next()) {
				e=new Entreprise();
				e.setId(resultSet.getInt("ent_id"));
				e.setIdCmp(resultSet.getInt("ent_identifiant"));
				e.setNom(resultSet.getString("nom"));
				e.setEmail(resultSet.getString("email"));
				e.setAdresse(resultSet.getString("adresse"));
				e.setStatut(resultSet.getString("stat_jur"));
				e.setSecteur(resultSet.getString("secteur"));
				e.setDomaine(resultSet.getString("domaine"));
				e.setProfil(resultSet.getString("profil"));
				
				ent.add(e);								
			}						
		} catch (SQLException exp) {
			exp.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
		return ent;
	}
	
	public Entreprise getEnt(String id) {
	      
		Entreprise e=null;

		this.loadDatabase();
		try {
			String requete="SELECT ent_id, ent_identifiant, nom, adresse, stat_jur, secteur, domaine, profil, email FROM public.entreprise where ent_id=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setInt(1, Integer.parseInt(id));
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				e=new Entreprise();
				e.setId(resultSet.getInt("ent_id"));
				e.setIdCmp(resultSet.getInt("ent_identifiant"));
				e.setNom(resultSet.getString("nom"));
				e.setEmail(resultSet.getString("email"));
				e.setAdresse(resultSet.getString("adresse"));
				e.setStatut(resultSet.getString("stat_jur"));
				e.setSecteur(resultSet.getString("secteur"));
				e.setDomaine(resultSet.getString("domaine"));
				e.setProfil(resultSet.getString("profil"));					
			}						
		} catch (SQLException exp) {
			exp.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
		return e;
	}
	
	public List<Entreprise> getEnt(String searchKey, String id){
		
		List<Entreprise> ents=new ArrayList<Entreprise>();
		Entreprise ent;
		String requete;
		PreparedStatement st;

		this.loadDatabase();
		try {
						
			if(id.isEmpty()) {
				requete="SELECT * FROM public.entreprise WHERE CONCAT_WS('|',nom,adresse,email,stat_jur,secteur,domaine) iLIKE ?;";
				st=connexion.prepareStatement(requete);
				st.setString(1, "%"+ searchKey +"%");
			}
			else {
				requete="SELECT ent_id, ent_identifiant, nom, adresse, stat_jur, secteur, domaine, profil, email\r\n" + 
						"	FROM public.entreprise e, contient_1 c, accords_1 a WHERE c.id_res=? and c.accord_id=a.accord_id and a.etat='acc' and e.ent_identifiant=a.id_user and CONCAT_WS('|',nom,adresse,email,stat_jur,secteur,domaine) iLIKE ?;";
				st=connexion.prepareStatement(requete);
				st.setInt(1, Integer.parseInt(id));
				st.setString(2, "%"+ searchKey +"%");
			}
			ResultSet resultSet=st.executeQuery();
			while(resultSet.next()) {
				ent=new Entreprise();
				ent.setId(resultSet.getInt("ent_id"));
				ent.setIdCmp(resultSet.getInt("ent_identifiant"));
				ent.setNom(resultSet.getString("nom"));
				ent.setEmail(resultSet.getString("email"));
				ent.setAdresse(resultSet.getString("adresse"));
				ent.setStatut(resultSet.getString("stat_jur"));
				ent.setSecteur(resultSet.getString("secteur"));
				ent.setDomaine(resultSet.getString("domaine"));
				ent.setProfil(resultSet.getString("profil"));
				
				ents.add(ent);
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
		
		return ents;
	}
		
	public List<String> getResEnt(String id) {
	      
		List<String> liste=new ArrayList<String>();
		String nom=null;

		this.loadDatabase();
		try {
			String requete="SELECT r.nom from ressource r,contient_1 c, accords_1 a where r.id_res=c.id_res and c.accord_id=a.accord_id and a.etat='acc' and a.id_user=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setInt(1, Integer.parseInt(id));
			ResultSet resultSet=st.executeQuery();
			while(resultSet.next()) {
				nom=resultSet.getString("nom");
				liste.add(nom);					
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
		
	public String majDemEnt(String id,String etat) {
	     
		String resultat;
		DemEntreprise d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		
		String nom;
		String adresse;
		String typeEnt;
		String login;
		String mdp;
		String email;
		String statut;
		String secteur;
		String domaine;
		
		if(etat.equals("att")) {
			return "succes";
		}else if (etat.equals("acc")){
		    try {
			//creer le compte 
		    	
		    	String requete="SELECT nom_dem, type, date, etat, motif, adresse, stat_jur, secteur, domaine, login, mdp, email FROM public.dem_entreprise where id_dem=?;";
		    	PreparedStatement stmt = connexion.prepareStatement(requete);       	        	
	        	stmt.setInt(1, Integer.parseInt(id));
	        	ResultSet resultSet=stmt.executeQuery();
	        	if(resultSet.next()) {
					nom =resultSet.getString("nom_dem");
					adresse =resultSet.getString("adresse");
					typeEnt =resultSet.getString("type");
					login =resultSet.getString("login");
					mdp =resultSet.getString("mdp");
					email =resultSet.getString("email");
					statut =resultSet.getString("stat_jur");
					secteur =resultSet.getString("secteur");
					domaine =resultSet.getString("domaine");
					
					requete="INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'entreprise', 'true');";
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
		        	
		        	requete="INSERT INTO public.entreprise(ent_identifiant, nom, adresse, stat_jur, secteur, domaine,profil,email) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
					stmt = connexion.prepareStatement(requete);       	        	
			        stmt.setInt(1, idUser);
			        stmt.setString(2, nom);
			        stmt.setString(3, adresse);
			        stmt.setString(4, statut);
			        stmt.setString(5, secteur);
			        stmt.setString(6, domaine);
			        stmt.setString(7, login+".png");
			        stmt.setString(8, email);
			        stmt.executeUpdate();
			        
			        //envoyer le mail
			        System.out.println("arrivée successfully"); 
			        Mailer.send("rgdzprojet2019@gmail.com", "rgdzmdp8", email, "Equipe Ressource Génétique", login, mdp);
				}
			
			//modifier la demande 
			requete="UPDATE public.dem_entreprise SET etat='acc' WHERE id_dem=?;";
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
				String requete="UPDATE public.dem_entreprise SET etat='ref' WHERE id_dem=?;";
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
	
	public Entreprise getProfil(String login) {
		Entreprise e=null;
		
		this.loadDatabase();
		try {
			String requete="SELECT user_id FROM public.\"USER\" where login=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setString(1, login);
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				int id=resultSet.getInt("user_id");
				String requete1="SELECT ent_id, ent_identifiant, nom, adresse, stat_jur, secteur, domaine, profil, email FROM public.entreprise where ent_identifiant=?;";
				PreparedStatement st1=connexion.prepareStatement(requete1);
				st1.setInt(1, id);
				ResultSet resultSet1=st1.executeQuery();
				if(resultSet1.next()) {
					e=new Entreprise();
					e.setId(resultSet1.getInt("ent_id"));
					e.setIdCmp(resultSet1.getInt("ent_identifiant"));
					e.setNom(resultSet1.getString("nom"));
					e.setEmail(resultSet1.getString("email"));
					e.setAdresse(resultSet1.getString("adresse"));
					e.setStatut(resultSet1.getString("stat_jur"));
					e.setSecteur(resultSet1.getString("secteur"));
					e.setDomaine(resultSet1.getString("domaine"));
					e.setProfil(resultSet1.getString("profil"));							
				}						
			}						
		} catch (SQLException exp) {
			exp.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
		
		return e;
	}
	
	public String setProfil(HttpServletRequest request, String login) {
		Entreprise e=null;
		String mdp=getValeurChamp(request,"mdp");
		String email=getValeurChamp(request,"email");
		String nom=getValeurChamp(request,"nom");
		String statut=getValeurChamp(request,"statut");
		String secteur=getValeurChamp(request,"secteur");
		String domaine=getValeurChamp(request,"domaine");
		String adresse=getValeurChamp(request,"adresse");
		
		this.loadDatabase();
		try {
			if(secteur==null || domaine==null || statut==null || email==null || mdp==null || nom==null || adresse==null )
				return "Veuillez remplir tous les champs SVP";			
			else {
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
									
					String query = "UPDATE public.entreprise SET nom=?, adresse=?, stat_jur=?, secteur=?, domaine=?, email=? WHERE ent_identifiant=?;";
		        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

		        	stmt.setString(1, nom);
		        	stmt.setString(2, adresse);
		        	stmt.setString(3, statut);
		        	stmt.setString(4, secteur);
		        	stmt.setString(5, domaine);
		        	stmt.setString(6, email);
		        	stmt.setInt(7, id);
		            stmt.executeUpdate();
		            
		            HttpSession session = request.getSession();
		    		User utilisateur=(User)session.getAttribute("utilisateur");
		    		utilisateur.setMdp(mdp);
		            return "success";
					}
				else return "Echec";				
			}
		} catch (Exception exp) {
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
