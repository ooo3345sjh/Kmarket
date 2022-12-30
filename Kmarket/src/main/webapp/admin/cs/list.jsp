<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
<script type="text/javascript">
	$(function () {
		
		const url = new URL(window.location.href); // URL 객체 생성
		const urlParams = url.searchParams; // URLSearchParams 객체
		cate1 = urlParams.get('cate1') // cate1 value 값을 가져온다.
		
		$('select[name=noticeType]').change(function () {
			let selectVal = $('select[name=noticeType]').val();
			
			location.href='/Kmarket/admin/cs/list.do?cate1=notice&cate2=' + selectVal;
		})
		
		$(document).on('change', 'select[name=type]', function () {
			let cate2 = $('select[name=cate2]').val();
			let type = $('select[name=type]').val();
			
			location.href='/Kmarket/admin/cs/list.do?cate1=' + cate1 + '&cate2=' + cate2 + '&type=' + type;
		})
		
		// 선택된 상품 제거하는 AJAX
		let contextRoot = '${request.getContextPath()}';
		$('input[name=del]').click(function () {
			
			if(!confirm('정말 삭제 하시겠습니까?')) return;
			
			let trTag = $('#article > tr');
			let checkbox = $("input[name=prodCheck]");
			let articleArr = [];
			console.log(trTag);
			console.log(checkbox);
			for(let i=0; i<checkbox.length; i++){
				if(checkbox[i].checked){
					trTag[i].remove(); // 선택 게시글 제거
					
					// 더 이상 제거할 게시글이 없으면
					if($('#article > tr').length == 0){
						let empty = "<tr class='empty'>"
                        		  + "<td colspan='7'>게시글이 없습니다.</td>"
                    			  + "</tr>";
                    	$('#article').append(empty);
					}
					
					// 제거할 상품의 csNo를 배열에 저장
					articleArr.push(trTag[i].children[1].children[0].defaultValue);
				
				}
			}
			if(articleArr.length != 0){
				$.ajax({
					url: contextRoot + '/admin/cs/delete.do',
					type: "get",
					traditional: true,	// ajax 배열 넘기기 옵션!
					data: {"articleArr" : articleArr},
					dataType: "json",
					success: function (data) {
						console.log(data);
						location.reload();
						
					}
				});
			} else {
				alert('선택하신 게시글이 없습니다.');
			}
		});
		
		$('input[name=prodAllCheck]').click(function () {
			let isChecked = $('input[name=prodAllCheck]').is(':checked');
			
			if(isChecked){
				$('input[name=prodCheck]').prop("checked", true); 
			} else {
				$('input[name=prodCheck]').prop("checked", false); 
			}
		})
		
		
	})
</script>
<jsp:include page="./_${cate1}.jsp"/>

                

<jsp:include page="../_footer.jsp"/>