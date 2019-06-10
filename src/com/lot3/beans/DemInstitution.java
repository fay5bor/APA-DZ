package com.lot3.beans;

import java.sql.Date;

public class DemInstitution {


	private int id;
	private String nom;
	private String email;
	private String adresse;
	private Date date;
	private String etat;
	private String motif;
	private String type;
	
	
	
	public DemInstitution() {
	}


	public DemInstitution(String nom, String email, String adresse, Date date, String etat, String motif,
			String type) {
		super();
		this.nom = nom;
		this.email = email;
		this.adresse = adresse;
		this.date = date;
		this.etat = etat;
		this.motif = motif;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
