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

CallableStatement cstmt = null;
String mySQL = null;

myConn.setAutoCommit(false);
mySQL = "{call DELETE_ENROLL(?,?,?)}";

cstmt = myConn.prepareCall(mySQL);
cstmt.setInt(1,s_id);
cstmt.setInt(2,c_id);
cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);	
cstmt.execute();
myConn.commit();

String result = cstmt.getString(3);
myConn.setAutoCommit(true);

cstmt.close();
myConn.close();
%>

<script>
    alert(`<%=result%> 과목의 수강신청을 취소하였습니다.`);
	location.href="main.jsp";
</script>

</body>
</html>