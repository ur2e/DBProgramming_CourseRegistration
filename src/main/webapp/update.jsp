<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%@ include file="top.jsp" %>
<html>
<head><title>수강신청 사용자 정보 수정</title></head>
   <link rel="stylesheet" href="./css/main.css">
<body>

<br><br><br>
<div class="outer">
   <div class="update-box" align="center"> <span class="top-tile">비밀번호 변경</span>
   <hr width="70%" align="center" sytle="background-color: #487bb9;">
   <br>
   <form method="post" action="update_verify.jsp">
      <table class="update-table" width="70%" align="center" border>
         <tr>
         <td class="update-title">아이디</td>
         <td><div class="update-id"name = "userID"><%=session_id%></div></td>
         </tr>
         <tr>
         <td class="update-title">패스워드</td>
         <td><div><input class="update-pwd" type="password" name="userPassword"></div></td>
         </tr>
      </table>
      <div align="center">
         <input class="update-btn" type="SUBMIT" name="Submit" value="수정">
         <a href="main.jsp"><button class="cancel-btn">취소</button></a>
      </div>
   </form>
   </div>
</div>
</body>
</html>