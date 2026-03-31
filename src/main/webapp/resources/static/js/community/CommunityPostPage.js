let recommendCheck = false;

$.ajax({
    type: "post",
    url: "/dango/recommend",
    
    data: JSON.stringify({
        userId: userId,
        boardId: boardId
    }),
    contentType: "application/json; charset=utf-8",
    success: (result) => {
        console.log(result)
        if(result === "success") {
            $('#recommend-img').css("color", "#e94754");
            recommendCheck = true;
        }
    },
    error: () =>{
        console.log("에러");
    }
})
$.ajax({
    type: "post",
    url: "/dango/recommend/count",
    data: JSON.stringify({
        boardId: boardId
    }),
    contentType: "application/json; charset=utf-8",
    success: (result) => {
        console.log(result);
        $('#recommend-count').html(result);
    },
    error: () =>{
        console.log("에러");
    }
})
$('#recommendbutton').click(() => {
    let recommendCount = Number($('#recommend-count').text());
    if(recommendCheck) {
        $.ajax({
            type: "post",
            url: "/dango/recommend/remove",
            data: JSON.stringify({
                userId: userId,
                boardId: boardId
            }),
            contentType: "application/json; charset=utf-8",
            success: (result) => {
                console.log(result)
                if(result === "success") {
                    $('#recommend-img').css("color", "#000");
                    $('#recommend-count').html(recommendCount - 1);
                    recommendCheck = false;
                }
            },
            error: () =>{
                console.log("에러");
            }
        })
    } else {
        $.ajax({
            type: "post",
            url: "/dango/recommend/add",
            data: JSON.stringify({
                userId: userId,
                boardId: boardId
            }),
            contentType: "application/json; charset=utf-8",
            success: (result) => {
                console.log(result)
                if(result === "success") {
                    $('#recommend-img').css("color", "#e94754");
                    $('#recommend-count').html(recommendCount + 1);
                    recommendCheck = true;
                }
            },
            error: () =>{
                console.log("에러");
            }
        })
    }
})