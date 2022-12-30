/**
 * 
 */
 

 
 $(function(){
		const url = new URL(window.location.href); // URL 객체 생성
		const urlParams = url.searchParams; // URLSearchParams 객체
		cate1 = urlParams.get('cate1') // type value 값을 가져온다.
	
	$('select[name=type]').change(function(){
			console.log($('select[name=type] option:selected').text());
	})
	 let pathname = window.location.pathname;
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
						if(pathname.includes('list.do')){
							article.hide();
						} else {
							location.href = '/Kmarket/admin/cs/list.do?cate1=' + cate1;
						}
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
	$(document).on('submit','#qnaForm',function(e){
		
		e.preventDefault();
		
		if($('#reply').val() == '답변수정'){
			$('#reply').val('답변등록');
			$('#commentTextarea').html("<textarea name='comment' class='comment'>" + $('#commentTextarea > p').text() + "</textarea>");
			return;
				
		} 
		
		
		let no	 = $('input[name=no]').val(); // 글 번호
		let comment = $('textarea[name=comment]');
		let reply = comment.val();
		console.log(reply);
		if(reply == ''){
			alert('답변 내용을 입력해주세요.');
			return;
		}
		let jsonData = {
			"no":no,
			"comment":reply,
		}
		
		$.ajax({
			url:'/Kmarket/admin/cs/reply.do',
			method:'POST',
			data:jsonData,
			dataType:'json',
			success: function(data){
				console.log(data);

				if(data.result > 0){
						
					$('#commentTextarea').html("<p style='font-size: 15px;'>" + reply + "</p>");
					$('#reply').val('답변수정');
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

