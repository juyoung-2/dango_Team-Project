<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>'${sentence.wordWord}' : だんご 사전</title>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css"
	rel="stylesheet">
<link
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'
	rel='stylesheet' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/search.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionarySearch.css?abc">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/dictionary/dictionaryFont.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<section id="container" class="wrapper">
		<div id="content">
			<div>
				<div>
					<form id="search_box" action="/dango/dictionary/search"
						method="get">
						<fieldset id="search_area">
							<input type="search" placeholder="일본어 검색" class="search_input"
								name="keyword">
							<button type="submit" value="검색" class="search_button">
								<i class="fa fa-search"></i>
							</button>
						</fieldset>
					</form>
				</div>
			</div>

			<div class="voca_view">
				<div id="voca_viewinfo">
					<h3>JLPT N${sentence.wordLevel}</h3>
				</div>
				<div class="voca_viewBox">
					<button id="check-btn-on">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
							class="bi bi-bookmark-check" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M10.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
							<path
								d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z" />
						</svg>
					</button>
					<button id="check-btn-off">
						
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
							class="bi bi-bookmark-check-fill" viewBox="0 0 16 16">
							<path fill-rule="evenodd"
								d="M2 15.5V2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.74.439L8 13.069l-5.26 2.87A.5.5 0 0 1 2 15.5zm8.854-9.646a.5.5 0 0 0-.708-.708L7.5 7.793 6.354 6.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
						</svg>
					</button>
					<div class="mean">
						<p class="sentence_JP">${sentence.wordFurigana}
							[${sentence.wordWord}]</p>
						<p>뜻 : ${sentence.wordMean}</p>
					</div>
					<hr>
					<div id="ex_sentence">
						<div id="korean">
							<c:if test="${not empty sentence.exFrontKr}">
								<p class="front-sentence-kr">${sentence.exFrontKr}</p>
							</c:if>
							<h2 class="word-kr">${sentence.wordMean}</h2>
							<c:if test="${not empty sentence.exBackKr}">
								<p class="back-sentence-kr">${sentence.exBackKr}</p>
							</c:if>
						</div>
						<div id="japanese">
							<c:if test="${not empty sentence.exFrontJp}">
								<p class="front-sentence-jp">${sentence.exFrontJp}</p>
							</c:if>
							<h2 class="word-jp">${sentence.wordWord}</h2>
							<c:if test="${not empty sentence.exBackJp}">
								<p class="back-jp">${sentence.exBackJp}</p>
							</c:if>
						</div>
						<input id="word-id" type="hidden" value="${sentence.wordId}">
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>

	<script type="text/javascript">
    const checkBtnOn = document.getElementById("check-btn-on");
    const checkBtnOff = document.getElementById("check-btn-off");
    const wordId = document.getElementById("word-id");
    
    console.log(wordId.value);

	$.ajax({
		type: "post",
		url: "/dango/check/toggleCheck",
		data: JSON.stringify({
			wordId: Number(wordId.value)
		}),
		contentType: "application/json; charset=utf-8",
		success: (result) => {
			if(result === "success") {
				checkBtnOff.style.display = "block";
				checkBtnOn.style.display = "none";
			}
		},
		error: () =>{
			console.log("에러");
		}
	})
    
    checkBtnOn.addEventListener("click", () => {
		console.log(wordId.value);
        let data = {
            wordId: Number(wordId.value)
        };
        $.ajax({
            type: "post",
            url: "/dango/check/add",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            success: (result) => {
                if(result === "success") {
                    checkBtnOff.style.display = "block";
                    checkBtnOn.style.display = "none";
                }
            },
            error: () =>{
                console.log("에러");
            }
        })
    })

	checkBtnOff.addEventListener("click", () => {
            let data = {
                wordId: Number(wordId.value)
            };
            $.ajax({
                type: "post",
                url: "/dango/check/remove",
                data: JSON.stringify(data),
                contentType: "application/json; charset=utf-8",
                success: (result) => {
                    if(result === "success") {
                        checkBtnOff.style.display = "none";
                        checkBtnOn.style.display = "block";
                    }
                },
                error: () =>{
                    console.log("에러");
                }
            })
        })
    
</script>
</body>
</html>