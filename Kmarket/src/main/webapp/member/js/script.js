/**
 *
 */
 
// 일반 회원가입 처리
function checkGeneral() {

	let agree1 = $('input[name=agree1]').is(':checked');
	let agree2 = $('input[name=agree2]').is(':checked');
	let agree3 = $('input[name=agree3]').is(':checked');
	
	if(agree1 && agree2 && agree3){
		window.location.replace('/Kmarket/member/register.do');
	} else {
		alert('동의체크를 하셔야합니다.');
		return false;
	}
}

// 판매자 회원가입 처리
function checkSeller() {

	let agree1 = $('input[name=agree1]').is(':checked');
	let agree2 = $('input[name=agree2]').is(':checked');
	let agree3 = $('input[name=agree3]').is(':checked');
	
	if(agree1 && agree2 && agree3){
		window.location.replace('/Kmarket/member/registerSeller.do');
	} else {
		alert('동의체크를 하셔야합니다.');
		return false;
	}
}
