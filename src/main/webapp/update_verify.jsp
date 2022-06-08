<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<html>
<head><title> 수강신청 사용자 정보 수정 </title></head>
<body>

<%
   Statement stmt = null;
   String mySQL = null;
   ResultSet rs = null;
   String sMessage = null;
   
   stmt = myConn.createStatement();
   
   String session_id = (String) session.getAttribute("id");
   String userPassword = request.getParameter("userPassword");
   int s_id = Integer.parseInt(session_id);

   mySQL = "update students set s_pwd= '" + userPassword + "' where s_id = '" + s_id + "'";
   
   try {
      stmt.executeUpdate(mySQL);
      sMessage = "정상적으로 변경이 완료되었습니다";
      %>
      <script>
         alert("<%=sMessage%>");
         location.href = 'main.jsp';
      </script>
   <% 
   } catch(SQLException ex) {
      System.out.println(ex.getErrorCode());
      if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
      else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
      else if (ex.getErrorCode() == 20004) sMessage="암호를 입력한 후에 다시 시도해주세요.";
      else sMessage="잠시 후 다시 시도하십시오"; 
   %>
   <script>
      alert("<%=sMessage%>");
      location.href = 'update.jsp';
   </script>
   <%
      }
   %>

</body>
</html>