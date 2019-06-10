package com.lot3.beans;

import java.sql.Date;

public class DemEntreprise {
	
	private int id;
	private String nom;
	private String email;
	private String adresse;
	private Date date;
	private String etat;
	private String motif;
	private String type;
	private String stat_jur;
	private String secteur;
	private String domaine;
	
	public DemEntreprise() {
		super();
	}

	public DemEntreprise(int id, String nom, String email, String adresse, Date date, String etat, String motif,
			String type, String stat_jur, String secteur, String domaine) {
		super();
		this.id = id;
		this.nom = nom;
		this.email = email;
		this.adresse = adresse;
		this.date = date;
		this.etat = etat;
		this.motif = motif;
		this.type = type;
		this.stat_jur = stat_jur;
		this.secteur = secteur;
		this.domaine = domaine;
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

	public String getStat_jur() {
		return stat_jur;
	}

	public void setStat_jur(String stat_jur) {
		this.stat_jur = stat_jur;
	}

	public String getSecteur() {
		return secteur;
	}

	public void setSecteur(String secteur) {
		this.secteur = secteur;
	}

	public String getDomaine() {
		return domaine;
	}

	public void setDomaine(String domaine) {
		this.domaine = domaine;
	}

}
