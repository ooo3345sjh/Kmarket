/**
 * 
 */
 $(function(){
	$('form').submit(function(){
		
		let cate1 = $('.category1').val();
		let cate2 = $('.category2').val();
		console.log(cate1);
		console.log(cate2);
		
		$.ajax({
			type:'GET',
			url: '/Kmarket/admin/category.do',
			data: {'cate1':cate1, 'cate2':cate2},
			dataType: 'json'
		});
	});
	
});