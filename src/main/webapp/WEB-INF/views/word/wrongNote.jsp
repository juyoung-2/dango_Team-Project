<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오답노트</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/word/wrongNote.css?abcdde">
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <section>
        <div id="intro">
            <div id="intro-text-area">
                <h1>오답노트</h1>
                <p>틀린 단어들이 랜덤으로 나와요.... 같이 복습해봐요!</p>
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
            <p class="correct-count">정답 횟수 : <span class="wrong-num">${sentence.wrongNum}</span></p>
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
                <input class="wrong-id" type="hidden" value="${sentence.wrongId}">
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
    const userId = "${user.userId}";
</script>
<script src="${pageContext.request.contextPath}/resources/static/js/word/wrongNote.js"></script>

<script type="text/javascript">
const okBtn = $(".ok-btn");
const wordJp = $(".word-jp");
const answer = $(".answer");
const answer2 = $(".answer2");
const wordId = $(".word-id");
const article = $("article");
const rightImg = $(".right-img");
const wrongImg = $(".wrong-img");
const correctCount = $(".correct-count");
const wrongNum = $(".wrong-num");
const wrongId = $(".wrong-id");

for(let i = 0; i < okBtn.length; i++) {
    okBtn[i].addEventListener("click", () =>{
    	let count = Number(wrongNum[i].innerText);
        let data = {
            wrongId: wrongId[i].value,
            wrongNum: Number(wrongNum[i].innerText)
        };
        console.log(data)
        if(wordJp[i].value !== answer[i].value && wordJp[i].value !== answer2[i].value) {
            updateWrongNumZero(data, i);
            count = 0;
        } else {
            updateWrongNumPlusOne(data, i);
            count++;
        }
        okBtn[i].style.visibility = "hidden";
        if(count >= 3) {
            removeWrong(data, i);
        }
    })
}
</script>
<script>
    const checkBtnOn = $('.check-btn-on');
    const checkBtnOff = $('.check-btn-off');
    
    for(let i = 0; i < checkBtnOn.length; i++) {
		console.log(wordId[i].value);
        $.ajax({
            type: "post",
            url: "/dango/check/toggleCheck",
            data: JSON.stringify({
                wordId: Number(wordId[i].value)
            }),
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