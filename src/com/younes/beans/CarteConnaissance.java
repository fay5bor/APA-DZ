package com.younes.beans;

import java.util.Base64;

public class CarteConnaissance {
	private int idConnaissance;
	private String Titre;
	private String Type;
	private String Resume;
	private byte[] image;
	
	public int getIdConnaissance() {
		return idConnaissance;
	}
	public void setIdConnaissance(int idConnaissance) {
		this.idConnaissance = idConnaissance;
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
		Resume = resume;
	}
	public byte[] getImage() {
		return image;
	}
	public String getImageString() {
		if (this.image == null) return null; //pour éviter le cas où on ne choisit pas de photo dans le formulaire 
		byte[] fileBytes = Base64.getEncoder().encode(image);
		try {
			return new String(fileBytes, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace(System.err);
			return null;
		}	
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
}
