package com.lot3.beans;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Entreprise {
	
	private int id;
	private int idCmp;
	private String nom;
	private String adresse;
	private String email;
	private String statut;
	private String secteur;
	private String domaine;
	private String profil;
	
	public Entreprise() {
		super();
	}

	public Entreprise(int id, int idCmp, String nom, String adresse, String email, String statut, String secteur,
			String domaine, String profil) {
		super();
		this.id = id;
		this.idCmp = idCmp;
		this.nom = nom;
		this.adresse = adresse;
		this.email = email;
		this.statut = statut;
		this.secteur = secteur;
		this.domaine = domaine;
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

	public String getStatut() {
		return statut;
	}

	public void setStatut(String statut) {
		this.statut = statut;
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

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}	
	
}
