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
					if(data.result > 0){
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
					if(data.result > 0){
						alert('게시글이 삭제되었습니다.');
					}
				}
			});
			
			location.reload();
		}
		
	});
	
	$('#cs-view > form').submit(function(e){
		e.preventDefault();
		
		let no	 = $(this).children('input[name=no]').val();
		let type = $(this).children('input[name=type]').val();
		let title = $(this).children('input[name=title]').val();
		let content = $(this).children('input[name=content]').val();
		let textarea = $('textarea[name=reply]');
		let reply = textarea.val();
		let uid = $(this).children('input[name=uid]').val();
		
		let jsonData = {
			"no":no,
			"type":type,
			"title":title,
			"content":content,
			"reply":reply,
			"uid":uid
		}
		
		$.ajax({
			url:'/Kmarket/admin/cs/reply.do',
			method:'post',
			data:jsonData,
			dataType:'json',
			success: function(data){
				console.log(data);
				
				if(data.result > 0){
					
					let reply =  "<table>"
						reply += "<tr>"
						reply += "<td>유형</td>"
						reply += "<td class=type>"+data.type+"</td>"
						reply += "</tr>"
						reply += "<tr>"
						reply += "<td>제목</td>"
						reply += "<td class=title>"+data.title+"</td>"
						reply += "</tr>"
						reply += "<tr>"
						reply += "<td>내용</td>"
						reply += "<td><p>"+data.content+"</p></td>"
						reply += "</tr>"
						reply += "<tr>"
						reply += "<td>답변</td>"
						reply += "<td><textarea name='content' class='content'>"+data.reply+"</textarea></td>"
						reply += "</tr>"
						reply += "</table>"
					
						$('.qna').append(reply);
						textarea.val('');
				}
				
			}
			
		})
	})
})

