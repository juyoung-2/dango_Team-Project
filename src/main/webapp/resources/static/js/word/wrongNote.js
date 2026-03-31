function updateWrongNumPlusOne(data, i) {
    data.wrongNum = data.wrongNum + 1;
    $.ajax({
        type: "post",
        url: "/dango/wrong/update",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: (result) => {
        	console.log(result)
        	if(result === "success") {
        		rightImg[i].style.visibility = "visible";
	            article[i].style.border = "4px solid green"
	            wrongNum[i].innerText = Number(wrongNum[i].innerText) + 1;
            	console.log("성공!");
            }
        },
        error: () =>{
            console.log("에러");
        }
    })
}
function updateWrongNumZero(data, i) {
    data.wrongNum = 0;
    $.ajax({
        type: "post",
        url: "/dango/wrong/update",
        data: JSON.stringify(data),
        contentType: "application/json; charset=utf-8",
        success: (result) => {
        	console.log(result)
        	if(result === "success") {
	        	article[i].classList.add("vibration");
	            wrongImg[i].style.visibility = "visible";
	            article[i].style.border = "4px solid rgb(255, 23, 68)";
	            setTimeout(function() {
	                article[i].classList.remove("vibration");
	            }, 500);
        		wrongNum[i].innerText = 0;
            	console.log("성공!");
            }
        },
        error: () =>{
            console.log("에러");
        }
    })
}
function removeWrong(data, i) {
    $.ajax({
        type: "delete",
        url: "/dango/wrong/remove",
        data: JSON.stringify(data.wrongId),
        contentType: "application/json; charset=utf-8",
        success: (result) => {
        	console.log(result)
        	if(result === "success") {
            	console.log("성공!");
            }
        },
        error: () =>{
            console.log("에러");
        }
    })
}