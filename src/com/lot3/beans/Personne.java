package com.lot3.beans;

import java.util.Date;

public class Personne {
	
	private int id;
	private int idCmp;
	private String nom;
	private String prenom;
	private String dateN;
	private String profession;
	private String email;
	private String profil;
	
	public Personne() {
		super();
	}

	public Personne(int id, int idCmp, String nom, String prenom, String dateN, String profession, String email,
			String profil) {
		super();
		this.id = id;
		this.idCmp = idCmp;
		this.nom = nom;
		this.prenom = prenom;
		this.dateN = dateN;
		this.profession = profession;
		this.email = email;
		this.profil = profil;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCmp() {
		return idCmp;
	}

	public void setIdCmp(int idCmp) {
		this.idCmp = idCmp;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getDateN() {
		return dateN;
	}

	public void setDateN(String dateN) {
		this.dateN = dateN;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}
	
}
