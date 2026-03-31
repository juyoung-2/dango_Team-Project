<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'${keyword}'의 검색결과 : だんご 사전</title>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/search.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionaryFont.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionaryList.css">
</head>
<body>

<jsp:include page="../common/header.jsp" />

<section id="container" class="wrapper">
	<div id="content">
		<div>
			<form id="search_box" action="/dango/dictionary/search" method="get">
					<fieldset id="search_area">
					<input type="search" placeholder="일본어 검색" class="search_input" name="keyword">
					<button type="submit" value="검색" class="search_button"><i class="fa fa-search"></i></button>
					</fieldset>
				</form>
		</div>
			
		<div id="dictionary_area">
			<c:forEach var="word" items="${wordList}">
				<div class="voca">
					<div class="word">
						<a class="furigana" href="/dango/dictionary/${word.wordId}">${word.wordFurigana }</a>
						<p class="kanji">【${word.wordWord}】</p>
					</div>
					<p class="mean">${word.wordMean}</p>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<jsp:include page="../common/footer.jsp" />

</body>
</html>