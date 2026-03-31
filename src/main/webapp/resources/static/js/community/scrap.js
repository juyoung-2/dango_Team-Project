$('.scrapbutton').click(function() {
  var boardId = $(this).data('boardId');
  var userId = $(this).data('userId');
  
  if ($(this).hasClass('active')) {

    $.ajax({
      url: '/scrap/deleteScrap',
      type: 'POST',
      data: {
        boardId: boardId,
        userId: userId
      },
      success: function(response) {
        alert('스크랩이 취소되었습니다.');
        $(this).removeClass('active');
      },
      error: function() {
        alert('스크랩 취소에 실패했습니다.');
      }
    });
  } else {

    $.ajax({
      url: '/scrap/insertScrap',
      type: 'POST',
      data: {
        boardId: boardId,
        userId: userId
      },
      success: function(response) {
        alert('스크랩되었습니다.');
        $(this).addClass('active');
      },
      error: function() {
        alert('스크랩에 실패했습니다.');
      }
    });
  }
});