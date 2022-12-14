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
					$('.msgId').css('color', 'green').text('사용 가능한 아이디입니다.');
				} else {
					isUidOk = false;
					$('.msgId').css('color', 'red').text('이미 사용중이거나 탈퇴한 아이디입니다.');				}
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
	
	
	// 이름 검사
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
	
	
	// 이메일 검사
	$('input[name=km_email]').focusout(function(){
		
		let email = $(this).val();
		
		if(email.match(reEmail)){
			let emailCode = 0;
			isEmailOk = true;
			
			$('#btnCode').click(function(){
				
				let email = $('input[name=km_email]').val();
				$('.msgEmail').css('color', 'black').text('잠시만 기다려주세요.');
				
				$.ajax({
					url: '/Kmarket/member/emailAuth.do',
					method: 'get',
					data: {"email":email},
					dataType: 'json',
					success: function(data){
						if(data.status == 1){
							emailCode = data.code;
							$('.msgEmail').text('인증코드를 전송했습니다.');
							$('.auth').show();
						} else {
							$('msgEmail').text('이메일 전송을 실패했습니다. 이메일을 확인 후 다시 시도하시길 바랍니다.');
						}
					}
				});
				
			});
			
			$('#btnConfirm').click(function(){
				
				let code = $('input[name=km_code]').val();
				
				if(code == emailCode){
					isEmailAuthOk = true;
					alert('이메일이 인증되었습니다.');
					document.getElementById('code').readOnly = true;
				} else {
					alert('인증번호를 확인해주세요.');
				}
				
			});
			
		} else {
			isEmailOk = false;
			$('.msgEmail').css('color', 'red').text('유효하지 않는 이메일입니다.');
		}
		
	})
	
	
	// 휴대폰 검사
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
			alert('유효한 이름을 입력해주세요.');
			return false;
		} if(!isEmailOk){
			alert('유효한 이메일을 입력해주세요.');
			return false;
		} if(!isEmailAuthOk){
			alert('이메일을 인증해주세요.');
			return false;
		} if(!isHpOk){
			alert('유효한 휴대폰 번호를 입력해주세요.');
			return false;
		}
		return true;

	});
	
});
