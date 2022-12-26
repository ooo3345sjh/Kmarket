/**
 * 
 */
 
 $(function(){
	
	$('select[name=type]').change(function(){
			 console.log($('select[name=type] option:selected').text());
	})
	
	
	$(document).on('click', '.remove', function(e){
		e.preventDefault();
		
		console.log('test1');
		let isDeleteOk = confirm("정말 삭제하시겠습니까?");
		
		if(isDeleteOk){
			let article = $(this).closest('tr');
			let csNo = $(this).attr('data-no');
			
			$.ajax({
				url: '/Kmarket/admin/cs/delete.do',
				type: 'get',
				data: {'csNo':csNo},
				dataType: 'json',
				success: function(data){
					if(data.result > 0){
						alert('게시글이 삭제되었습니다.');
						article.hide();
					}
				}
			});
		}
		
	});
})

