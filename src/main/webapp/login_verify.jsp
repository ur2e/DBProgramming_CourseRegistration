<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconfig.jsp" %>

<%
Statement stmt = null;
PreparedStatement pstmt = null;
String sql = null;

String userID=request.getParameter("userID");
String userPassword=request.getParameter("userPassword");

sql = "SELECT s_id, s_name FROM students where s_id=? and s_pwd=?";
pstmt = myConn.prepareStatement(sql);
pstmt.setString(1, userID); 
pstmt.setString(2, userPassword);
ResultSet rs = pstmt.executeQuery();

if (rs.next()) {
   String login_id = rs.getString("s_id");
   String login_name = rs.getString("s_name");
   session.setAttribute("id", login_id);
   session.setAttribute("name", login_name);
   response.sendRedirect("main.jsp");
} else {
%>
<script language=javascript>
  alert("올바르지 않은 정보입니다. 아이디와 비밀번호를 확인해주세요.");
  location.href = "login.jsp";
</script>

<%
  }
// stmt.close();
// myConn.close();
%>