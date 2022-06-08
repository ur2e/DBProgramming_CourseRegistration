<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("utf-8");
  Connection myConn = null;

  String driver = "oracle.jdbc.driver.OracleDriver";
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "1814516";
  String password = "ss2";
  
  Class.forName(driver);
  myConn = DriverManager.getConnection(url, user, password);
%>