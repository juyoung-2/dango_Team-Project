<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <div>
        <div>
            <a id="logo" href="/dango/">
                だんご🍡
            </a>
            <nav>
                <a href="/dango/word/new">새 단어</a>
                <a href="/dango/word/wrong">오답노트</a>
                <a href="/dango/word/wordMain">단어장</a>
                <a href="/dango/dictionary">사전</a>
                <a href="/dango/community">커뮤니티</a>
            </nav>
        </div>
        <c:choose>
        	<c:when test="${not empty user}">
        		<div class="dropdown">
        			<button id="my-page" type="button">
				    	<c:choose>
							<c:when test="${not empty user.userProfile}">
								<img class="profile-img" src="/dango/user/display?userProfile=${user.userProfile}" alt="" />
							</c:when>
							<c:otherwise>
								<img class="profile-img" src="${pageContext.request.contextPath}/resources/static/image/profileDefault.jpg" />
							</c:otherwise>			
						</c:choose>
				    </button>
				    <div class="dropdown-content">
				        <a href="/dango/user/modify">마이페이지</a>
				        <a href="/dango/word/wordMain">단어장</a>
				        <a href="/dango/scrap">스크랩</a>
				        <a href="/dango/user/logout">로그아웃</a>
				    </div>
				</div>
        	</c:when>
        	<c:otherwise>
        		<a id="login" href="/dango/user/login">로그인 / 회원가입</a>
        	</c:otherwise>
        </c:choose>
    </div>
</header>