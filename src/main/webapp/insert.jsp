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
<table class="course-list">
        <thead>
            <tr>
                <th class="list-col">과목번호 c_id</th>
                <th class="list-col">분반 c_no</th>
                <th class="list-col">과목명 c_name</th>
                <th class="list-col">담당교수 c_prof</th>
                <th class="list-col">강의시간 c_day, c_time</th>
                <th class="list-col">이수단계 c_grade</th>
                <th class="list-col">학점 c_credit</th>
                <th class="list-col">정원 c_max</th>
                <th class="list-col">신청 c_crnt</th>
                <th class="list-col">여석 c_spare</th>
                <th class="list-col">신청</th>
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
	

	cstmt1 = myConn.prepareCall("{? = call Date2EnrollSemester(SYSDATE)}");
	cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);	
	cstmt2 = myConn.prepareCall("{? = call Date2EnrollYear(SYSDATE)}");
	cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);	
	
	
	try {
		cstmt1.execute();
		year = cstmt1.getInt(1);
		cstmt2.execute();
		sem = cstmt2.getInt(1);
		System.out.println("year: "+year+" sem: "+sem);
	} catch(SQLException e){
		System.err.println("SQLException: " + e.getMessage());
	} 
	
	
	mySQL = "SELECT * FROM Course c "
			+"WHERE c.c_id  NOT IN(SELECT e.c_id FROM Enroll e WHERE e.s_id= ? and e.e_year= ? and e.e_semester=?)";
	pstmt = myConn.prepareStatement(mySQL);
	pstmt.setInt(1, s_id);
	pstmt.setInt(2, year);
	pstmt.setInt(3, sem);
	rs = pstmt.executeQuery();
	
	
	if (rs != null) {
		while (rs.next()){
		    int c_id = rs.getInt("c_id");
		    int c_no = rs.getInt("c_no");
		    String c_name = rs.getString("c_name");
		    String c_prof = rs.getString("c_prof");
		    int c_time = rs.getInt("c_time");
		    int c_day = rs.getInt("c_day");
		    int c_grade = rs.getInt("c_grade");
		    int c_credit = rs.getInt("c_credit");
		    int c_max = rs.getInt("c_max");
		    int c_crnt = rs.getInt("c_crnt");
		    int c_spare = rs.getInt("c_spare");
	%>
	            <tr>
	                <td class="list-col"><%=c_id%></td>
	                <td class="list-col"><%=c_no%></td>
	                <td class="list-col"><%=c_name%></td>
	                <td class="list-col"><%=c_prof%></td>
	                <td class="list-col"><%=c_day + c_time%></td>
	                <td class="list-col"><%=c_grade%></td>
	                <td class="list-col"><%=c_credit%></td>
	                <td class="list-col"><%=c_max%></td>
	                <td class="list-col"><%=c_crnt%></td>
	                <td class="list-col"><%=c_spare%></td>
	                <td class="list-col"><a href="insert_verify.jsp?s_id=<%=s_id%>&c_id=<%=c_id%>&c_no=<%=c_no%>">
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