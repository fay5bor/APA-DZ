package com.younes.beans;

import java.util.Base64;

public class Connaissance {
	private int idConnaissance;
	private int idChercheur;
	private int idRessource;
	private String chercheur; // On sauvgarde le nom du chercheur qui a publié la connaissance et qui sera affiché dans le profil
	private String Titre;
	private String Type;
	private String Resume;
	private String Contenu;
	private byte[] img;
	
	public int getIdConnaissance() {
		return idConnaissance;
	}
	public void setIdConnaissance(int idConnaissance) {
		this.idConnaissance = idConnaissance;
	}
	public int getIdChercheur() {
		return idChercheur;
	}
	public void setIdChercheur(int idChercheur) {
		this.idChercheur = idChercheur;
	}
	public String getTitre() {
		return Titre;
	}
	public void setTitre(String titre) {
		Titre = titre;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getResume() {
		return Resume;
	}
	public void setResume(String resume) {
		if(resume == "") resume = null;
		Resume = resume;
	}
	public String getContenu() {
		return Contenu;
	}
	public void setContenu(String contenu) {
		Contenu = contenu;
	}
	public byte[] getImg() {
		return img;
	}
	public String getImgString() {
		byte[] fileBytes = Base64.getEncoder().encode(img);
		try {
			return new String(fileBytes, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace(System.err);
			return null;
		}	
	}
	public void setImg(byte[] img) {
		this.img = img;
	}
	
	public String getChercheur() {
		return chercheur;
	}
	public void setChercheur(String chercheur) {
		this.chercheur = chercheur;
	}
	public int getIdRessource() {
		return idRessource;
	}
	public void setIdRessource(int idRessource) {
		this.idRessource = idRessource;
	}
	

}
