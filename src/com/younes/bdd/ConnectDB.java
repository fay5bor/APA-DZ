package com.younes.bdd;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {

 Connection mySqlConnection;
 String URL = "jdbc:postgresql://ec2-54-247-85-251.eu-west-1.compute.amazonaws.com:5432/d5mqedu30ls8qn?sslmode=require";
 String pwd = "dd69585b38c89daaeee5b7f98b62d2e5a3cdfd26e14c1cf942eccc5fa1ebfb44";
 String user = "wjivgakefftdwq";

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