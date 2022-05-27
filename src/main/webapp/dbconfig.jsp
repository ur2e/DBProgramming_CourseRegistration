<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("utf-8");
  Connection myConn = null;

  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "";
  String password = "";
  
  Class.forName(driver);
  myConn = DriverManager.getConnection(url, user, password);
%>