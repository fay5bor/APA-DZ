package com.lot3.beans;

import java.sql.Date;

public class DemPersonne {
	
	private int id;
	private String nom;
	private String prenom;
	private Date dateNai;
	private String email;
	private String adresse;
	private Date date;
	private String etat;
	private String motif;
	private String profession;
	
	public DemPersonne() {
		super();
	}

	public DemPersonne(int id, String nom, String prenom, Date dateNai, String email, String adresse, Date date,
			String etat, String motif, String profession) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.email = email;
		this.adresse = adresse;
		this.date = date;
		this.etat = etat;
		this.motif = motif;
		this.profession = profession;
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

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDateNai() {
		return dateNai;
	}

	public void setDateNai(Date dateNai) {
		this.dateNai = dateNai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public String getMotif() {
		return motif;
	}

	public void setMotif(String motif) {
		this.motif = motif;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}


}
