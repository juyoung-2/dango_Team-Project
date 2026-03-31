<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디찾기</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/find.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <section>
        <article>
            <div id="logo-text">
                <a id="logo" href="/dango/">
                    だんご🍡
                </a>
                <p>비밀번호 찾기</p>
            </div>
          <form action="/dango/user/findPW" method="post">
            <div class="input">
                <label for="id">아이디</label>
                <input id="id" name="userId" type="text" placeholder="아이디">
            </div>
            <div class="input">
                <label for="email">이메일</label>
                <input id="email" name="userEmail" type="email" placeholder="이메일">
            </div>
            <div id="btn-group">
                <button id="login-btn" class="btn_open">비밀번호 찾기</button>
            </div>
            
          </form>
        </article>
    </section>
</body>