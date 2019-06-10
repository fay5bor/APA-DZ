package com.lot3.beans;

import java.io.Serializable;

public class User implements Serializable {

	private String login;
	private String mdp;
	private String type;
	
	public User() {	
	}
	
	public User(String login, String mdp, String type) {
		super();
		this.login = login;
		this.mdp = mdp;
		this.type = type;
	}

	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getMdp() {
		return mdp;
	}
	public void setMdp(String mdp) {
		this.mdp = mdp;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
