<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("id");
String log;
if (session_id == null)
log = "<a href=login.jsp>로그인</a>";
else log = "<a href=logout.jsp>로그아웃</a>"; 

String user_name = (String) session.getAttribute("name");
%>
<%-- <table width="75%" align="center" bgcolor="#FFFF99" border>
<tr>
<td align="center"><b><%=log%></b></td>
<td align="center"><b><a href="update.jsp">사용자 정보 수정</b></td>
<td align="center"><b><a href="insert.jsp">수강신청 입력</b></td>
<td align="center"><b><a href="delete.jsp">수강신청 삭제</b></td>
<td align="center"><b><a href="select.jsp">수강신청 조회</b></td>
</tr>
</table> --%>
<head>
    <link rel="stylesheet" href="../css/top.css">
</head>
<body>
    <header>
        <div style="display:flex"><img class="top-img" src="./image/top-logo.JPG"> 
            <h4 align="left"><a class="back-main" href=main.jsp><span class="user-name" style="color:white">숙명수강신청시스템</span></a></h4></div>
        <nav>
          <span class="user-name" style="color:white"><%=user_name%></span><span>님 접속을 환영합니다.</span> <span> | </span>
          <a href="update.jsp"><span>비밀번호변경</span> <span> | </span>
          <span><%=log%></span>
        </nav>
      </header>
</body>