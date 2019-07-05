package com.younes.beans;

import java.util.Date;

public class Document {
	private final int idDocument;
	private final int idAccord;
	private String nom;
	private String type;
	private int taille;
	private final Date dateAjout;
	private byte[] content;
	
	public Document(int idDocument, int idAccord, String nom, String type, int taille, Date dateAjout, byte[] content) {
		super();
		this.idDocument = idDocument;
		this.idAccord = idAccord;
		this.nom = nom;
		this.type = type;
		this.taille = taille;
		this.dateAjout = dateAjout;
		this.content = content;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTaille() {
		return taille;
	}

	public void setTaille(int taille) {
		this.taille = taille;
	}

	public byte[] getContent() {
		return content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	public int getIdDocument() {
		return idDocument;
	}

	public int getIdAccord() {
		return idAccord;
	}

	public Date getDateAjout() {
		return dateAjout;
	}
	
}
