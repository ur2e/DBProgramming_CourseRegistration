<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconfig.jsp" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/main.css">

</head>

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
                        <div class="student-content">181111</div>
                    </td>
                    <td class="student-title">
                        성명:
                    </td>
                    <td>
                        <div class="student-content">지유리</div>
                    </td>
                    <td class="student-title">
                        전공:
                    </td>
                    <td>
                        <div class="student-content">소프트웨어융합전공</div>
                    </td>
                    <td class="student-title">
                        학년:
                    </td>
                    <td>
                        <div class="student-content">4</div>
                    </td>
                </tr>
                <tr>
                    <td class="student-title">
                        직전학기 이수학점:
                    </td>
                    <td>
                        <div class="student-content">18</div>
                    </td>
                    <td class="student-title">
                        직전학기 성적:
                    </td>
                    <td>
                        <div class="student-content">18</div>
                    </td>
                    <td class="student-title">
                        수강가능학점:
                    </td>
                    <td>
                        <div class="student-content">18</div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>