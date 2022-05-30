<%@ page language="java" contentType="text/html; 
charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수강신청 시스템 로그인</title>
    <style>
        @font-face {
            font-family: 'GmarketSansBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            background-color: #f3f3f3;
            font-family: 'GmarketSansBold';
            align-items: center;
            align-content: center;
        }
        .center-box {
            margin: 150px auto;
            width: 600px;
            box-shadow: -2px 2px 2px gray;
            border-style: none;
            border-radius: 8px;
            vertical-align: center;
            background-color: rgb(255, 255, 255);
        }
        .sm-logo {
            margin: 40px 0px 20px 0px;
        }
        .login-box {
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color:#eaf0fc;
        }
        .login-btn {
            background-color: #252f77;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 16px 32px;
            margin: 4px 20px;
            cursor: pointer;
            height: 100px;
            font-family: 'GmarketSansBold';
            font-size: 18px;
        }
        .outer-box {
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>


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