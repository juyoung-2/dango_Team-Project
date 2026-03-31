<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/login.css">
</head>
<body>
    <section>
        <article>
            <div id="logo-text">
                <a id="logo" href="/dango/">
                    だんご🍡
                </a>
                <p>일본어를 향한 첫 걸음!</p>
                <p>단고</p>
            </div>
          <form id="login-form" action="/dango/user/login" method="post">
            <div class="input">
                <label for="id">아이디</label>
                <input id="id" name="id" type="text" placeholder="아이디">
            </div>
            <div class="input">
                <label for="password">비밀번호</label>
                <input id="password" name="pw" type="password" placeholder="비밀번호">
            </div>
            <div id="btn-group">
                <button id="login-btn">로그인</button>
                <a id="signup-btn" href="/dango/user/register">회원가입</a>
            </div>
          </form>
            <div id="find-link">
                <a href="#pop_findID" class="pop_open">아이디 찾기</a>
                <div></div>
                <a href="#pop_findPW" class="pop_open">비밀번호 찾기</a>
            </div>
            <div id="else-text">
                <a href="">서비스 소개</a>
                <a href="">개인정보처리방침 및 이용약관</a>
            </div>
        </article>
    </section>
    <script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
<script>
	var target = document.querySelectorAll('.pop_open');
	
	var findID = "/dango/user/userfindId" ;
	var findPW = "/dango/user/userfindPw" ;
	var pop_option = "resizable=no, scrollbars=no, status=no, width=440px, height=640px, top=300px, left=240px, toolbar=no, menubar=no";
	
	for(var i = 0; i < target.length; i++){
	    target[i].addEventListener('click', function(){
	      targetID = this.getAttribute('href');
	      if(targetID == "#pop_findID"){
	    	  window.open(findID,"아이디찾기",pop_option);
	      }
	      else if(targetID == "#pop_findPW"){
	    	  window.open(findPW,"비밀번호찾기",pop_option);
	      }
	    });
	  }
	
	let loginForm = document.getElementById("login-form");
	loginForm.addEventListener("submit", function(e) {
		e.preventDefault();
		console.log($("#id").val())
        $.ajax({
            type: "post",
            url: "/dango/user/restLogin",
            data: JSON.stringify({   // data를 JSON 문자열로 변환
                userId: $("#id").val(),
                userPw: $("#password").val()
            }),
            contentType: "application/json; charset=utf-8",
            success: (result) => {
                if(result === "success") {
                	location.href = "/dango";
                } else {
                    alert("아이디 혹은 비밀번호를 잘못 입력하였습니다.");
                }
            },
            error: () => {
                console.log("error");
            }
        })
	})
</script>
</body>
</html>