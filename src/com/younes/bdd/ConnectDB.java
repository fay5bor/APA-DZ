package com.younes.bdd;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

 Connection mySqlConnection;
 String URL = "jdbc:postgresql://localhost:5432/RG";
 String pwd = "postgres";
 String user = "postgres";

 public Connection getConnection() {

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