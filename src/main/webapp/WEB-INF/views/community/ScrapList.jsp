<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<div class="Commu_box">
    <form>
        <div class="search_banner">
        	<input class="search_bar" type="text" value="게시글 검색하기"><input class="search_button" type="submit" value="🔍">
            <a class="new_text">글쓰기</a>
        </div>
    </form>
        <div class="announ_box">
            <div class="Postmenu">
                <a class="Postmenu_m">공지사항</a>
                <a class="Postmenu_m">자유게시판</a>
                <a class="Postmenu_m" href="/scrap/scrapList">스크랩</a>
            </div>
            <div class="CoummnityClass">
                <div class="CoummnityClasshead">
                    <h1 class="CoummnityClassTitle">자유게시판</h1>
                    <h3 class="CoummnityClassText">자유 게시판은 회원 여러분의 자유로운 생각을 나누고 토론하는 공간입니다.</h3>
                </div>
                <a class="CoummnityClassLink">이용수칙 자세히 보기</a>
            </div>
            <div class="title">
            </div>
           <c:forEach var="scrap" items="${scrapList}">
        	
        	<a class="textbox" href="/community/viewBoard?boardId=${scrap.scrapId}">
		    	<div class="textbox_title">${scrap.boardTitle}</div>
        	   	<div class="textbox_info">
                <div style="margin-left: 10px;">${scrap.boardRegisterDate}</div>
                <div style="margin-left: 10px;">${scrap.views}</div>
	            <div style="margin-left: 10px;">${scrap.likes}</div>
        	</a>
        	
    		</c:forEach>
            <div style="width: 100%; height: 50px;"></div>
        </div>
    </div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>