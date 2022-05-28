<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<body>
<!-- s_id (학번) c_id (과목번호) -->
<%
int s_id = Integer.parseInt(request.getParameter("s_id"));
int c_id = Integer.parseInt(request.getParameter("c_id"));
String c_name = request.getParameter("c_name");

PreparedStatement pstmt = null;
String mySQL = null;
ResultSet rs = null;

mySQL = "DELETE FROM enroll WHERE s_id=? and c_id=?";
pstmt = myConn.prepareStatement(mySQL);
pstmt.setInt(1, s_id); 
pstmt.setInt(2, c_id); 
rs = pstmt.executeQuery();
%>

<script>
    alert(`해당 과목의 수강신청을 취소하였습니다.`);
	location.href="delete.jsp";
</script>

</body>
</html>