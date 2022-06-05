<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="top.jsp" %>
<%@ include file="dbconfig.jsp" %>

<html>
<head><title>수강신청 사용자 정보 수정</title></head>

<body>
<br>
<center><div id = "updateMessage"></div></center>
<br><br><br>
<table width="70%" align="center" border>
   <form method="post" action="update_verify.jsp">
      <tr>
      <td><div><b>아이디</b></div></td>
      <td><div name = "userID"><%=session_id%></div></td>
      </tr>
      <tr>
      <td><div><b>패스워드</b></div></td>
      <td><div><input type="password" name="userPassword" class="editable"></div></td>
      </tr>
      <tr>
      <td colspan=2><div align="center">
      <input type="SUBMIT" name="Submit" value="수정">
      </div></td>
      </tr>
   </form>
</body>
</html>