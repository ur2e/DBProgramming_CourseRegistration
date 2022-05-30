<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head> <meta charset="EUC-KR">
<%@ include file="top.jsp" %>

<% 
if(session_id == null) 
	{
%>
<script language=javascript>
  alert("로그인을 먼저 해주세요");
  location.href = "login.jsp";
</script>
<%
}
%>

<title>수강신청 조회</title> </head>

<body>



<br><br>
<table width="75%" align="center" bgcolor="#FFFF99" border>

<tr>
<td align="center"><b>과목번호</b></td>
<td align="center"><b>과목명</b></td>
<td align="center"><b>분반</b></td>
<td align="center"><b>학점</b></td>
<td align="center"><b>담당 교수</b></td>
<td align="center"><b>강의 요일</b></td>
<td align="center"><b>강의 시간</b></td>
<td align="center"><b>해당 년도</b></td>
<td align="center"><b>해당 학기</b></td>
<td align="center"><b>수강신청상태</b></td>
</tr>


<%
Statement stmt = null;
PreparedStatement pstmt = null;
String sql = null;
ResultSet resultSet = null;

int s_id = Integer.parseInt(session_id);
System.out.println(s_id);
sql = "SELECT c_id, c_name, c_no, c_credit, c_prof, c_day, c_time, e_year, e_semester FROM enroll WHERE s_id=?";

pstmt = myConn.prepareStatement(sql);
pstmt.setInt(1, s_id); 
resultSet = pstmt.executeQuery();

if(resultSet == null) 
{
	System.out.println("pass7");
	%>
<script>
  alert("수강신청한 과목이 없습니다. 수강신청을 해주세요.");
  location.href = "main.jsp";
</script>
<% 
} 
else
{
	String dayString = null;
	String timeString = null;
	
	while(resultSet.next())
	{
		int c_id = resultSet.getInt("c_id");
		String c_name = resultSet.getString("c_name");
		int c_no = resultSet.getInt("c_no");
		float c_credit = resultSet.getInt("c_credit");
		String c_prof = resultSet.getString("c_prof");
		int c_day = resultSet.getInt("c_day");
		int c_time = resultSet.getInt("c_time");
		int e_year = resultSet.getInt("e_year");
		int e_semester = resultSet.getInt("e_semester");
		
		if(c_day == 1) dayString = "월 ,수";
		else if(c_day == 2) dayString = "화, 목";
		else dayString = "금";
		
		if(c_time == 1) timeString = "9:00 ~ 10:15";
		else if(c_time == 2) timeString = "10:30 ~ 11:45";
		else if(c_time == 3) timeString = "12:00 ~ 13:15";
		else if(c_time == 4) timeString = "13:30 ~ 14:45";
		else if(c_time == 5) timeString = "15:00 ~ 16:15";
		else if(c_time == 6) timeString = "16:30 ~ 17:45";
		else timeString = "18:00 ~ 17:30";

		
%>
<tr bgcolor="#FFFFFF">
		<td><%=c_id%></td>
		<td><%=c_name%></td>
		<td><%=c_no%></td>
		<td><%=c_credit%></td>
		<td><%=c_prof%></td>
		<td><%=dayString %></td>
		<td><%=timeString%></td>
		<td><%=e_year%></td>
		<td><%=e_semester%></td>
		<td><a href="delete_verify.jsp?s_id=<%=s_id%>&c_id=<%=c_id%>">
                <button>취소</button></a></td>
</tr>
<% 
	}
}


%>
</table> 

</body> 

</html>