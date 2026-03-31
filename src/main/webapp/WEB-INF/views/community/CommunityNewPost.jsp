<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>새 글 쓰기</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/community/community.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/community/community_newPost.css">

</head>

<body>

<jsp:include page="../common/header.jsp" />

   <div class="NewPostbox">
        <div class="NewPostmain">
            <form action="/dango/community/boardInsert" method="post">
            	<c:if test="${user.userAdmin eq 'Y'}">
	            	<div class="notice-title">
	            		<p>공지사항</p>
	            		<div class="notice-check">
			           		<input type="radio" id="notice-on" name="boardNotice" value="1"><label for="notice-on">ON</label>
			            	<input type="radio" id="notice-off" name="boardNotice" value="0" checked><label for="notice-off">OFF</label>
			        	</div>
	            	</div>
            	</c:if>
	            
	            <div class="NewPostTitle">
	                <input name="boardTitle" class="NewPostTitleText" type="text" placeholder="제목을 입력해 주세요.">
	            </div>
	            <div class="NewPostContent">
	                <textarea name="boardMain" placeholder="내용을 입력해 주세요." rows="1" class="NewPostContentText" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'></textarea>
	            </div>
            
	            <div style="height: 30px;">
	            </div>
	            <div class="newPost">
	                <input class="newPostbutton" type="submit" value="작성완료">
	            </div>
	            <input type="hidden" name="userId" value="${user.userId}">
	            
            </form>
        </div>
    </div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>