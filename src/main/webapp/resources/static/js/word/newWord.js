function addEndWord(data) {
    $.ajax({
        type: "post",
        url: "/dango/endWord/add",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: (result) => {
        	console.log(result)
        	if(result === "success")
            	console.log("성공!");
        },
        error: () =>{
            console.log("에러");
        }
    })
}
function addWrong(data) {
    $.ajax({
        type: "post",
        url: "/dango/wrong/add",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: (result) => {
        	console.log(result)
        	if(result === "success")
            	console.log("성공!");
        },
        error: () =>{
            console.log("에러");
        }
    })
}