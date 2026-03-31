<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>だんご 사전</title>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/search.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionaryMain.css">
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div id="container" class="wrapper">
	<div id="content">
		<div>
			<div>
				<form id="search_box" action="/dango/dictionary/search" method="get">
					<fieldset id="search_area">
					<input type="search" placeholder="일본어 검색" class="search_input" name="keyword">
					<button type="submit" value="검색" class="search_button"><i class="fa fa-search"></i></button>
					</fieldset>
				</form>
			</div>
		</div>
		<div id="conversation_view">
			<h3>오늘의 회화</h3>
			<div class="conversation_viewBox">
				<p>こんにちは</p>
				<h3>뜻 : 안녕하세요</h3>
			</div>
		</div>
		
		<div id="jlptword_view">
			<div class="title-group">
				<h2>오늘의 단어</h2>
			</div>
			<div class="jlptword_viewBox">
				<div class="jlptword_viewBox1">
					<h2>N1급</h2><br>
					<div class="jlptword_group">
						<p>創立</p>
						<div>
							<h3>そうりつ</h3>
							<h3>창립</h3>
						</div>
					</div>
				</div>
				<div class="line"></div>
				<div class="jlptword_viewBox2">
					<h2>N2급</h2><br>
					<div class="jlptword_group">
						<p>液体</p>
						<div>
							<h3>えきたい</h3>
							<h3>액체</h3>
						</div>
					</div>
				</div>
		</div>
	</div>
	</div>
</div>
<div class="space"></div>
<jsp:include page="../common/footer.jsp" />

</body>
</html>