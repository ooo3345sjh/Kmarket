/**
 * 
 */
 
 $(function(){
	

	
	/** 상품 삭제 **/
	$(document).on('click', '.remove', function(e){
		e.preventDefault();
		console.log('test1');
		let isDeleteOk = confirm("정말 삭제하시겠습니까?");
		
		if(isDeleteOk){
			let prod = $(this).closest('tr');
			let prodNo = $(this).attr('data-no');
			
			$.ajax({
				url: '/Kmarket/admin/productDelete.do',
				type: 'get',
				data: {'prodNo':prodNo},
				dataType: 'json',
				success: function(data){
					if(data.result > 0){
						alert('상품이 삭제되었습니다.');
						prod.hide();
					}
				}
			});
		}
		
	});
	
	
	
	/** 상품 수정 **/
	$(document).on('click', '.modify', function(e){
		
		e.preventDefault();
		let tr  = $(this).parent().parent();
		let td  = tr.children();
		let txt = $(this).text();
		
		let prodName = td.eq(3);
		let price 	 = td.eq(4);
		let discount = td.eq(5);
		let point 	 = td.eq(6);
		let stock 	 = td.eq(7);
		
		let content1 = prodName.text();
		let content2 = price.text();
		let content3 = discount.text();
		let content4 = point.text();
		let content5 = stock.text();
		
		
		if(txt == '[수정]'){
			// 수정모드
			$(this).text('[수정완료]');
			prodName.html('<textarea style="resize:none; width:300px; height:80px;">' + content1 + '</textarea>');
			price.html('<textarea style="resize:none; width:100px; height:20px;">' + content2 + '</textarea>');
			discount.html('<textarea style="resize:none; width:50px; height:20px;">' + content3 + '</textarea>');
			point.html('<textarea style="resize:none; width:50px; height:20px;">' + content4 + '</textarea>');
			stock.html('<textarea style="resize:none; width:50px; height:20px;">' + content5 + '</textarea>');
			prodName.focus();
		} else {
			$(this).text('[수정]');

			let prodNo = $(this).attr('data-no');
			content1 = prodName.children(0).val();
			content2 = price.children(0).val();
			content3 = discount.children(0).val();
			content4 = point.children(0).val();
			content5 = stock.children(0).val();
			
			let jsonData = {
					"prodNo": prodNo,
					"prodName": content1,
					"price": content2,
					"discount": content3,
					"point": content4,
					"stock": content5
			}
			
			$.ajax({
				url: '/Kmarket/admin/productModify.do',
				type: 'post',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result > 0){
						alert('상품 정보가 수정되었습니다.');
					}
				}
			});
			
			prodName.text(content1);
			price.text(content2);
			discount.text(content3);
			point.text(content4);
			stock.text(content5);

		}
		
		
	});
	

	
});


