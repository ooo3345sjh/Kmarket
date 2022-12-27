/**
 * 
 */
 
 // 데이터 검증에 사용하는 정규표현식
let reUid = /^[a-z]+[a-z0-9]{5,19}$/g;
let rePass = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
let reName = /^[가-힣]+$/;
let reHp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

// 폼 데이터 검증 결과 상태변수
let isUidOk 	  = false;
let isPassOk 	  = false;
let isNameOk 	  = false;
let isHpOk		  = false;

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
					isUidOk = true;
					$('.msgId').css('color', 'green').text('사용 가능한 아이디입니다.').padStart(5, "0");
				} else {
					isUidOk = false;
					$('.msgId').css('color', 'red').text('이미 사용중이거나 탈퇴한 아이디입니다.').padStart(5, "0");
				}
			}
		});	
	});
	
	
	// 비밀번호 검사
	$('input[name=km_pass1]').focusout(function(){
		let pass1 = $('input[name=km_pass1]').val();
		
		if(pass1.match(rePass)){
			$('.msgPass1').css('color', 'green').text('사용할 수 있는 비밀번호입니다.');
			
			$('input[name=km_pass2]').focusout(function(){
				let pass2 = $('input[name=km_pass2]').val();
				
				if(pass1 == pass2){
					isPassOk = true;
					$('.msgPass2').css('color', 'green').text('비밀번호가 일치합니다.');
				} else {
					isPassOk = false;
					$('.msgPass2').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
				}
				
			});
			
		} else {
			isPassOk = false;
			$('.msgPass1').css('color', 'red').text('숫자, 영문, 특수문자를 포함하여 8자리 이상이어야 합니다.');
			$('input[name=km_pass2]').val('');
			$('.msgPass2').css('color', 'black').text('비밀번호 재입력');
		}
	});
	
	// 담당자 이름 검사
	$('input[name=km_name]').focusout(function(){
		
		let name = $(this).val();
		
		if(name.match(reName)){
			isNameOk = true;
			$('.msgName').css('color', 'green').text('');
		} else {
			isNameOk = false;
			$('.msgName').css('color', 'red').text('유효하지 않는 이름입니다.');
		}
	});
	
	// 담당자 휴대폰 검사
	$('input[name=km_hp]').focusout(function(){
		
		let hp = $(this).val();
		
		if(hp.match(reHp)){
			isHpOk = true;
			$('.msgHp').css('color', 'green').text('');
		} else {
			isHpOk = false;
			$('.msgHp').css('color', 'red').text('유효하지 않는 휴대폰 번호입니다.');
		}
	});
	
	
	// 최종 폼 전송 전 검증
	$('.register > form').submit(function(){
		
		// 아이디 검증
		if(!isUidOk){
			alert('아이디가 유효하지 않습니다.');
			return false;
		} if(!isPassOk){
			alert('비밀번호가 유효하지 않습니다.');
			return false;
		} if(!isNameOk){
			alert('유효한 담당자명을 입력해주세요.');
			return false;
		} if(!isHpOk){
			alert('유효한 휴대폰 번호를 입력해주세요.');
			return false;
		}
		return true;

	});
	
	
});