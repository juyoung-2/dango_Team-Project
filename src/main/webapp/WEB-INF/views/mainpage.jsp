<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>だんご🍡</title>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/mainpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/slide.css" />
    
</head>
<body>
    <jsp:include page="common/header.jsp" />
    <section class="mainpagearea">
		    <div class="slide slide_wrap">
			      <div class="slide_item"><a href="/dango/word/new"><img class="slide_img" alt="" src="${pageContext.request.contextPath}/resources/static/image/banner1.png"></a></div>
			      <div class="slide_item"><a href="/dango/community"><img class="slide_img" alt="" src="${pageContext.request.contextPath}/resources/static/image/banner2.png"></a></div>
			      <div class="slide_item"><a href="/dango/dictionary"><img class="slide_img" alt="" src="${pageContext.request.contextPath}/resources/static/image/banner3.png"></a></div>
			      <div class="slide_prev_button slide_button">◀</div>
			      <div class="slide_next_button slide_button">▶</div>
			      <ul class="slide_pagination"></ul>
		    </div>
        <div class="mainpagetitlearea">
            <h1 class="mainpagetitle">
                일본어 단어 학습 사이트,<br>
                <strong>단고</strong>와 함께하기.
            </h1>
        </div>
        <div class="mainpagecontentarea">
            <div class="mainpagecontenttitle">
                <div class="contenttitle">
                    <h3>커뮤니티</h3>
                    <sub>등록되어있는 글 목록</sub>
                </div>
                <a class="contentmore" href="/dango/community/free">
                    더보기
                </a>
            </div>
            <c:forEach var="board" items="${boardList}">            
            <a class="textbox" href="/dango/community/boardView/${board.boardId}">
                <div class="textbox_title">${board.boardTitle}</div>
                <div class="textbox_info">
                    <div style="margin-left: 10px;">${board.boardRegisterDate}</div>
                    <div style="margin-left: 10px;">
                    	<svg viewBox="64 64 896 896" focusable="false" data-icon="eye" width="1em" height="1em" fill="currentColor" aria-hidden="true"><path d="M396 512a112 112 0 10224 0 112 112 0 10-224 0zm546.2-25.8C847.4 286.5 704.1 186 512 186c-192.2 0-335.4 100.5-430.2 300.3a60.3 60.3 0 000 51.5C176.6 737.5 319.9 838 512 838c192.2 0 335.4-100.5 430.2-300.3 7.7-16.2 7.7-35 0-51.5zM508 688c-97.2 0-176-78.8-176-176s78.8-176 176-176 176 78.8 176 176-78.8 176-176 176z"></path></svg>
                        ${board.boardViews}
                    </div>
                    <div style="margin-left: 10px;">
                    	<svg viewBox="64 64 896 896" focusable="false" data-icon="like" width="1em" height="1em" fill="currentColor" aria-hidden="true"><path d="M885.9 533.7c16.8-22.2 26.1-49.4 26.1-77.7 0-44.9-25.1-87.4-65.5-111.1a67.67 67.67 0 00-34.3-9.3H572.4l6-122.9c1.4-29.7-9.1-57.9-29.5-79.4A106.62 106.62 0 00471 99.9c-52 0-98 35-111.8 85.1l-85.9 311h-.3v428h472.3c9.2 0 18.2-1.8 26.5-5.4 47.6-20.3 78.3-66.8 78.3-118.4 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7-.2-12.6-2-25.1-5.6-37.1zM112 528v364c0 17.7 14.3 32 32 32h65V496h-65c-17.7 0-32 14.3-32 32z"></path></svg>
                        ${board.recommends}
                    </div>
                </div>
            </a>
            </c:forEach>
        </div>
        <div class="mainpagecontentarea">
            <div class="mainpagecontenttitle">
                <div class="contenttitle">
                    <h3>새단어 목록</h3>
                    <sub>새 단어 배우기</sub>
                </div>
                <a class="contentmore" href="/dango/word/new">
                    더보기
                </a>
            </div>
            <div class="mainwordarea">
                <article>
                    <div class="word-hurigana">
                        <a class="word" href="#">事実</a>
                        <p class="hurigana">[じじつ]</p>
                    </div>
                    <div class="mean-list">
                        <p class="mean">1. 사실</p>
                        <p class="mean">2. 실제로 일어난 일</p>
                        <p class="mean">3. 정말로;참말로</p>
                    </div>
                </article>
                <article>
                    <div class="word-hurigana">
                        <a class="word" href="#">望む</a>
                        <p class="hurigana">[のぞむ]</p>
                    </div>
                    <div class="mean-list">
                        <p class="mean">1. 조망하다</p>
                        <p class="mean">2. 바라다</p>
                        <p class="mean">3. 따르다</p>
                    </div>
                </article>
                <article>
                    <div class="word-hurigana">
                        <a class="word" href="#">臨む</a>
                        <p class="hurigana">[のぞむ]</p>
                    </div>
                    <div class="mean-list">
                        <p class="mean">1. 면하다</p>
                        <p class="mean">2. 임하다</p>
                        <p class="mean">3. 만나다</p>
                    </div>
                </article>
            </div>
        </div>
    </section>
    <jsp:include page="common/footer.jsp" />
 <script src="${pageContext.request.contextPath}/resources/static/js/slide.js"></script>
</body>
</html>