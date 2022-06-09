<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("utf-8");
  Connection myConn = null;

  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "db1811498";
  String password = "oracle";
  
  Class.forName(driver);
  myConn = DriverManager.getConnection(url, user, password);
%>