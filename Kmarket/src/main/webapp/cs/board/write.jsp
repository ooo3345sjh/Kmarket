<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
<script src="<c:url value='/cs/js/cs.js'/>"></script>
<script>
	$(function(){
		
		$('select[name=type]').change(function(){
			console.log($('select[name=type] option:selected').text());
		})
	})
</script>
        <section id="cs">
            <div class="qna">
                <nav>
                    <div>
                      <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="write">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="${cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=user'/>">회원</a></li>
                            <li class="${cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=coupon'/>">쿠폰/이벤트</a></li>
                            <li class="${cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=order'/>">주문/결제</a></li>
                            <li class="${cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=delivery'/>">배송</a></li>
                            <li class="${cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=cancel'/>">취소/반품/교환</a></li>
                            <li class="${cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=travel'/>">여행/숙박/항공</a></li>
                            <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/board/write.do?cate1=qna&cate2=safeDeal'/>">안전거래</a></li>
                        </ul>
                    </aside>
                    <article>
                    	<nav>
                    		<h1>회원</h1>
                    		<span>회원 관련 문의내용 입니다.</span>
                    	</nav>
                        <form action="<c:url value='/cs/board/write.do'/>" method="post">
                        <input type="hidden" name="uid" value="iamid">
                            <table>
                                <tr>
                                    <td>문의유형</td>
                                    <td>
                                        <select name="cate2" class="cate2" required onchange="qnaOption()">
                                            <option value="none" disabled selected>1차 선택</option>
                                            <option>회원</option>
                                            <option>쿠폰/혜택/이벤트</option>
                                            <option>주문/결제</option>
                                            <option>배송</option>
                                            <option>취소/반품/교환</option>
                                            <option>여행/숙박/항공</option>
                                            <option>안전거래</option>
                                        </select>
                                        <select name="type" class="type">
                                            <option value="none" disabled selected>2차 선택</option>
                                        </select>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td>문의제목</td>
                                    <td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td><textarea name="content" placeholder="내용을 입력하세요"></textarea></td>
                                </tr>
                            </table>
                        </form>
                        <a href="#" class="btnList">취소하기</a>
                        <a href="<c:url value='/cs/board/list.do?cate1=${cate1}&cate2=${cate2}'/>" class="btnSubmit">등록하기</a>
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>
      