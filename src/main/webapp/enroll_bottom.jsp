<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./css/main.css">
</head>
<%
String session_id = (String) session.getAttribute("id");
PreparedStatement pstmt = null;
String sql = null;
ResultSet resultSet = null;
int s_id = Integer.parseInt(session_id);
int total_cnt, sum_credit;
sql = "SELECT COUNT(c_id) as total_cnt, SUM(c_credit) as sum_credit FROM enroll WHERE s_id=?";
pstmt = myConn.prepareStatement(sql);
pstmt.setInt(1, s_id);
resultSet = pstmt.executeQuery();
if(resultSet.next()){
   total_cnt = resultSet.getInt("total_cnt");
   sum_credit = resultSet.getInt("sum_credit");
} else{
   total_cnt = 0;
   sum_credit = 0;
}
%>

<body>
    <table align="center" class="student-table" style="margin-top: 15px;">
    <td class="student-title">총 신청 과목 수: </td>
    <td><div class="student-content"><%=total_cnt%></div></td>
    <td class="student-title">총 신청 학점: </td>
    <td><div class="student-content"><%=sum_credit%></div></td>
    </table>
</body>

</html>
