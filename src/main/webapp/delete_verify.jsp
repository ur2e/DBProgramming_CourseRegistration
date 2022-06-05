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

/**
 * DELETE_ENROLL(IN s_id, IN c_id, OUT c_name);
 */

CallableStatement cstmt = null;
String mySQL = null;

mySQL = "{call DELETE_ENROLL(?,?,?)}";
cstmt = myConn.prepareCall(mySQL);
cstmt.setInt(1,s_id);
cstmt.setInt(2,c_id);
cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);	
cstmt.execute();
String result = cstmt.getString(3);

%>

<script>
    alert(`<%=result%> 과목의 수강신청을 취소하였습니다.`);
	location.href="main.jsp";
</script>

</body>
</html>