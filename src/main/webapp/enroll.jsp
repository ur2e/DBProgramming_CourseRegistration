<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>

<%
String session_id = (String) session.getAttribute("id");
if(session_id == null) {
%>
   <script language=javascript>
      alert("enroll 접근 불가, 로그인을 먼저 해주세요");
      location.href = "login.jsp";
   </script>
<%
}
%>
<head>
    <link rel="stylesheet" href="./css/main.css">
</head>
<body>

<div class="content-box" id="enroll">
   <div class="content-title">수강신청내역</div>
   <hr>

   <table align="center" width="90%" class="enroll_table">
   <tr>
      <td class="enroll_h"><b>과목번호</b></td>
      <td class="enroll_h"><b>과목명</b></td>
      <td class="enroll_h"><b>분반</b></td>
      <td class="enroll_h"><b>학점</b></td>
      <td class="enroll_h"><b>담당 교수</b></td>
      <td class="enroll_h"><b>강의 요일</b></td>
      <td class="enroll_h"><b>강의 시간</b></td>
      <td class="enroll_h"><b>해당 년도</b></td>
      <td class="enroll_h"><b>해당 학기</b></td>
      <td class="enroll_h"><b>신청 취소</b></td>
      <%-- <td align="center"><b>수강신청상태</b></td> --%>
   </tr>


<%
PreparedStatement pstmt = null;
String sql = null;
ResultSet resultSet = null;
int s_id = Integer.parseInt(session_id);
System.out.println(s_id);
sql = "SELECT c_id, c_name, c_no, c_credit, c_prof, c_day, c_time, e_year, e_sem FROM enroll WHERE s_id=?";

pstmt = myConn.prepareStatement(sql);
pstmt.setInt(1, s_id);
resultSet = pstmt.executeQuery();

if(!resultSet.isBeforeFirst())
{
   System.out.println("pass7");
%>
   <tr>
      <td class="enroll_content" colspan=10>
         <img src="../image/warning.jfif" height="15px"> 해당 테이블에 데이터가 없습니다.
      </td>
   </tr>

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
      int e_sem = resultSet.getInt("e_sem");

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
      <td class="enroll_content"><%=c_id%></td>
      <td class="enroll_content"><%=c_name%></td>
      <td class="enroll_content"><%=c_no%></td>
      <td class="enroll_content"><%=c_credit%></td>
      <td class="enroll_content"><%=c_prof%></td>
      <td class="enroll_content"><%=dayString %></td>
      <td class="enroll_content"><%=timeString%></td>
      <td class="enroll_content"><%=e_year%></td>
      <td class="enroll_content"><%=e_sem%></td>
      <td class="enroll_content"><a href="delete_verify.jsp?s_id=<%=s_id%>&c_id=<%=c_id%>">
                <button>취소</button></a></td>
</tr>
<%
   }
}
%>
</table>
</div>
</body>

</html>
