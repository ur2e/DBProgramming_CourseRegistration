<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head> 


<% 
if(session_id == null) {
%>
<script language=javascript>
  alert("로그인을 먼저 해주세요");
  location.href = "login.jsp";
</script>
<%
}
%>

<title>수강신청 조회</title> </head>

<body>

<br><br>
<jsp:include page='delete.jsp'/>

<br><br>
<jsp:include page='insert.jsp'/>
</body> 

</html>