<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/main.css">

</head>

<%
String session_id = (String) session.getAttribute("id");
PreparedStatement pstmt = null;
String mySQL = null;
ResultSet rs = null;
int s_id = Integer.parseInt(session_id);
mySQL = "SELECT s_id, s_major, s_name, s_grade, last_credit, last_score FROM students WHERE s_id=?";
pstmt = myConn.prepareStatement(mySQL);
pstmt.setInt(1, s_id);
rs = pstmt.executeQuery();
if(rs.next()) {
    int student_id = rs.getInt("s_id");
    String s_major = rs.getString("s_major");
    String s_name = rs.getString("s_name");
    int s_grade = rs.getInt("s_grade");
    int last_credit = rs.getInt("last_credit");
    float last_score = rs.getFloat("last_score");
%>

<body>
    <div align="outer-box" class="outer-box">
        <div class="top-box">학부 수강신청</div>
    </div>

    <div class="content-box" id="student_info">
        <div class="content-title">학생기본정보</div>
        <hr>

        <table align="center" class="student-table">
            <tbody>
                <tr>
                    <td class="student-title">
                        학번:
                    </td>
                    <td>
                        <div class="student-content"><%=student_id%></div>
                    </td>
                    <td class="student-title">
                        성명:
                    </td>
                    <td>
                        <div class="student-content"><%=s_name%></div>
                    </td>
                    <td class="student-title">
                        전공:
                    </td>
                    <td>
                        <div class="student-content"><%=s_major%></div>
                    </td>
                    <td class="student-title">
                        학년:
                    </td>
                    <td>
                        <div class="student-content"><%=s_grade%></div>
                    </td>
                </tr>
                <tr>
                    <td class="student-title">
                        직전학기 이수학점:
                    </td>
                    <td>
                        <div class="student-content"><%=last_credit%></div>
                    </td>
                    <td class="student-title">
                        직전학기 성적:
                    </td>
                    <td>
                        <div class="student-content"><%=last_score%></div>
                    </td>
                    <td class="student-title">
                        수강가능학점:
                    </td>
                    <td>
                        <div class="student-content">12</div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <% } 
    pstmt.close();
    myConn.close();
    %>
</body>