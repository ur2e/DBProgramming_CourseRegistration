<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
   String session_id = (String) session.getAttribute("id");
   if (session_id==null) response.sendRedirect("login.jsp"); 
%>

   <table width="75%" align="center" bgcolor="#FFFF99" border>
      <thead>
         <tr>
            <td align="center"><b>과목번호</b></td>
            <td align="center"><b>분반</b></td>
            <td align="center"><b>과목명</b></td>
            <td align="center"><b>담당 교수</b></td>
            <td align="center"><b>강의 요일</b></td>
            <td align="center"><b>강의 시간</b></td>
            <td align="center"><b>이수단계</b></td>
            <td align="center"><b>학점</b></td>
            <td align="center"><b>정원</b></td>
            <td align="center"><b>신청</b></td>
            <td align="center"><b>여석</b></td>
            <td align="center"><b>신청</b></td>
         </tr>
      </thead>

      <tbody>
<%
   CallableStatement cstmt1 = null;
   CallableStatement cstmt2 = null;
   PreparedStatement pstmt = null;
   String mySQL = null;
   ResultSet rs = null;
   
   int s_id = Integer.parseInt(session_id);
   int year = 0;
   int sem = 0;

   cstmt1 = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
   cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);  
   cstmt2 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
   cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
   
   try {
      cstmt1.execute();
      year = cstmt1.getInt(1);
      cstmt2.execute();
      sem = cstmt2.getInt(1);
   } catch(SQLException e){
      System.err.println("SQLException: " + e.getMessage());
   } 
   
   mySQL = "SELECT * FROM Course "
         +"WHERE c_id  NOT IN (SELECT e.c_id FROM Enroll e WHERE e.s_id= ? and e.e_year= ? and e.e_sem=?)";
   pstmt = myConn.prepareStatement(mySQL);
   pstmt.setInt(1, s_id);
   pstmt.setInt(2, year);
   pstmt.setInt(3, sem);
   rs = pstmt.executeQuery();
   
   if (rs != null) {
      String dayString = null;
      String timeString = null;
      
      while (rs.next()){
          int c_id = rs.getInt("c_id");
          int c_no = rs.getInt("c_no");
          String c_name = rs.getString("c_name");
          String c_prof = rs.getString("c_prof");
          int c_day = rs.getInt("c_day");
          int c_time = rs.getInt("c_time");
          int c_grade = rs.getInt("c_grade");
          int c_credit = rs.getInt("c_credit");
          int c_max = rs.getInt("c_max");
          int c_crnt = rs.getInt("c_crnt");
          int c_spare = rs.getInt("c_spare");
          
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
            <td><%=c_no%></td>
            <td><%=c_name%></td>
            <td><%=c_prof%></td>
            <td><%=dayString%></td>
            <td><%=timeString%></td>
            <td><%=c_grade%></td>
            <td><%=c_credit%></td>
            <td><%=c_max%></td>
            <td><%=c_crnt%></td>
            <td><%=c_spare%></td>
            <td><a href="insert_verify.jsp?s_id=<%=s_id%>&c_id=<%=c_id%>&c_no=<%=c_no%>">
            <button>신청</button></a></td>
      </tr>
   </tbody>
        
   <% 
         }
   }
      cstmt1.close();
      cstmt2.close();
      pstmt.close();
      myConn.close(); 
   %>

    </table>
</body>
</html>