package com.lot3.beans;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement
public class Institution {
	private int id;
	private int idCmp;
	private String nom;
	private String adresse;
	private String email;
	private String type;
	private String profil;
	
	public Institution() {
		
	}

	public Institution(int id, String nom, String adresse, String email, String type) {
		super();
		this.id = id;
		this.nom = nom;
		this.adresse = adresse;
		this.email = email;
		this.type = type;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getIdCmp() {
		return idCmp;
	}

	public void setIdCmp(int idCmp) {
		this.idCmp = idCmp;
	}

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}
}
