

$(function(){
		// 
		$('select[name=type]').change(function(){
			console.log($('select[name=type] option:selected').text());
		})
		
		$('#csForm').submit(function(e){
			let cate2 = $('select[name=cate2]').val();
			let type = $('select[name=type]').val();
			let title = $('input[name=title]').val();
			let content = $('textarea[name=content]').val();
			
			if(cate2 == null){
				alert('1차 선택 문의 유형을 선택해주세요.');
				e.preventDefault();
				return;
			}
			
			if(type == null){
				alert('2차 선택 유형을 선택해주세요.');
				e.preventDefault();
				return;
			}
			
			if(title == ''){
				alert('문의 제목을 입력해주세요.');
				e.preventDefault();
				return;
			}
			
			if(content == ''){
				alert('문의 내용을 입력해주세요.');
				e.preventDefault();
				return;
			}
			
			
		});
})
	// select box 동적추가
function qnaOption(){
	
	let user	 = ['가입', '탈퇴', '회원정보', '로그인'];
	let event	 = ['쿠폰/할인/혜택', '포인트', '제휴', '이벤트'];
	let order	 = ['상품', '결제', '구매내역', '영수증/증빙'];
	let delivery = ['배송상태/기간', '배송정보확인/변경', '해외배송', '당일배송', '해외직구'];
	let cancel	 = ['반품신청/철회', '반품정보확인/변경', '교환AS신청/철회', '교환정보확인/변경', '취소신청/철회', '취소확인/환불정보'];
	let travel	 = ['여행/숙박', '항공'];
	let safeDeal = ['서비스 이용규칙 위반', '지식재산권침해', '법령 및 정책위반 상품', '게시물 정책위반', '직거래/외부거래 유도', '표시광고', '청소년 위해상품/이미지'];
	
	// cate2 select > option Value값 받아오기
	let cate2 = $('.cate2').val();
	
	let type;	
	
	console.log(cate2)
	switch(cate2){
		case 'user':
			type = user;
			break;
		
		case 'coupon':
			type = event;
			break;
			
		case 'order':
			type = order;
			break;
			
		case 'delivery':
			type = delivery;
			break;			
		
		case 'cancel':
			type = cancel;
			break;	
			
		case 'travel':
			type = travel;
			break;	
			
		case 'safeDeal':
			type = safeDeal;
			break;
				
	}
	// select box 비워주기
	$('.type').empty();
	$('.type').append("<option value='none' disabled selected>2차 선택</option>");
	
	for(let i = 0; i < type.length; i++){
		let option = $("<option>"+type[i]+"</option>");
		$('.type').append(option);
	}
	
}

