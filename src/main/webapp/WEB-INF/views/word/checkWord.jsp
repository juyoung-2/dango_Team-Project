<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Check Word</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/word/checkWord.css?abcde">
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <section>
        <div id="intro">
            <div id="intro-text-area">
                <h1>체크 단어</h1>
                <p>체크한 단어들이 리스트에 기록되어 있어요.</p>
            </div>
        </div>
        <c:if test="${empty checkList}">
		 	<div id="no-check-msg">
	            <p>※ 체크한 단어가 없습니다! ※</p>
	        </div>
		</c:if>
        <div id="article-list">
        	<c:forEach var="wordVO" items="${checkList}">
	        	<article>
	                <button class="check-btn-on check-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bookmark-check" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                        </svg>
                    </button>
                    <button class="check-btn-off check-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
                        </svg>
                    </button>
	                <div class="word-hurigana">
	                    <a class="furigana" href="/dango/dictionary/${wordVO.wordId}">${wordVO.wordFurigana}</a>
	                    <p class="word">[${wordVO.wordWord}]</p>
	                </div>
	                <div class="mean-list">
	                    <p class="mean">${wordVO.wordMean}</p>
	                </div>
	                <input class="word-id" type="hidden" value="${wordVO.wordId}">
	            </article>
        	</c:forEach>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp" />
    <script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
    <script>
    	const userId = "${user.userId}";
        const wordId = $(".word-id");
        const checkBtnOn = $('.check-btn-on');
        const checkBtnOff = $('.check-btn-off');
        
        for(let i = 0; i < checkBtnOn.length; i++) {
            checkBtnOn[i].addEventListener("click", () => {
                let data = {
                    userId: userId,
                    wordId: Number(wordId[i].value)
                };
                $.ajax({
                    type: "post",
                    url: "/dango/check/add",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    success: (result) => {
                        if(result === "success") {
                            checkBtnOff[i].style.display = "block";
                            checkBtnOn[i].style.display = "none";
                        }
                    },
                    error: () =>{
                        console.log("에러");
                    }
                })
            })
            checkBtnOff[i].addEventListener("click", () => {
                let data = {
                    userId: userId,
                    wordId: Number(wordId[i].value)
                };
                $.ajax({
                    type: "post",
                    url: "/dango/check/remove",
                    data: JSON.stringify(data),
                    contentType: "application/json; charset=utf-8",
                    success: (result) => {
                        if(result === "success") {
                            checkBtnOff[i].style.display = "none";
                            checkBtnOn[i].style.display = "block";
                        }
                    },
                    error: () =>{
                        console.log("에러");
                    }
                })
            })
        }
    </script>
</body>
</html>