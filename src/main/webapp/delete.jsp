<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <title>delete 테스트 페이지</title>
    <style type="text/css">
        .course-list {
            border-collapse: collapse;
            border-spacing: 0;
        }

        .course-list td {
            border-color: black;
            border-style: solid;
            border-width: 1px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            overflow: hidden;
            padding: 10px 5px;
            word-break: normal;
        }

        .course-list th {
            border-color: black;
            border-style: solid;
            border-width: 1px;
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            overflow: hidden;
            padding: 10px 5px;
            word-break: normal;
        }

        .course-list .list-col {
            border-color: inherit;
            text-align: left;
            vertical-align: top
        }
    </style>
</head>

<body>

<% 
String session_id = (String) session.getAttribute("id");
if (session_id==null) response.sendRedirect("login.jsp"); %>


    <table class="course-list">
        <thead>
            <tr>
                <th class="list-col">과목번호 c_id</th>
                <th class="list-col">분반 c_no</th>
                <th class="list-col">과목명 c_name</th>
                <th class="list-col">강의시간 c_time,c_day</th>
                <th class="list-col">담당교수 c_prof</th>
                <th class="list-col">이수단계 c_grade</th>
                <th class="list-col">학점 c_credit</th>
                <th class="list-col">신청취소</th>
            </tr>
        </thead>
        <tbody>
<%
Statement stmt = null;
PreparedStatement pstmt = null;
String mySQL = null;
ResultSet rs = null;

int s_id = Integer.parseInt(session_id);
mySQL = "SELECT c_id, c_no, c_name, c_time, c_day, c_prof, c_grade, c_credit FROM enroll WHERE s_id=?";

pstmt = myConn.prepareStatement(mySQL);
pstmt.setInt(1, s_id); 
rs = pstmt.executeQuery();

if (rs == null) {
    System.out.println("enroll 없우면 ...~ ");
} else {
    while (rs.next()){
    int c_id = rs.getInt("c_id");
    int c_no = rs.getInt("c_no");
    String c_name = rs.getString("c_name");
    int c_time = rs.getInt("c_time");
    int c_day = rs.getInt("c_day");
    String c_prof = rs.getString("c_prof");
    int c_grade = rs.getInt("c_grade");
    int c_credit = rs.getInt("c_credit");
    
%>
            <tr>
                <td class="list-col"><%=c_id%></td>
                <td class="list-col"><%=c_no%></td>
                <td class="list-col"><%=c_name%></td>
                <td class="list-col"><%=c_day + c_time%></td>
                <td class="list-col"><%=c_prof%></td>
                <td class="list-col"><%=c_grade%></td>
                <td class="list-col"><%=c_credit%></td>
                <td class="list-col"><a href="delete_verify.jsp?s_id=<%=s_id%>&c_id=<%=c_id%>">
                <button>취소</button></a></td>
            </tr>
            <% }} %>
        </tbody>
    </table>
</body>

</html>