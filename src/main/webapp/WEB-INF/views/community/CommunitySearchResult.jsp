<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:if test="${category eq 'notice'}">
    	<title>공지사항 목록</title>
    </c:if>
    <c:if test="${category eq 'free'}">
    	<title>자유 게시판 목록</title>
    </c:if>
    <c:if test="${category eq 'scrap'}">
    	<title>스크랩 목록</title>
    </c:if>
    <c:if test="${empty category}">
    	<title>${keyword} : だんご 검색결과</title>
    </c:if>
    <link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css" rel="stylesheet">
    <link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/common/search.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/community/community.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/community/community_menu.css">
</head>

<body>
<jsp:include page="../common/header.jsp" />

    <div class="Commu_box">
        <form action="/dango/community/CommunitySearch" method="get">
        	<div class="search_banner">
        		<input class="search_bar" name="keyword" type="text" placeholder="게시글 검색하기" value="${keyword}">
        		<button class="search_button" type="submit">
        			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
        		</button>
                <a class="new_text" href="/dango/community/boardInsert">글쓰기</a>
	        </div>
	    </form>
        <div class="announ_box">
            <div class="Postmenu">
                <a class="Postmenu_m" href="/dango/community/notice">공지사항</a>
                <a class="Postmenu_m" href="/dango/community/free">자유게시판</a>
                <a class="Postmenu_m" href="/dango/scrap">스크랩</a>
            </div>
            <div class="CoummnityClass">
            	<c:choose>
	            	<c:when test="${category eq 'notice'}">            	
		                <div class="CoummnityClasshead">
		                   	<h1 class="CoummnityClassTitle">공지사항</h1>
		                    <h3 class="CoummnityClassText">공지사항 게시판은 단고의 주요한 소식을 안내하는 공간입니다.</h3>
		                </div>
	            	</c:when>
	                <c:when test="${category eq 'free'}">
	                	<div class="CoummnityClasshead">
		                    <h1 class="CoummnityClassTitle">자유게시판</h1>
		                    <h3 class="CoummnityClassText">자유게시판은 회원 여러분의 자유로운 생각을 나누고 토론하는 공간입니다.</h3>
		                </div>
	                </c:when>
	                <c:when test="${category eq 'scrap'}">
	                	<div class="CoummnityClasshead">
		                    <h1 class="CoummnityClassTitle">스크랩</h1>
		                    <h3 class="CoummnityClassText">자신이 스크랩한 게시글들을 확인할 수 있는 공간입니다.</h3>
		                </div>
	                </c:when>
	            	<c:otherwise>
	            		<div class="CoummnityClasshead">
		                    <h1 class="CoummnityClassTitle">검색결과</h1>
		                    <h3 class="CoummnityClassText"></h3>
		                </div>
	            	</c:otherwise>
            	</c:choose>
            </div>
            <div class="title">
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
            <div style="width: 100%; height: 50px;"></div>
        </div>
    </div>
    <div id="paging">
        <a class="start-page" href="/dango/community/${category}?keyword=${keyword}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-bar-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.854 3.646a.5.5 0 0 1 0 .708L8.207 8l3.647 3.646a.5.5 0 0 1-.708.708l-4-4a.5.5 0 0 1 0-.708l4-4a.5.5 0 0 1 .708 0zM4.5 1a.5.5 0 0 0-.5.5v13a.5.5 0 0 0 1 0v-13a.5.5 0 0 0-.5-.5z"/>
            </svg>
        </a>
        <a th:href="/dango/community/${category}?page=${pagination.prevNo}&keyword=${keyword}" class="prev">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
            </svg>
        </a>

        <c:if test="${pagination.page < 5}">
            <c:forEach var="i" begin="1" end="5">
            	<c:if test="${i < pagination.endPage}">            	
                	<a class="change-page" href="/dango/community/${category}?page=${i}&keyword=${keyword}">${i}</a>
            	</c:if>
            </c:forEach>
            <c:if test="${pagination.endPage > 5}">
	            <a href="/dango/community/${category}?page=${pagination.page + 3}&keyword=${keyword}">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
	                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
	                </svg>
	            </a>
            </c:if>
            <a href="/dango/community/${category}?page=${pagination.endPage}&keyword=${keyword}">${pagination.endPage}</a>
        </c:if>

        <c:if test="${pagination.page >= 5 && pagination.page <= (pagination.endPage - 4)}">
            <a class="change-page" href="/dango/community/${category}?keyword=${keyword}">1</a>
            <a href="/dango/community/${category}?page=${pagination.page - 3}&keyword=${keyword}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                </svg>
            </a>
            <a class="change-page" href="/dango/community/${category}?page=${pagination.page - 1}&keyword=${keyword}">${pagination.page - 1}</a>
            <a class="change-page" href="/dango/community/${category}?page=${pagination.page}&keyword=${keyword}">${pagination.page}</a>
            <a class="change-page" href="/dango/community/${category}?page=${pagination.page + 1}&keyword=${keyword}">${pagination.page + 1}</a>
            <a class="change-page" href="/dango/community/${category}?page=${pagination.page + 3}&keyword=${keyword}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                </svg>
            </a>
            <a href="/dango/community/${category}?page=${pagination.endPage}&keyword=${keyword}">${pagination.endPage}</a>
        </c:if>

        <c:if test="${pagination.page > (pagination.endPage - 4) && pagination.endPage > 5}">
        	<a class="change-page" href="/dango/community/${category}?keyword=${keyword}">1</a>
            <a href="/dango/community/${category}?page=${pagination.page - 3}&keyword=${keyword}">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3zm5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3z"/>
                </svg>
            </a>
        	<c:forEach var="i" begin="${pagination.endPage - 4}" end="${pagination.endPage}">
                <a class="change-page" href="/dango/community/${category}?page=${i}&keyword=${keyword}">${i}</a>
        	</c:forEach>
        </c:if>

        <a href="/dango/community/${category}?page=${pagination.nextNo}&keyword=${keyword}" class="next">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
            </svg>
        </a>
        <a class="end-page" href="/dango/community/${category}?page=${pagination.endPage}&keyword=${keyword}">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-bar-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4.146 3.646a.5.5 0 0 0 0 .708L7.793 8l-3.647 3.646a.5.5 0 0 0 .708.708l4-4a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708 0zM11.5 1a.5.5 0 0 1 .5.5v13a.5.5 0 0 1-1 0v-13a.5.5 0 0 1 .5-.5z"/>
            </svg>
        </a>
    </div>

<jsp:include page="../common/footer.jsp" />

</body>

</html>