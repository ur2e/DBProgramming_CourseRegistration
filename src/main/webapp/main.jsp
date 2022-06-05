<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>숙명수강신청시스템</title> </head>
<body>
<%@include file="top.jsp"%>
<jsp:include page='student_info.jsp'/>
<jsp:include page='enroll.jsp'/>
<jsp:include page='insert.jsp'/>
<table width="75%" align="center" height="100%">

<% if (session_id != null) { %>
<% } else { %>
<tr> <td align="center">로그인한 후 사용하세요.</td> </tr>
<% } %>
</table> 
</body> </html>