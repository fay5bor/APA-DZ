package com.lot3.beans;

import java.util.Date;

public class Admin {
	
	private int id;
	private int idCmp;
	private String nom;
	private String prenom;
	private Date dateNai;
	private String privilege;
	private Boolean active;
	private String email;
	private String adresse;
	private String profil;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Admin() {
		super();
	}

	public Admin(int id, String nom, String prenom, Date dateNai, String privilege, Boolean active) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.dateNai = dateNai;
		this.privilege = privilege;
		this.active = active;
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

	public String getPrivilege() {
		return privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public String getProfil() {
		return profil;
	}

	public void setProfil(String profil) {
		this.profil = profil;
	}
	
	public int getIdCmp() {
		return idCmp;
	}

	public void setIdCmp(int idCmp) {
		this.idCmp = idCmp;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
}
