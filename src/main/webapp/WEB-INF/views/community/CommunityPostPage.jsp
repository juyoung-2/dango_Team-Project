<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${board.boardTitle} : だんご 커뮤니티</title>
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
	href="${pageContext.request.contextPath}/resources/static/css/community/community.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/community/community_post.css?ab">
</head>
<body>

	<jsp:include page="../common/header.jsp" />

<div class="Postbox">
	<div class="Postmain">
		<div class="Post">
			<div class="PostHeader">
				<c:if test="${board.boardNotice eq 1}">
					<div class="Posttype">공지사항</div>
				</c:if>
				<c:if test="${board.boardNotice eq 0}">
					<div class="Posttype">자유게시판</div>
				</c:if>
				<div class="PostHeaderButtonGroup">
					<c:if test="${board.userId eq user.userId || user.userAdmin eq 'Y'}">
						<form action="/dango/community/boardDelete" method="post">
							<input type="hidden" name="boardId" value="${board.boardId}">
							<button type="submit" class="PostHeaderButtonRemove">삭제</button>
						</form>
						<form action="/dango/community/boardUpdatePage" method="post">
							<input type="hidden" name="boardId" value="${board.boardId}">
							<button type="submit" class="PostHeaderButtonEdit">수정</button>
						</form>
					</c:if>
				</div>
			</div>
			
			<!-- 스크랩 버튼 -->
			<div class="scrapBox">
				<div class="scrapbuttonBox">
					<button id="scrap-btn-on">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
						  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
						</svg>
					</button>
					<button id="scrap-btn-off">
						<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bookmark-fill" viewBox="0 0 16 16">
						  <path d="M2 2v13.5a.5.5 0 0 0 .74.439L8 13.069l5.26 2.87A.5.5 0 0 0 14 15.5V2a2 2 0 0 0-2-2H4a2 2 0 0 0-2 2z"/>
						</svg>
					</button>
				</div>
			</div>
			
			<div class="Posttitle">
				${board.boardTitle}
			</div>
			<div class="postinfo">
				<div class="postinfo_user">
					<c:choose>
						<c:when test="${not empty board.userProfile}">
							<img class="profile-img" src="/dango/user/display?userProfile=${board.userProfile}" alt="" />
						</c:when>
						<c:otherwise>
							<img class="profile-img" src="${pageContext.request.contextPath}/resources/static/image/profileDefault.jpg" />
						</c:otherwise>
					</c:choose>
					${board.userId}
				</div>
				<div class="postinfo_date">${board.boardRegisterDate}</div>
			</div>
			<hr style="margin: 10px;">
			<div class="commentbox">
			
			<!-- 유저가 작성한 댓글 -->
			<div class="postcontent">
				${board.boardMain}
			</div>
			
			<!-- 추천버튼 -->
			<div class="recommendinfo">
				<button id="recommendbutton">
					<svg id="recommend-img" viewBox="64 64 896 896" focusable="false"
						data-icon="like" width="32px" height="32px" fill="currentColor"
						aria-hidden="true">
						<path
							d="M885.9 533.7c16.8-22.2 26.1-49.4 26.1-77.7 0-44.9-25.1-87.4-65.5-111.1a67.67 67.67 0 00-34.3-9.3H572.4l6-122.9c1.4-29.7-9.1-57.9-29.5-79.4A106.62 106.62 0 00471 99.9c-52 0-98 35-111.8 85.1l-85.9 311h-.3v428h472.3c9.2 0 18.2-1.8 26.5-5.4 47.6-20.3 78.3-66.8 78.3-118.4 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7-.2-12.6-2-25.1-5.6-37.1zM112 528v364c0 17.7 14.3 32 32 32h65V496h-65c-17.7 0-32 14.3-32 32z"></path></svg>
					<p>추천</p>
				</button>
			</div>
			<div id="like-views-comments">
				<p>
					<svg viewBox="64 64 896 896" focusable="false" data-icon="like"
						width="1em" height="1em" fill="currentColor" aria-hidden="true">
						<path
							d="M885.9 533.7c16.8-22.2 26.1-49.4 26.1-77.7 0-44.9-25.1-87.4-65.5-111.1a67.67 67.67 0 00-34.3-9.3H572.4l6-122.9c1.4-29.7-9.1-57.9-29.5-79.4A106.62 106.62 0 00471 99.9c-52 0-98 35-111.8 85.1l-85.9 311h-.3v428h472.3c9.2 0 18.2-1.8 26.5-5.4 47.6-20.3 78.3-66.8 78.3-118.4 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7 0-12.6-1.8-25-5.4-37 16.8-22.2 26.1-49.4 26.1-77.7-.2-12.6-2-25.1-5.6-37.1zM112 528v364c0 17.7 14.3 32 32 32h65V496h-65c-17.7 0-32 14.3-32 32z"></path></svg>
					<span id="recommend-count">2</span>
				</p>
				<p>
					<svg viewBox="64 64 896 896" focusable="false" data-icon="eye"
						width="1em" height="1em" fill="currentColor" aria-hidden="true">
						<path
							d="M396 512a112 112 0 10224 0 112 112 0 10-224 0zm546.2-25.8C847.4 286.5 704.1 186 512 186c-192.2 0-335.4 100.5-430.2 300.3a60.3 60.3 0 000 51.5C176.6 737.5 319.9 838 512 838c192.2 0 335.4-100.5 430.2-300.3 7.7-16.2 7.7-35 0-51.5zM508 688c-97.2 0-176-78.8-176-176s78.8-176 176-176 176 78.8 176 176-78.8 176-176 176z"></path></svg>
					<span>${board.boardViews}</span>
				</p>
			</div>
			
			<!-- 댓글추가 -->
			<div class="postcomment">
				<textarea placeholder="댓글을 입력해주세요." id="comment-main" class="postcomment_c"></textarea>
				<button id="comment-btn" class="postcomment_b" type="button">등록</button>
			</div>
			
			<div class="postinfo">
				<div>${comment.userID}</div>
				<div>${comment.commentRegisterDate}</div>
			</div>
			<div class="postcontent">
				${comment.commentMain }
			</div>
			</div>
			<div id="comment-list">
				
			</div>
			<div style="margin: 10px;">
			</div>
		</div>
	</div>
	
</div>

	<jsp:include page="../common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
	<script type="text/javascript">
		let boardId = "${board.boardId}";
		let userId = "${user.userId}";
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/static/js/community/CommunityPostPage.js">
	</script>
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/static/js/community/scrap.js">
	</script>
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/static/js/community/comment.js">
	</script>
	<script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
	<script>
		const commentList = document.getElementById("comment-list");
	    const commentMain = document.getElementById("comment-main");
	    

		$.ajax({
			type: "post",
			url: "/dango/comment/getCommentList",
			data: JSON.stringify({
				boardId: boardId
			}),
			dataType:'json',
			contentType: "application/json; charset=utf-8",
			success: (result) => {
				
				for(let i = 0; i < result.length; i++) {
					let userProfile = "${pageContext.request.contextPath}/resources/static/image/profileDefault.jpg";
					if(result[i].userProfile !== null)
						userProfile = "/dango/user/display?userProfile=" + result[i].userProfile;
					let text1 = `
								<div class="comment-normal-div">
									<div class="comment-info">
										<div><img src="` + userProfile + `" alt="">` + result[i].userId + `</div>
										<div>` + result[i].commentRegisterDate + `</div>
									</div>
									<div class="comment-second-line">
										<div class="comment-text">
											` + result[i].commentMain + `
										</div>
								`;
					let text2 = "";
					if(userId === result[i].userId)
						text2 = `
									<div class="button-div">
			                            <button type="button" class="modify-btn">수정</button>
			                            <button type="button" class="delete-btn">삭제</button>
			                        </div>
			                        `;
					else
						text2 = `
								<div class="button-div">
									<input type="hidden" class="modify-btn">
									<input type="hidden" class="delete-btn">
								</div>
								`
					let text3 = `
									</div>
								</div>
								<div class="comment-modify-div">
		                            <div class="postcomment">
		                                <textarea placeholder="댓글을 입력해주세요." class="postcomment_c comment-main">` + result[i].commentMain + `</textarea>
		                                <button class="postcomment_b comment-modify-btn" type="button">등록</button>
		                            </div>
		                        </div>
								<input type="hidden" class="comment-id" value="` + result[i].commentId + `" />
								`;
					let text = text1 + text2 + text3;
					let commentDiv = document.createElement("div");
					commentDiv.classList.add("comment");
					commentDiv.innerHTML = text;
					commentList.appendChild(commentDiv);
				}
				onloadFunction();
			}
		})

        $("#comment-btn").click(() => {
        	data = {
        			userId: userId,
					boardId: boardId,
					commentMain: commentMain.value,
        	};
			$.ajax ({
				type: "post",
				url: "/dango/comment/insertComment",
				data: JSON.stringify(data),
				dataType:'json',
				contentType: "application/json; charset=utf-8",
				success: (result) => {
					if(result !== null) {
						console.log(result);
						let userProfile = "${pageContext.request.contextPath}/resources/static/image/profileDefault.jpg";
						if(result.userProfile !== null)
							userProfile = "/dango/user/display?userProfile=" + result.userProfile;
						let text1 = `
									<div class="comment-normal-div">
										<div class="comment-info">
											<div><img src="` + userProfile + `" alt="">` + result.userId + `</div>
											<div>` + result.commentRegisterDate + `</div>
										</div>
										<div class="comment-second-line">
											<div class="comment-text">
												` + result.commentMain + `
											</div>
									`
										
						let text2 = "";	
						if(result.userId === userId)
							text2 = `
										<div class="button-div">
			                                <button type="button" class="modify-btn">수정</button>
			                                <button type="button" class="delete-btn">삭제</button>
			                            </div>
										`;
						else
							text2 = `
										<div class="button-div">
			                                <input type="hidden" class="modify-btn">
			                                <input type="hidden" class="delete-btn">
			                            </div>
							`
						let text3 = `
			                        	</div>
			                        </div>
									<div class="comment-modify-div">
			                            <div class="postcomment">
			                                <textarea placeholder="댓글을 입력해주세요." class="postcomment_c comment-main">` + result.commentMain + `</textarea>
			                                <button class="postcomment_b comment-modify-btn" type="button">등록</button>
			                            </div>
			                        </div>
									<input type="hidden" class="comment-id" value="` + result.commentId + `" />
									`
						let text = text1 + text2 + text3;
						let commentDiv = document.createElement("div");
						commentDiv.classList.add("comment");
						commentDiv.innerHTML = text;
						commentList.appendChild(commentDiv);
						commentMain.value = "";
						onloadFunction();
					}
				},
				error: () => {
					console.log("error");
				}
			})
        })
        
		
		function onloadFunction() {
			const comment = $(".comment");
		    const deleteBtn = $(".delete-btn");
		    const modifyBtn = $(".modify-btn");
		    const commentNormal = $(".comment-normal-div");
		    const commentModify = $(".comment-modify-div");
		    const commentModifyBtn = $(".comment-modify-btn");
		    const commentsMain = $(".comment-main");
		    const commentText = $(".comment-text");
		    const commentId = $(".comment-id");
		    
		    for(let i = 0; i < deleteBtn.length; i++) {
	            deleteBtn[i].addEventListener("click", () => {
	            	$.ajax({
						type: "post",
						url: "/dango/comment/deleteComment",
						data: JSON.stringify({
							commentId: commentId[i].value
						}),
						contentType: "application/json; charset=utf-8",
						success: (result) => {
							console.log(result);
							if(result === "success") {
								comment[i].style.display = "none";
							}
						},
						error: () => {
							console.log("error");
						}
					})
	            })
	            modifyBtn[i].addEventListener("click", () =>{
					commentsMain[i].value = commentText[i].innerText;
	                commentNormal[i].style.display = "none";
	                commentModify[i].style.display = "block";
	            })
	            commentModifyBtn[i].addEventListener("click", () => {
	            	console.log(commentId[i])
	            	console.log(commentsMain[i])
					$.ajax({
						type: "post",
						url: "/dango/comment/updateComment",
						data: JSON.stringify({
							commentId: commentId[i].value,
							commentMain: commentsMain[i].value,
						}),
						contentType: "application/json; charset=utf-8",
						success: (result) => {
							console.log(result);
							if(result !== null) {
								commentNormal[i].style.display = "block";
								commentModify[i].style.display = "none";
								commentText[i].innerText = result.commentMain;
							}
						},
						error: () => {
							console.log("error");
						}
					})
	                
	            })
	        }
	        
		}

		const scrapBtnOn = document.getElementById("scrap-btn-on");
		const scrapBtnOff = document.getElementById("scrap-btn-off");
		
		$.ajax({
			type: "post",
			url: "/dango/scrap/getScrap",
			data: JSON.stringify({
				boardId: Number(boardId)
			}),
			contentType: "application/json; charset=utf-8",
			success: (result) => {
				if(result === "success") {
					scrapBtnOff.style.display = "block";
					scrapBtnOn.style.display = "none";
				}
			},
			error: () =>{
				console.log("에러");
			}
		})
	    
	    scrapBtnOn.addEventListener("click", () => {
	        let data = {
	        	boardId: Number(boardId)
	        };
	        $.ajax({
	            type: "post",
	            url: "/dango/scrap/insertScrap",
	            data: JSON.stringify(data),
	            contentType: "application/json; charset=utf-8",
	            success: (result) => {
	                if(result === "success") {
	                    scrapBtnOff.style.display = "block";
	                    scrapBtnOn.style.display = "none";
	                }
	            },
	            error: () =>{
	                console.log("에러");
	            }
	        })
	    })

		scrapBtnOff.addEventListener("click", () => {
	            let data = {
	            	boardId: Number(boardId)
	            };
	            $.ajax({
	                type: "post",
	                url: "/dango/scrap/deleteScrap",
	                data: JSON.stringify(data),
	                contentType: "application/json; charset=utf-8",
	                success: (result) => {
	                    if(result === "success") {
	                        scrapBtnOff.style.display = "none";
	                        scrapBtnOn.style.display = "block";
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