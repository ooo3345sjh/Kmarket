/**
 * 
 */
 

 
 $(function(){
	
	$('select[name=type]').change(function(){
			console.log($('select[name=type] option:selected').text());
	})
	
	// 리스트에서 삭제 버튼
	$(document).on('click', '.remove', function(e){
		e.preventDefault();
		
		console.log('test1');
		let isDeleteOk = confirm("정말 삭제하시겠습니까?");
		
		if(isDeleteOk){
			let article = $(this).closest('tr');
			let no = $(this).attr('data-no');
			
			$.ajax({
				url: '/Kmarket/admin/cs/delete.do',
				type: 'get',
				data: {'no':no},
				dataType: 'json',
				success: function(data){
					if(data.rs > 0){
						alert('게시글이 삭제되었습니다.');
						article.hide();
					}
				}
			});
		}
		
	});
	
	// view에서 삭제버튼
	$(document).on('click', '.remove', function(e){
		e.preventDefault();
		
		if(isDeleteOk){
			let no = $(this).attr('data-no');
			
			$.ajax({
				url: '/Kmarket/admin/cs/delete.do',
				type: 'get',
				data: {'no':no},
				dataType: 'json',
				success: function(data){
					if(data.rs > 0){
						alert('게시글이 삭제되었습니다.');
					}
				}
			});
			
		}
		
	});
	
	// 문의글 답변 
	$(document).on('submit','#cs-view > form',function(e){
		
		e.preventDefault();
		
		let no	 = $(this).children('input[name=no]').val(); // 글 번호
		let content = $(this).children('input[name=content]').val(); // 내용
		let textarea = $('textarea[name=reply]');
		let reply = textarea.val();
		
		let jsonData = {
			"no":no,
			"content":content,
		}
		
		$.ajax({
			url:'/Kmarket/admin/cs/reply.do',
			method:'post',
			data:jsonData,
			dataType:'json',
			success: function(data){
				

				if(data.result > 0){
					let	reply  =  data.reply;
						
						$('.reply').remove();
						$('#rep').append(reply);
				}
			}
		})
	})
	// 상단 전체 체크박스 클릭시
	$('.all').click(function(){
		if($(this).is(':checked')){

			$('input[name=check]').prop('checked', true);
		}else{
			$('input[name=check]').prop('checked', false);
		}
	});
	
	// 체크박스 갯수
	$('input[name=check]').click(function(){
		
		let total = $('input[name=check]').length;
		let cnt = $('input[name=check]:checked').length;
		
		if(total != cnt){
			$('.all').prop('checked', false)
		}else{
			$('.all').prop('checked', true)
		}
	})
	
	/*** 게시글 선택삭제 ****/
	$(document).on('click', '.delete', function(){
		let url = '/Kmarket/admin/cs/delete.do';
		let valueArr = new Array();
		let list = $('input[name=check]');
		
		for(let i = 0; i<list.length; i++){
			if(list[i].checked){
				valueArr.push(list[i].value);
			}
		}
		console.log(valueArr);
		
		if(valueArr.length === 0){
			alert('삭제할 게시글이 없습니다.');
		}else{
			
			confirm('정말 삭제하시겠습니까?');
			
			$.ajax({
				url:url,
				method:'get',
				traditional: true,
				data: {valueArr : valueArr},
				dataType: 'json',
				success: function(data){
					
						alert('게시글 삭제가 성공적으로 완료되었습니다.');
						location.reload();
				}
			})
		}
	})
	
	// 공지사항 검색
	$('select[name=noticeType]').change(function(){

		let noticeType = ($('select[name=noticeType] > option:selected').text());
		
		
		
		
		
	})
	
	
})

