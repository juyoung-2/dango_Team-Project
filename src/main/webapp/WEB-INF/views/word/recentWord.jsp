<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/word/recentword.css?ater">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionaryFont.css?ater">

<meta charset="UTF-8">
<title>최근 본 단어</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<!-- 최근본 단어 -->
<!-- RECENT_UDDATE_DATE을 기준으로 불러오기 및 정렬 -->

<section id="container" class="wrapper">
	<div id="content">
		<div id="intro">
            <div id="intro-text-area">
                <h1>최근 본 단어</h1>
                <p>최근 본 단어들이 리스트에 기록되어 있어요.</p>
            </div>
        </div>
        <c:if test="${empty recentList}">
			<p id="no-check-msg">※ 최근 본 단어가 없습니다! ※</p>
		</c:if>
		<c:if test="${not empty recentList}">
			<div id="dictionary_area">
				
				<c:forEach var="word" items="${recentList}">
					<div class="voca">
						<div class="word">
							<p class="level">N${word.wordLevel}</p>
							<a class="furigana" href="/dango/dictionary/${word.wordId}">${word.wordFurigana}</a>
							<p class="kanji">【${word.wordWord}】</p>
							<p class="mean">${word.wordMean}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</section>
<jsp:include page="../common/footer.jsp" />
</body>
</html>