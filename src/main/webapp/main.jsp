<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title> </head>
<body>
<%@include file="top.jsp"%>
<%@include file="enroll.jsp"%>
<table width="75%" align="center" height="100%">
<!-- 로그인에 안된 사용자는 로그인 페이지로 클릭을 유도함 
  -- 바로 로그인 창으로 이동해도 좋을 듯 
  -->
<% if (session_id != null) { %>
<%-- <tr> <td align="center"><%=session_id%>님 방문을 환영합니다.</td> </tr> --%>
<% } else { %>
<tr> <td align="center">로그인한 후 사용하세요.</td> </tr>
<% } %>
</table> </body> </html>