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
		
		// 
		
		
		if(txt == '[수정]'){
			// 수정모드
			$(this).text('[수정완료]');
			prodName.html('<input id="prodName" value=' + content1 + ' style="width:300px; height:80px;">');
			price.html('<input id="price" value=' + content2 + ' style="width:100px; height:80px;">');
			discount.html('<input id="discount" value=' + content3 + ' style="width:50px; height:80px;">');
			point.html('<input id="point" value=' + content4 + ' style="width:50px; height:80px;">');
			stock.html('<input id="stock" value=' + content5 + ' style="width:50px; height:80px;">');
			prodName.focus();
			
		} else {
			// 수정완료
			$(this).text('[수정]');
			prodName.html(cont1);
			price.html(cont2);
			discount.html(cont3);
			point.html(cont4);
			stock.html(cont5);
			
			let prodNo = $(this).attr('data-no');
			content1 = prodName.text();
			content2 = price.text();
			content3 = discount.text();
			content4 = point.text();
			content5 = stock.text();
			
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
			
		}
		
		
	});
	

	
});


