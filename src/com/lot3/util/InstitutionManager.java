package com.lot3.util;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.lot3.beans.DemInstitution;
import com.lot3.beans.Institution;
import com.lot3.beans.Ressource;
import com.lot3.beans.User;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import org.apache.commons.io.IOUtils;

public final class InstitutionManager {
	Connection connexion;
	
	public InstitutionManager() {
	}
	
	public String createDemInstitution(HttpServletRequest request,String pathImg) {
		
		String typeIns=getValeurChamp(request,"typeIns");
		String email=getValeurChamp(request,"email");
		String login=getValeurChamp(request,"login");
		String mdp=getValeurChamp(request,"mdp");
		String nom=getValeurChamp(request,"nom");
		String adresse=getValeurChamp(request,"adresse");
		String motif=getValeurChamp(request,"motif");
		
		this.loadDatabase();
		try {
			if(typeIns==null || email==null || login==null || mdp==null || nom==null || adresse==null || motif==null)
				return "Veuillez remplir tous les champs SVP";
			else if(this.newLogin(login)) return "Le login existe déja veuillez introduire un autre";
			else {
				
				String query = "INSERT INTO public.dem_institution(nom_dem, date, etat, motif_ins, adresse, type_institution, login, mdp, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
	        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	        	
	        	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
	        	
	        	stmt.setString(1, nom);
	        	stmt.setTimestamp(2,date);
	        	stmt.setString(3, "att");
	        	stmt.setString(4, motif);
	        	stmt.setString(5, adresse);
	        	stmt.setString(6, typeIns);
	        	stmt.setString(7, login);
	        	stmt.setString(8, mdp);
	        	stmt.setString(9, email);
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
		            part.write(pathImg+"/institution" + File.separator + login+".png");
	            	   
	            }
	            else {
	            	System.out.println("pas encore0");	
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"institue.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/institution" + File.separator + login+".png");
	            	System.out.println("pas encore");	           	
	            	IOUtils.copy(input, output);
	            	
	            }
	                        
	            return "Votre demande à été créée avec succès";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Erreur de connexion ... Veuillez réessayer plus tard";
		}
		
	}
	
	public List<DemInstitution> getDemIns() {
	      
		List<DemInstitution> dems=new ArrayList<DemInstitution>();
		DemInstitution d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT id_dem_ins, nom_dem, date, etat, motif_ins, adresse, type_institution, login, mdp, email FROM public.dem_institution where etat='att';");
			while(resultSet.next()) {
				d=new DemInstitution();
				d.setId(resultSet.getInt("id_dem_ins"));
				d.setNom(resultSet.getString("nom_dem"));
				d.setEmail(resultSet.getString("email"));
				d.setDate(resultSet.getDate("date"));
				d.setEtat(resultSet.getString("etat"));
				d.setMotif(resultSet.getString("motif_ins"));
				d.setAdresse(resultSet.getString("adresse"));
				d.setType(resultSet.getString("type_institution"));
				
				dems.add(d);								
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(dems.size());
		return dems;
	}
	
	public String creIns(HttpServletRequest request,String pathImg) {
		
			String nom=getValeurChamp(request,"nom");
			String email=getValeurChamp(request,"email");
			String adresse=getValeurChamp(request,"adresse");
			String type=getValeurChamp(request,"type");

			this.loadDatabase();
			try {
				if(type==null || email==null || nom==null || adresse==null)
				return "Veuillez remplir tous les champs SVP";
				else if (!newNom(nom)) return "Le nom de l'institue existe déja";
			else {
				
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
		            part.write(pathImg+"/institution/institutionSansCompte" + File.separator+nom+".png");
	            	   
	            }
	            else {	
	            	extention=".png";
	            	InputStream input = new FileInputStream(pathImg+"/default" + File.separator+"institue.png");
	            	OutputStream output = new FileOutputStream(pathImg+"/institution/institutionSansCompte" + File.separator +nom+extention);           	
	            	IOUtils.copy(input, output);	            	
	            }	
				
				String query = "INSERT INTO public.institution(user_identifient, nom, adresse, type_institution, email,profil) VALUES ('-1',?, ?, ?, ?, ?);";
	        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	        	stmt.setString(1, nom);
	        	stmt.setString(2, adresse);
	        	stmt.setString(3, type);
	        	stmt.setString(4, email);
	        	stmt.setString(5, nom+".png");
	            stmt.executeUpdate();	
	            	            	                                    
	            return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "Erreur de connexion ... Veuillez réessayer plus tard";
		}
		
	}
	
	public List<Institution> getIns() {
	      
		List<Institution> ins=new ArrayList<Institution>();
		Institution i;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT institution_id, user_identifient, nom, adresse, type_institution, email,profil FROM public.institution;");
			while(resultSet.next()) {
				i=new Institution();
				i.setId(resultSet.getInt("institution_id"));
				i.setIdCmp(resultSet.getInt("user_identifient"));
				i.setNom(resultSet.getString("nom"));
				i.setEmail(resultSet.getString("email"));
				i.setAdresse(resultSet.getString("adresse"));
				i.setType(resultSet.getString("type_institution"));
				i.setProfil(resultSet.getString("profil"));
				
				ins.add(i);								
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
		return ins;
	}
	
	public Institution getIns(String id) {
	      
		Institution i=null;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			String requete="SELECT institution_id, user_identifient, nom, adresse, type_institution, email,profil FROM public.institution where institution_id=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setInt(1, Integer.parseInt(id));
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				i=new Institution();
				i.setId(resultSet.getInt("institution_id"));
				i.setIdCmp(resultSet.getInt("user_identifient"));
				i.setNom(resultSet.getString("nom"));
				i.setEmail(resultSet.getString("email"));
				i.setAdresse(resultSet.getString("adresse"));
				i.setType(resultSet.getString("type_institution"));
				i.setProfil(resultSet.getString("profil"));							
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
		return i;
	}
	
	public List<Institution> getIns(String searchKey, String filter, String id){
		
		List<Institution> ins=new ArrayList<Institution>();
		Institution i;
		String requete;
		PreparedStatement st;

		this.loadDatabase();
		try {
						
			if(id.isEmpty()) {
				requete="SELECT * FROM public.institution WHERE CONCAT_WS('|',nom,adresse,email,type_institution) iLIKE ? and type_institution ilike ?;";
				st=connexion.prepareStatement(requete);
				st.setString(1, "%"+ searchKey +"%");
				st.setString(2, "%"+ filter +"%");
			}
			else {
				requete="SELECT i.institution_id, i.user_identifient, i.nom, i.adresse, i.type_institution, i.email, i.profil FROM public.institution i, contient_1 c, accords_1 a\r\n" + 
						"WHERE c.id_res=? and c.accord_id=a.accord_id and a.etat='acc' and i.user_identifient=a.id_user and CONCAT_WS('|',nom,adresse,email,type_institution) iLIKE ? and type_institution ilike ?;";
				st=connexion.prepareStatement(requete);
				st.setInt(1, Integer.parseInt(id));
				st.setString(2, "%"+ searchKey +"%");
				st.setString(3, "%"+ filter +"%");
			}
			ResultSet resultSet=st.executeQuery();
			while(resultSet.next()) {
				i=new Institution();
				i.setId(resultSet.getInt("institution_id"));
				i.setIdCmp(resultSet.getInt("user_identifient"));
				i.setNom(resultSet.getString("nom"));
				i.setEmail(resultSet.getString("email"));
				i.setAdresse(resultSet.getString("adresse"));
				i.setType(resultSet.getString("type_institution"));
				i.setProfil(resultSet.getString("profil"));
				
				ins.add(i);
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
		
		return ins;
	}

	public List<Ressource> getRes(){
		List<Ressource> res = new ArrayList<Ressource>();
		
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT id_res, nom FROM public.ressource;");
			while(resultSet.next()) {				
				res.add(new Ressource(Integer.parseInt(resultSet.getString("id_res")), resultSet.getString("nom")));
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
		return res;
	}
	
	public List<String> getResIns(String id) {
	      
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
		
	public String majDemIns(String id,String etat) {
	     
		String resultat;
		DemInstitution d;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		
		String nom;
		String adresse;
		String typeIns;
		String login;
		String mdp;
		String email;
		
		if(etat.equals("att")) {
			return "succes";
		}else if (etat.equals("acc")){
		    try {
			//creer le compte 
		    	
		    	String requete="SELECT nom_dem,adresse, type_institution, login, mdp, email FROM public.dem_institution where id_dem_ins=?;";
		    	PreparedStatement stmt = connexion.prepareStatement(requete);       	        	
	        	stmt.setInt(1, Integer.parseInt(id));
	        	ResultSet resultSet=stmt.executeQuery();
	        	if(resultSet.next()) {
					nom =resultSet.getString("nom_dem");
					adresse =resultSet.getString("adresse");
					typeIns =resultSet.getString("type_institution");
					login =resultSet.getString("login");
					mdp =resultSet.getString("mdp");
					email =resultSet.getString("email");
					
					requete="INSERT INTO public.\"USER\" (login, mdp, type, \"Activer\") VALUES (?, ?, 'institution', 'true');";
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
		        	
		        	requete="INSERT INTO public.institution(user_identifient, nom, adresse, type_institution,email,profil) VALUES (?, ?, ?, ?, ?, ?);";
					stmt = connexion.prepareStatement(requete);       	        	
			        stmt.setInt(1, idUser);
			        stmt.setString(2, nom);
			        stmt.setString(3, adresse);
			        stmt.setString(4, typeIns);
			        stmt.setString(5, email);
			        stmt.setString(6, login+".png");
			        stmt.executeUpdate();
			        
					//envoyer le mail
			        System.out.println("arrivée successfully"); 
			        Mailer.send("rgdzprojet2019@gmail.com", "rgdzmdp8", email, "Equipe Ressource Génétique", login, mdp);
				}
			
			//modifier la demande 
			requete="UPDATE public.dem_institution SET etat='acc' WHERE id_dem_ins=?;";
			stmt = connexion.prepareStatement(requete);       	        	
        	stmt.setInt(1, Integer.parseInt(id));
            stmt.executeUpdate();	
            		                     
             return "succes";
		    }
		    catch(SQLException e) {
		    	e.printStackTrace();
		    	return "echec";
		    }
		}else {
			try {
				String requete="UPDATE public.dem_institution SET etat='ref' WHERE id_dem_ins=?;";
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
	
	public List<Institution> getInsFiltre(String type,int rg,String search) {
	      
		List<Institution> ins=new ArrayList<Institution>();
		Institution i;
/*
		try {
			connexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
		this.loadDatabase();
		try {
			Statement st=connexion.createStatement();
			ResultSet resultSet=st.executeQuery("SELECT institution_id, user_identifient, nom, adresse, type_institution, email,profil FROM public.institution;");
			while(resultSet.next()) {
				i=new Institution();
				i.setId(resultSet.getInt("institution_id"));
				i.setIdCmp(resultSet.getInt("user_identifient"));
				i.setNom(resultSet.getString("nom"));
				i.setEmail(resultSet.getString("email"));
				i.setAdresse(resultSet.getString("adresse"));
				i.setType(resultSet.getString("type_institution"));
				i.setProfil(resultSet.getString("profil"));
				
				ins.add(i);								
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
		return ins;
	}
	
	public Institution getProfil(String login) {
		Institution i=null;
		
		this.loadDatabase();
		try {
			String requete="SELECT user_id FROM public.\"USER\" where login=?;";
			PreparedStatement st=connexion.prepareStatement(requete);
			st.setString(1, login);
			ResultSet resultSet=st.executeQuery();
			if(resultSet.next()) {
				int id=resultSet.getInt("user_id");
				String requete1="SELECT institution_id, user_identifient, nom, adresse, type_institution, email,profil FROM public.institution where user_identifient=?;";
				PreparedStatement st1=connexion.prepareStatement(requete1);
				st1.setInt(1, id);
				ResultSet resultSet1=st1.executeQuery();
				if(resultSet1.next()) {
					i=new Institution();
					i.setId(resultSet1.getInt("institution_id"));
					i.setIdCmp(resultSet1.getInt("user_identifient"));
					i.setNom(resultSet1.getString("nom"));
					i.setEmail(resultSet1.getString("email"));
					i.setAdresse(resultSet1.getString("adresse"));
					i.setType(resultSet1.getString("type_institution"));
					i.setProfil(resultSet1.getString("profil"));							
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
		
		return i;
	}
	
	public String setProfil(HttpServletRequest request, String login) {
		Institution i=null;
		String mdp=getValeurChamp(request,"mdp");
		String email=getValeurChamp(request,"email");
		String type=getValeurChamp(request,"resUsed");
		String nom=getValeurChamp(request,"nom");
		String adresse=getValeurChamp(request,"adresse");
		
		this.loadDatabase();
		try {
			if(type==null || email==null || mdp==null || nom==null || adresse==null )
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
									
					String query = "UPDATE public.institution SET nom=?, adresse=?, type_institution=?, email=? WHERE user_identifient=?;";
		        	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

		        	stmt.setString(1, nom);
		        	stmt.setString(2, adresse);
		        	stmt.setString(3, type);
		        	stmt.setString(4, email);
		        	stmt.setInt(5, id);
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
    
    private Boolean newNom( String nom ) throws Exception {
    	
    	String query = "SELECT * FROM public.institution WHERE nom = ?";
    	PreparedStatement stmt = connexion.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
    	stmt.setString(1, nom);
        ResultSet rs = stmt.executeQuery();
       
        if(!rs.next()) {
        	return true;
        }
        else return false;       
    }
}
