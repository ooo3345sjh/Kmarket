<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
<script>
	$(function(){
		
		$('select[name=type]').change(function(){
			
			
			$.ajax({
				url:'/Kmarket/admin/cs/write.do',
				method:'get',
				data: "cate2":$(this).val(),
				dataType:'json',
				success: function(data){
					
				}
			})
			
		})
		
	})
</script>
                <section id="cs-write" class="admin">
                    <nav>
                        <h1>공지사항 작성</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
                    <form action="<c:url value='/admin/cs/write.do?cate1=${cate1}'/>" method="post">
                    <input type="hidden" name="uid" value="${sessMember.uid}"/>
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="type" required>
                                        <option value="none" disabled selected>유형선택</option>
                                        <option>고객서비스</option>
                                        <option>안전거래</option>
                                        <option>위해상품</option>
                                        <option>이벤트당첨</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td>
                                    <input type="text" name="title" placeholder="제목을 입력합니다.">
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content" placeholder="내용을 입력하세요."></textarea>
                                </td>
                            </tr>
                        </table>
                        
                        <input type="button" class="btnList" value="취소">
                    	<input type="submit" class="btnWrite" value="등록">
                    </form>
                    
                    
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>