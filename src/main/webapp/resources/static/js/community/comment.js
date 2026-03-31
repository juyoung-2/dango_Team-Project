function createReply(name, comment, date) {

  var divTag = document.createElement('div');
  
  var namedateDiv = document.createElement('div');
  namedateDiv.classList.add('postinfo');

  var nameDiv = document.createElement('div');
  var nameTag = document.createElement('p');
  nameTag.textContent = name;
  nameDiv.appendChild(nameTag);
  namedateDiv.appendChild(nameDiv);

  var dateDiv = document.createElement('div');
  var dateTag = document.createElement('p');
  dateTag.textContent = date;
  dateDiv.appendChild(dateTag);
  namedateDiv.appendChild(dateDiv);

  divTag.appendChild(firstLineDiv);

  var commentTag = document.createElement('p');
  commentTag.textContent = comment;

  divTag.appendChild(commentTag);

  // 수정버튼
  var updateButton = document.createElement('button');
  updateButton.textContent = '수정';
  updateButton.style.backgroundColor = 'white';
  updateButton.style.color = 'black';
  updateButton.addEventListener('click', function() {
    updateComment(commentTag);
  });
  divTag.appendChild(editButton);

  // 삭제버튼
  var deleteButton = document.createElement('button');
  deleteButton.textContent = '삭제';
  updateButton.style.backgroundColor = 'red';
  updateButton.style.color = 'white';
  deleteButton.addEventListener('click', function() {
    deleteComment(divTag);
  });
  divTag.appendChild(deleteButton);
  
  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/comment/getcommentList', true);
  xhr.setRequestHeader('Content-Type', 'application/json');

  var data = {
    userId: userId,
    commentMain: commentMain,
    commentRegisterdate: commentRegisterdate
  };

  xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        console.log('데이터 전송 성공');
      } else {
        console.error('데이터 전송 실패');
      }
    }
  };

  xhr.send(JSON.stringify(data));
}

function updateComment(divTag, commentTag, dateTag) {
  var newComment = prompt('수정할 댓글을 입력하세요.');
  if (newComment !== null && newComment !== '') {
    commentTag.textContent = newComment;
  }
}

function deleteComment(divTag) {
  var DeleteCheck = confirm('삭제하시겠습니까?');
  if (deleteCheck) {
    divTag.parentNode.removeChild(divTag);
  }
}