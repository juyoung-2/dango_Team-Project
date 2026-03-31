function toggleCheck(userId,wordId) {
    $.ajax({
      type: 'POST',
      url: '/dango/check/toggleCheck',
      data: { "userId": userId, "wordId":wordId },
      success: function (result) {
        if (result) {
          // 좋아요 처리된 경우 버튼 스타일 변경 등 추가 처리
          $('#checkButton').prop("checked", true);
          $('#checkButton').css();
        } else {
          // 좋아요 취소된 경우 버튼 스타일 변경 등 추가 처리
          $('#checkButton').prop("checked", false);
          $('#checkButton').css();
        }
      }, 
      error: () =>{
        console.log("에러");
    }
    });
  }