package com.younes.bdd;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;

public class ConnectDB {

	static public Connection getConnection() throws Exception {

		Connection mySqlConnection = null;
		String environement = System.getenv().get("ENV");
		final String URL;
		final String pwd;
		final String user;

		if (environement == null) {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:comp/env");
			URL = (String) env.lookup("devurl");
			pwd = (String) env.lookup("devpwd");
			user = (String) env.lookup("devuser");
		} else {
			URL = System.getenv().get("PROD_URL");
			pwd = System.getenv().get("PROD_PWD");
			user = System.getenv().get("PROD_USER");
		}

		try {
			Class.forName("org.postgresql.Driver");

		} catch (Exception e) {
			System.out.println("Driver Problem");
			e.printStackTrace();
		}
		try {
			if (mySqlConnection == null) {
				mySqlConnection = DriverManager.getConnection(URL, user, pwd);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mySqlConnection;
	}

}