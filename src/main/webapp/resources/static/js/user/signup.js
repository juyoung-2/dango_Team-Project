let id = document.getElementById("id");
let idP = document.getElementById("id-p");
const idYes = document.getElementById("id-yes");
const idNo = document.getElementById("id-no");
let checkId = false;

id.addEventListener("keyup", () => {
    if(id.value.length === 0){
		idP.style.display = "none";
		idYes.style.display = "none";
		idNo.style.display = "none";
     }
    else if(id.value.length < 6) {
	    idP.style.display = "block";
	    idYes.style.display = "none";
	    idNo.style.display = "none";
    }
    else {
        idP.style.display = "none";
        $.ajax({
            type: "get",
            url: "/dango/user/idCheck",
            data: {
            	userId: id.value
            },
            contentType: "application/json; charset=utf-8",
            success: (result) => {
                if(result === "success") {
                	console.log(result);
                    idYes.style.display = "block";
                    idNo.style.display = "none";
                    checkId = true;
                } else {
                    idYes.style.display = "none";
                    idNo.style.display = "block";
                    checkId = false;
                }
            },
            error: () => {
                console.log("error");
            }
        
        })
    }
})

let password = document.getElementById("password");
let passwordP = document.getElementById("password-p");
let checkPw = false;

password.addEventListener("keyup", () => {
    if(password.value.length < 8) {
        passwordP.style.display = "block";
        checkPw = false;
    }
    else {
        passwordP.style.display = "none";
        checkPw = true;
    }
})

let password2 = document.getElementById("password2");
let password2P = document.getElementById("password2-p");

password.addEventListener("keyup", () => {
    if(password.value === password2.value) {
        password2P.style.display = "none";
        checkPw = true;
    }
    else {
        password2P.style.display = "block";
        checkPw = false;
    }
})
password2.addEventListener("keyup", () => {
    if(password.value === password2.value) {
        password2P.style.display = "none";
        checkPw = true;
    }
    else {
        password2P.style.display = "block";
        checkPw = false;
    }
})

const signupForm = document.getElementById("signup-form")

signupForm.addEventListener("submit", (e) => {
    if(!(checkId && checkPw)) {
        e.preventDefault();
    }
})
