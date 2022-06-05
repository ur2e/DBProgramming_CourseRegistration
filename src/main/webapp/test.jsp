<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ include file="dbconfig.jsp" %>

<%

PreparedStatement pstmt = null;
PreparedStatement pstmt_update = null;
String mySQL_SELECT = null;
String mySQL_UPDATE = null;
ResultSet rs = null;
String e_state_data = "확정";

mySQL_SELECT = "SELECT * FROM (SELECT e.c_name, e.c_id, e.c_no, e.s_id, s_name, DENSE_RANK() OVER (PARTITION BY e.c_id, e.c_no ORDER BY s.s_grade desc, s.last_credit desc, s.last_score desc) RANK, c_max FROM ENROLL e , STUDENTS s, COURSE c WHERE e.s_id = s.s_id and (e.c_id = c.c_id and e.c_no = c.c_no) ORDER BY c_name, rank) WHERE RANK <= 1";
mySQL_UPDATE = "UPDATE ENROLL SET e_state = '확정' WHERE s_id=?";


pstmt = myConn.prepareStatement(mySQL_SELECT);
rs = pstmt.executeQuery();

pstmt_update = myConn.prepareCall(mySQL_UPDATE);


while(rs.next())
{
   String c_name = rs.getString("c_name");
   int c_id = rs.getInt("c_id");
   int c_no = rs.getInt("c_no");
   int s_id = rs.getInt("s_id");
   pstmt_update.setInt(1, s_id); 
   pstmt_update.execute();
   String e_state = e_state_data;

   %>
   <tr>
   <td><%=c_id%></td>
   <td><%=c_name%></td>
   <td><%=c_no%></td>
   <td><%=s_id%></td>
   <td><%=e_state %></td>
   </tr>
<% 
}
%>
