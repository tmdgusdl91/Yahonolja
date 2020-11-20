function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; //올바른 포맷 형식
    return false;
}

// 내용의 값의 빈공백을 trim(앞/뒤)
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
};

function sendIt() {
    f = document.myForm;
		 
 		if(!f.userId.value){
 			alert("아이디를 입력해주세요 ");
 			f.userId.focus();
 			return;
 		}
 		
 		if(!f.userPw1.value){
 			alert("비밀번호를 입력해주세요 ");
 			f.userPw1.focus();
 			return;
 		}else if(!f.userPw2.value){
 			alert("비밀번호를 입력해주세요 ");
 			f.userPw2.focus();
 			return;
 		}else{
 			if(f.userPw2.value!=f.userPw1.value){
 				alert("비밀번호가 서로 같지않습니다.");
 				f.userPwd1.focus();
 				return;
 			}
 		}
 		if(f.userBm.value==0) {
 			alert("월을 선택해주세요.");
 			f.userBm.focus();
 			return;
 		}
 		var day = f.userBd.value;
 /*		if(day<startDay||day>lastDay){
 			alert("일이 잘못되었습니다.");
 			f.userDay.value=0;
 			f.userDay.focus();
 			return;
 		}*/
		if(day>31||day<0){
			alert("일이 잘못되었습니다.");
 			f.userBd.value=0;
 			f.userBd.focus();
 			return;
		}

		str = f.userEmail.value;
		str = str.trim();
	    if(!str) {
	        alert("\nE-Mail을 입력하세요. ");
	        f.userEmail.focus();
	        return;
	    }
		if(!isValidEmail(f.userEmail.value)) {
	        alert("\n정상적인 E-Mail을 입력하세요. ");
	        f.userEmail.focus();
	        return;
		}
		f.userEmail.value = str;


 		if(!f.userPhone.value){
 			alert("전화번호를 입력해주세요");
 			f.userPhone.focus();
 			return;
 		}
		alert("왔다 !");
	    f.submit();
}