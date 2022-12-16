/**
 * 
 */
 
// 데이터 검증에 사용하는 정규표현식
let reUid = /^[a-z]+[a-z0-9]{5,19}$/g;
let rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
let reName = /^[가-힣]+$/;
let reNick = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let reHp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

// 폼 데이터 검증 결과 상태변수
let isUidOk 	  = false;
let isPassOk 	  = false;
let isNameOk 	  = false;
let isNickOk  	  = false;
let isEmailOk 	  = false;
let isEmailAuthOk = false;
let isHpOk 		  = false;

let blank = document.createTextNode("\u00a0");


$(function(){
	
	// 아이디 검사
	$('input[name=km_uid]').focusout(function(){
		let uid = $('input[name=km_uid]').val();
		
		if(!uid.match(reUid)){
			$('.msgId').css('color', 'red').text('영문, 숫자로 5~19자까지 설정해 주세요.').padStart(5, "0");
			isUidOk = false;
			return;
		}
		
		if(isUidOk){return;}
		
		let jsonData = {"uid":uid};	
		$.ajax({
			url: '/Kmarket/member/uidCheck.do',
			method: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				if(data.result == 0){
					$('.msgId').css('color', 'green').text('사용 가능한 아이디입니다.').padStart(5, "0");
					isUidOk = true;
				} else {
					$('.msgId').css('color', 'red').text('이미 사용중이거나 탈퇴한 아이디입니다.').padStart(5, "0");
					isUidOk = false;
				}
			}
		});	
	});
	
	
	// 비밀번호 검사
	
	
});
