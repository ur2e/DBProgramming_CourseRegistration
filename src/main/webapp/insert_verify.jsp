<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<body>
<%
	int s_id = Integer.parseInt(request.getParameter("s_id"));
	int c_id = Integer.parseInt(request.getParameter("c_id"));
	int c_no = Integer.parseInt(request.getParameter("c_no"));
%>
<% 
	/**
	 * INSERT_ENROLL(IN s_id, IN c_id, IN c_no, OUT result);
	 */
	CallableStatement cstmt = null;
	String result = null;
	
	cstmt = myConn.prepareCall("{call INSERT_ENROLL(?,?,?,?)}");
	cstmt.setInt(1,s_id);
	cstmt.setInt(2,c_id);
	cstmt.setInt(3,c_no);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);	
	
	try{
		cstmt.execute();
		result = cstmt.getString(4);
	%>
	<script>
		alert("<%= result %>");
		location.href = "insert.jsp";
	</script>
	
	<%
	} catch (SQLException e){
		System.err.println("SQLException: " + e.getMessage());
	}
	/* SQL*/
	/*
	PreparedStatement pstmt = null;
	String mySQL = null;
	ResultSet rs = null;
	
	mySQL = "DELETE FROM enroll WHERE s_id=? and c_id=?";
	pstmt = myConn.prepareStatement(mySQL);
	pstmt.setInt(1, s_id); 
	pstmt.setInt(2, c_id); 
	rs = pstmt.executeQuery();
	*/
	cstmt.close();
%>


</body>
</html>