<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link href="https://fonts.googleapis.com/earlyaccess/nicomoji.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/common/footer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/static/css/user/mypage.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<section>
		<form action="/dango/user/myPage" method="post">
			<p>회원정보</p>
			<div>
				<div id="text-div">
					<input type="hidden" name="userId" value="${user.userId}">
					<div class="input-div">
						<label for="name">이름</label> <input id="name" type="text"
							name="userName" placeholder="이름" value="${user.userName}"
							required>
					</div>
					<div class="input-div">
						<label for="email">이메일</label> <input id="email" type="email"
							name="userEmail" placeholder="이메일" value="${user.userEmail}"
							required>
					</div>
					<div class="input-div">
						<label for="phone">전화번호</label> <input id="phone" type="tel"
							name="userPhone" placeholder="전화번호" value="${user.userPhone}"
							required>
					</div>
					<div class="input-div">
						<label for="password">비밀번호</label> <input id="password"
							type="password" name="userPw" placeholder="비밀번호"
							value="${user.userPw}" required>
					</div>
					<div class="input-div">
						<label for="password2">비밀번호 확인</label> <input id="password2"
							type="password" placeholder="비밀번호 확인" value="${user.userPw}" required>
					</div>
				</div>
				<div id="profile-div">
					<label id="profile-label" for="profile">
						<c:choose>
							<c:when test="${not empty user.userProfile}">
								<img class="profile-img" src="/dango/user/display?userProfile=${user.userProfile}" alt="" />
							</c:when>
							<c:otherwise>
								<img class="profile-img" src="${pageContext.request.contextPath}/resources/static/image/profileDefault.jpg" />
							</c:otherwise>			
						</c:choose>
					</label>
                    <input id="profile" type="file" />
                    <input type="hidden" id="profile-path" name="userProfile" value="${user.userProfile}" >
				</div>
			</div>
			<div id="btn-group">
				<button class="btn" id="cancel" type="reset">취소</button>
				<button class="btn" id="save" type="submit">저장</button>
			</div>
		</form>
	</section>
	<jsp:include page="../common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
	<script type="text/javascript">

		const message = "${message}";
		if("${message}" !== "")
			alert("${message}");
	
		$("input[type=file]").on("change", function() {
			let formData = new FormData();
			formData.append("upload", $(this)[0].files[0]);
			console.log($(this)[0].files[0]);
			$.ajax({
				type : "post",
				url : "/dango/user/upload",
				data : formData,
				contentType : false,
				processData : false,
				success : showUploadResult
			})
		})

		function showUploadResult(userProfile) {
			let profileImg = $(".profile-img");
			for(let i = 0; i < profileImg.length; i++) {
			$($(".profile-img")[i]).attr("src",
					"/dango/user/display?userProfile=" + userProfile);
			}
			$("#profile-path").val(userProfile);
		}
	</script>
</body>
</html>