<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("id");
String log;
if (session_id == null)
log = "<a href=login.jsp>로그인</a>";
else log = "<a href=logout.jsp>로그아웃</a>"; 

String user_name = (String) session.getAttribute("name");
%>
<head>
    <link rel="stylesheet" href="./css/top.css">
</head>
<body>
    <header>
        <div style="display:flex"><img class="top-img" src="./image/top-logo.JPG"> 
            <h4 align="left"><a class="back-main" href=main.jsp><span class="user-name" style="color:white; font-size: 18px;">숙명수강신청시스템</span></a></h4></div>
        <nav>
          <span class="user-name" style="color:white"><%=user_name%></span><span>님 접속을 환영합니다.</span> <span> | </span>
          <a href="final_enroll.jsp"><span>수강신청결과조회</span></a> <span> | </span>
          <a href="update.jsp"><span>비밀번호변경</span></a> <span> | </span>
          <span><%=log%></span>
        </nav>
      </header>
</body>