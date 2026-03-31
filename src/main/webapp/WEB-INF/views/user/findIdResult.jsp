<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 결과</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/user/find.css">
</head>
<body>
    <section>
        <article>
            <div id="logo-text">
                <a id="logo" href="/dango/">
                    だんご🍡
                </a>
                <p>아이디 찾기 결과</p>
            </div>
            <c:if test="${not empty userId}">
	            <div id="show" class="IdBox">
	            	<p class="findIdPw">찾은 아이디 : </p>
	                <p>${userId}</p>
	            </div>
            </c:if>
            <c:if test="${empty userId}">
	            <div id="show" class="IdBox">
	                <p>찾는 아이디가 존재하지 않습니다.</p>
	            </div>
            </c:if>
            
        </article>
    </section>
</body>
</html>