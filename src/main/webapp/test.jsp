<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconfig.jsp" %>

<%

CallableStatement cstmt = null;
String mySQL = null;

mySQL = "{call RANKING}";
cstmt = myConn.prepareCall(mySQL);
cstmt.execute();

System.out.println("***************************");
System.out.println("***************************");
System.out.println("***************************");
%>

	<script>
		alert("프로시저 실행 ");
		location.href = "main.jsp";
	</script>
