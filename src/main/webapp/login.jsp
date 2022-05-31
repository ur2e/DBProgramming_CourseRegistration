<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수강신청 시스템 로그인</title>
    <link rel="stylesheet" href="../css/login.css">


</head>

<body>
    <div align="center" class="center-box">
        <div class="content-box" style="width: 350px">
            <img class="sm-logo" src="./image/sm-logo.png">
            <hr style="width: 100%;">
            <h3 style="margin-bottom: 20px; color: #252f77; font-size: 26px;"> 수강신청 사이트 로그인 </h3>
            <form method="post" action="login_verify.jsp">
                <div align="center" class="outer-box">
                    <div>
                        <input class="login-box" type="text" name="userID">
                        <br>
                        <input class="login-box" type="password" name="userPassword">
                    </div>
    
                    <div>
                        <input class="login-btn" type="submit" name="Submit" value="로그인">
                    </div>
                </div>
            </form>
            <div align=left  style="margin-top: 10px; margin-bottom: 20px; color: grey; font-size: 10px;">
                초기 비밀번호 : 대문자 SM + 생년월일yymmdd+! (예: SMyymmdd!)
            </div>
            <br>
            <br>
        </div>
    </div>
</body>
</html>