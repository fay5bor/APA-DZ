package com.lot3.beans;

import java.util.Date;

public class Chercheur {
	
		private int id;
		private int idCmp;
		private String nom;
		private String prenom;
		private Date dateNai;
		private String labo;
		private Boolean active;
		private String profil;
		private String email;
		private String adresse;
		
		public Chercheur() {
			super();
		}

		public Chercheur(int id, String nom, String prenom, Date dateNai, String labo) {
			super();
			this.id = id;
			this.nom = nom;
			this.prenom = prenom;
			this.dateNai = dateNai;
			this.labo = labo;
		}

		public int getIdCmp() {
			return idCmp;
		}

		public void setIdCmp(int idCmp) {
			this.idCmp = idCmp;
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

		public String getLabo() {
			return labo;
		}

		public void setLabo(String labo) {
			this.labo = labo;
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
		
}
