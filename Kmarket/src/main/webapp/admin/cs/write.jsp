<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
<script src="<c:url value='/cs/js/cs.js'/>"></script> <%-- 자주묻는 질문 1,2차 카테고리 --%>
<script>
	$(function () {
		const url = new URL(window.location.href); // URL 객체 생성
		const urlParams = url.searchParams; // URLSearchParams 객체
		cate1 = urlParams.get('cate1') // type value 값을 가져온다.
		
		$('input[name=cancel]').click(function () {
			location.href='/Kmarket/admin/cs/list.do?cate1=' + cate1;
		})
		
		$('form').submit(function (e) {
			let selectVal = $('select[name=type]').val();
			let title = $('input[name=title]').val();
			let content = $('textarea[name=content]').val();
			
			if(selectVal == null){
				alert('유형을 선택해주세요.');
				e.preventDefault();
				return;
			}
			if(title == ''){
				alert('제목을 입력해주세요.');
				e.preventDefault();
				return;
			}
			if(content == ''){
				alert('내용을 입력해주세요.');
				e.preventDefault();
				return;
			}
			
		})
	})
</script>

                <section id="cs-write" class="admin">
                    <nav>
                    	<c:if test="${cate1 eq 'notice'}">
	                        <h1>공지사항 작성</h1>
	                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                        </c:if>
                        
                        <c:if test="${cate1 eq 'faq'}">
	                        <h1>자주묻는질문 작성</h1>
	                        <p>HOME > 고객센터 > <span>자주묻는질문</span></p>
                        </c:if>
                        
                        <c:if test="${cate1 eq 'qna'}">
	                        <h1>문의하기 작성</h1>
	                        <p>HOME > 고객센터 > <span>문의하기</span></p>
                        </c:if>
                    </nav>
                    
                    <%-- 공지사항 글쓰기 --%>
                    <c:if test="${cate1 eq 'notice'}">
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
	                        
	                        <input type="button"  name='cancel' class="btnList" value="취소하기">
	                    	<input type="submit" class="btnWrite" value="등록하기">
	                    </form>
                    </c:if>
                    
                    <%-- 자주묻는 질문 글쓰기 --%>
                    <c:if test="${cate1 eq 'faq'}">
	                    <form action="<c:url value='/admin/cs/write.do?cate1=faq'/>" method="post">
	                    <input type="hidden" name="uid" value="${sessMember.uid}"/>
	                        <table>
	                            <tr>
	                                <td>유형</td>
	                                <td>
	                                    <select name="cate2" class="cate2" required onchange="qnaOption()">
                                            <option value="none" disabled selected>1차 선택</option>
                                            <option value="user">회원</option>
                                            <option value="coupon">쿠폰/혜택/이벤트</option>
                                            <option value="order">주문/결제</option>
                                            <option value="delivery">배송</option>
                                            <option value="cancel">취소/반품/교환</option>
                                            <option value="travel">여행/숙박/항공</option>
                                            <option value="safeDeal">안전거래</option>
                                        </select>
                                        <select name="type" class="type">
                                            <option value="0" disabled selected>2차 선택</option>
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
	                        
	                        <input type="button" name='cancel' class="btnList" value="취소하기">
	                    	<input type="submit" class="btnWrite" value="등록하기">
	                    </form>
                    </c:if>
                    
                    <c:if test="${cate1 eq 'qna'}">
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
	                        
	                        <input type="button" name='cancel' class="btnList" value="취소하기">
	                    	<input type="submit" class="btnWrite" value="등록하기">
	                    </form>
                    </c:if>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>