<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/signup.css">
</head>
<body>
    <section>
        <form id="signup-form" action="/dango/user/register" method="post">
            <div id="logo-text">
                <a id="logo" href="/dango/">
                    だんご🍡
                </a>
                <p>회원가입</p>
            </div>
            <div class="input">
                <label for="id">아이디</label>
                <input id="id" type="text" name="userId" placeholder="아이디" required>
                <p id="id-p">아이디를 6자 이상으로 설정해주세요.</p>
                <p id="id-no">사용 중인 아이디 입니다.</p>
                <p id="id-yes">사용 가능한 아이디 입니다.</p>
            </div>
            <div class="input">
                <label for="password">비밀번호</label>
                <input id="password" type="password" name="userPw" placeholder="비밀번호" required>
                <p id="password-p">비밀번호를 8자 이상으로 설정해주세요.</p>
            </div>
            <div class="input">
                <label for="password2">비밀번호 재확인</label>
                <input id="password2" type="password" placeholder="비밀번호" required>
                <p id="password2-p">비밀번호를 재확인 해주세요.</p>
            </div>
            <div class="input">
                <label for="name">이름</label>
                <input id="name" type="text" name="userName" placeholder="이름" required>
            </div>
            <div class="input">
                <label for="eamil">이메일</label>
                <input id="email" type="email" name="userEmail" placeholder="이메일" required>
                <p>올바른 형식이 아닙니다.</p>
            </div>
            <div class="input">
                <label for="phone">전화번호</label>
                <input id="phone" type="text" name="userPhone" placeholder="전화번호" required>
                <p>올바른 형식이 아닙니다.</p>
            </div>
            <div id="btn-group">
                <button id="signup-btn" type="submit">가입하기</button>
                <a id="login-link" href="/dango/user/login">단고회원이신가요? <span class="red-font">로그인하러 가기</span></a>
            </div>
        </form>
    </section>
    <script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/user/signup.js"></script>
    <script>
        
        
    </script>
</body>
</html>