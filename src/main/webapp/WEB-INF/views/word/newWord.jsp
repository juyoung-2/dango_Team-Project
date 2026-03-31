<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 단어 배우기</title>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/word/newWord.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />
<section>
    <div id="intro">
        <div id="intro-text-area">
            <h1>새 단어 배우기</h1>
            <p>새로운 단어 20개가 나와요! 같이 공부해봐요!</p>
        </div>
    </div>
    <c:forEach var="sentence" items="${sentenceList}">
    	<article>
            <div class="right-img">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-circle" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                </svg>
            </div>
            <div class="wrong-img">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
				  <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
				</svg>
            </div>
	        <div class="korean">
		        <c:if test="${not empty sentence.exFrontKr}">
		        	<p class="front-sentence-kr">${sentence.exFrontKr}</p>
		        </c:if>
	            <h2 class="word-kr">${sentence.wordMean}</h2>
	            <c:if test="${not empty sentence.exBackKr}">
	            	<p class="back-sentence-kr">${sentence.exBackKr}</p>
	            </c:if>
	        </div>
	        <div class="japanese">
	        	<c:if test="${not empty sentence.exFrontJp}">
	            	<p class="front-sentence-jp">${sentence.exFrontJp}</p>
	            </c:if>
	            <input class="word-jp" type="text">
	            <input class="word-id" type="hidden" value="${sentence.wordId}">
	            <input class="answer" type="hidden" value="${sentence.wordWord}">
	            <input class="answer2" type="hidden" value="${sentence.wordFurigana}">
	            <c:if test="${not empty sentence.exBackJp}">
	            	<p class="back-jp">${sentence.exBackJp}</p>
	            </c:if>
	        </div>
	        <div class="btn-group">
	            <button class="ok-btn">확인</button>
	        </div>
	    </article>
    </c:forEach>
</section>
<jsp:include page="../common/footer.jsp" />
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
<script type="text/javascript">
const userId = `${userId}`;
</script>
<script src="${pageContext.request.contextPath}/resources/static/js/word/newWord.js"></script>
<script>
const okBtn = $(".ok-btn");
const wordJp = $(".word-jp");
const answer = $(".answer");
const answer2 = $(".answer2");
const wordId = $(".word-id");
const article = $("article");
const rightImg = $(".right-img");
const wrongImg = $(".wrong-img");

for(let i = 0; i < okBtn.length; i++) {
    okBtn[i].addEventListener("click", () =>{
        const data = {
            userId: userId,
            wordId: wordId[i].value
        };
        if(wordJp[i].value !== answer[i].value && wordJp[i].value !== answer2[i].value) {
            addWrong(data);
            article[i].classList.add("vibration");
            wrongImg[i].style.visibility = "visible";
            article[i].style.border = "4px solid rgb(255, 23, 68)";
            setTimeout(function() {
                article[i].classList.remove("vibration");
            }, 500);
        } else {
        	rightImg[i].style.visibility = "visible";
            article[i].style.border = "4px solid green"
        }
        okBtn[i].style.visibility = "hidden";
        addEndWord(data);
    })
}

</script>
</body>
</html>