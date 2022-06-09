<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>
<%@ include file="top.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="./css/main.css">
</head>

<script>
    const open_date = new Date('2022-06-06 13:30:00'); 
    let today = getToday();
    if( open_date < today){
    } else {
        alert("수강신청 결과조회 기간이 아닙니다.\n조회 기간: 2022년 6월 13일 13시 이후")
        location.href="main.jsp";
    }
    function getToday() {
        var today = new Date();
        var year = today.getFullYear();
        var month = ('0' + (today.getMonth() + 1)).slice(-2);
        var day = ('0' + today.getDate()).slice(-2);
        var today = new Date();   
        var hours = ('0' + today.getHours()).slice(-2); 
        var minutes = ('0' + today.getMinutes()).slice(-2);
        var seconds = ('0' + today.getSeconds()).slice(-2);
        
        var dateString = year + '-' + month  + '-' + day + " ";
        var timeString = hours + ':' + minutes  + ':' + seconds;
        var str2Date = new Date(dateString+timeString);
        return str2Date;
    }
</script>

<body>
<div align="outer-box" class="outer-box">
        <div class="top-box">수강 조회</div>
</div>
<div class="content-box" id="enroll">
   <div class="content-title">수강신청결과조회</div>
   <hr>

   <table align="center" width="90%" class="enroll_table">
   <tr>
      <td class="enroll_h"><b>과목번호</b></td>
      <td class="enroll_h"><b>과목명</b></td>
      <td class="enroll_h"><b>분반</b></td>
      <td class="enroll_h"><b>학점</b></td>
      <td class="enroll_h"><b>담당 교수</b></td>
      <td class="enroll_h"><b>강의 시간</b></td>
      <td class="enroll_h"><b>수강신청상태</b></td>
   </tr>

<%
PreparedStatement pstmt = null;
PreparedStatement pstmt_update = null;
String mySQL_SELECT = null;
String mySQL_SELECT_ = null;
String mySQL_UPDATE = null;
String mySQL_COMMIT = null;
ResultSet resultSet = null;
String e_state_data = "확정";
mySQL_SELECT = "SELECT * FROM ordered_data WHERE RANK <= 1";
mySQL_UPDATE = "UPDATE ENROLL SET e_state = '확정' WHERE s_id=?";
myConn.setAutoCommit(false);
pstmt = myConn.prepareStatement(mySQL_SELECT);
resultSet = pstmt.executeQuery();
myConn.commit();
if(!resultSet.isBeforeFirst())
{
%>
   <tr>
      <td class="enroll_content" colspan=10>
         <img src="./image/warning.jfif" height="15px"> 해당 테이블에 데이터가 없습니다.
      </td>
   </tr>

<%
}
else
{

    while(resultSet.next())
    {
        
        int s_id = resultSet.getInt("s_id");

        pstmt_update = myConn.prepareStatement(mySQL_UPDATE);
        pstmt_update.setInt(1, s_id); 
        try{
            pstmt_update.executeUpdate();
            myConn.commit();
        } catch(Exception e){
            System.err.println("SQLException: " + e.getMessage());
        }
    }
}
String mySQL_PRINT = "SELECT * FROM ENROLL WHERE s_id=? and e_state='확정'";
PreparedStatement pstmt_print = null;
ResultSet rs_print = null;


int user_id = Integer.parseInt(session_id);
pstmt_print = myConn.prepareStatement(mySQL_PRINT);
pstmt_print.setInt(1, user_id);
rs_print = pstmt_print.executeQuery();

if(!rs_print.isBeforeFirst())
{
%>
   <tr>
      <td class="enroll_content" colspan=10>
         <img src="./image/warning.jfif" height="15px"> 해당 테이블에 데이터가 없습니다.
      </td>
   </tr>

<%
}
else
{ 
    while(rs_print.next()) {  
        String dayString = null;
        String timeString = null;
        String courseTimeString = null;
        int c_id = rs_print.getInt("c_id");
        String c_name = rs_print.getString("c_name");
        int c_no = rs_print.getInt("c_no");
        int c_credit = rs_print.getInt("c_credit");
        String c_prof = rs_print.getString("c_prof");
        int c_day = rs_print.getInt("c_day");
        int c_time = rs_print.getInt("c_time");
        
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
        String e_state = e_state_data;
        courseTimeString = dayString + " " + timeString;
    %>
    <tr bgcolor="#FFFFFF">
        <td class="enroll_content"><%=c_id%></td>
        <td class="enroll_content"><%=c_name%></td>
        <td class="enroll_content"><%=c_no%></td>
        <td class="enroll_content"><%=c_credit%></td>
        <td class="enroll_content"><%=c_prof%></td>
        <td class="enroll_content"><%=courseTimeString%></td>
        <td class="enroll_content"><%=e_state%></td>
    </tr>
<%
}
}

myConn.setAutoCommit(true);
pstmt.close();
%>
</table>
</div>
</body>
</html>