	// select box 동적추가
function qnaOption(){
	
	let user = ['가입', '탈퇴', '회원정보', '로그인'];
	let event = ['쿠폰/할인/혜택', '포인트', '제휴', '이벤트'];
	let order = ['상품', '결제', '구매내역', '영수증/증빙'];
	let delivery = ['배송상태/기간', '배송정보확인/변경', '해외배송', '당일배송', '해외직구'];
	let cancel = ['반품신청/철회', '반품정보확인/변경', '교환AS신청/철회', '교환정보확인/변경', '취소신청/철회', '취소확인/환불정보'];
	let travel = ['여행/숙박', '항공'];
	let safeDeal = ['서비스 이용규칙 위반', '지식재산권침해', '법령 및 정책위반 상품', '게시물 정책위반', '직거래/외부거래 유도', '표시광고', '청소년 위해상품/이미지'];
	
	// cate2 select > option Value값 받아오기
	let cate2 = $('.cate2').val();
	console.log(cate2);
	
	let cate2sub;	
	
	switch(cate2){
		case '회원':
			cate2sub = user;
			break;
		
		case '쿠폰/혜택/이벤트':
			cate2sub = event;
			break;
			
		case '주문/결제':
			cate2sub = order;
			break;
			
		case '배송':
			cate2sub = delivery;
			break;			
		
		case '취소/반품/교환':
			cate2sub = cancel;
			break;	
			
		case '여행/숙박/항공':
			cate2sub = travel;
			break;	
			
		case '안전거래':
			cate2sub = safeDeal;
			break;
				
	}
	
	// select box 비워주기
	$('.type').empty();
	
	for(let i = 0; i < cate2sub.length; i++){
		let option = $("<option value>"+cate2sub[i]+"</option>");
		$('.type').append(option);
	}
	
	
}
