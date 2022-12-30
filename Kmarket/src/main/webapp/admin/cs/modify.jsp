<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
<script src="<c:url value='/cs/js/cs.js'/>"></script>
<script>
	$(function () {
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
                <section id="cs-modify" class="admin">
                    <nav>
                    
                    	<c:if test="${cvo.cate1 eq 'notice'}">
	                        <h1>공지사항 수정</h1>
	                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                        </c:if>
                        
                        <c:if test="${cvo.cate1 eq 'faq'}">
	                        <h1>자주묻는질문 수정</h1>
	                        <p>HOME > 고객센터 > <span>자주묻는질문</span></p>
                        </c:if>
                        
                    </nav>
                    
                    <c:if test="${cvo.cate1 eq 'notice'}">
	                    <form action="<c:url value='/admin/cs/modify.do'/>" method="post">
	                    	<input type="hidden" name="no" value="${cvo.csNo}"/>
	                    	<input type="hidden" name="cate1" value="${cvo.cate1}"/>
	                        <table>
	                            <tr>
	                                <td>유형</td>
	                                <td>
	                                    <select name="type" class="type">
	                                    	<option selected>${cvo.type}</option>
	                                    	
	                                    	<c:if test="${cvo.type eq '고객서비스'}">
		                                        <option>안전거래</option>
		                                        <option>위해상품</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '안전거래'}">
		                                        <option>고객서비스</option>
		                                        <option>위해상품</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '위해상품'}">
		                                        <option>고객서비스</option>
		                                        <option>안전거래</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '이벤트당첨'}">
		                                        <option>고객서비스</option>
		                                        <option>안전거래</option>
		                                        <option>위해상품</option>
	                                        </c:if>
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>제목</td>
	                                <td>
	                                    <input type="text" name="title" placeholder="제목을 입력합니다." value="${cvo.title}">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td>
	                                    <textarea name="content" placeholder="내용을 입력하세요.">${cvo.content}</textarea>
	                                </td>
	                            </tr>
	                        </table>
	                        
	                        <a href="javascript:history.back()" class="btnList">취소</a>
	                    	<input type="submit" class="btnWrite" value="등록">
	                    </form>
                    </c:if>
                    
                    <c:if test="${cvo.cate1 eq 'faq'}">
	                    <form action="<c:url value='/admin/cs/modify.do'/>" method="post">
	                    	<input type="hidden" name="no" value="${cvo.csNo}"/>
	                    	<input type="hidden" name="cate1" value="${cvo.cate1}"/>
	                        <table>
	                            <tr>
	                                <td>유형</td>
	                                <td>
	                                    <select name="cate2" class="cate2" required onchange="qnaOption()">
	                                    	
						                        <option selected>${cvo.cate2}</option>
						                        <c:if test="${cvo.cate2 eq '회원'}">
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>주문/결제</option>
							                        <option>배송</option>
							                        <option>취소/반품/교환</option>
							                        <option>여행/숙박/항공</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '쿠폰/혜택/이벤트'}">
							                        <option>회원</option>
							                        <option>주문/결제</option>
							                        <option>배송</option>
							                        <option>취소/반품/교환</option>
							                        <option>여행/숙박/항공</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '주문/결제'}">
							                        <option>회원</option>
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>배송</option>
							                        <option>취소/반품/교환</option>
							                        <option>여행/숙박/항공</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '배송'}">
							                        <option>회원</option>
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>주문/결제</option>
							                        <option>취소/반품/교환</option>
							                        <option>여행/숙박/항공</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '취소/반품/교환'}">
							                        <option>회원</option>
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>주문/결제</option>
							                        <option>배송</option>
							                        <option>여행/숙박/항공</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '여행/숙박/항공'}">
							                        <option>회원</option>
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>주문/결제</option>
							                        <option>배송</option>
							                        <option>취소/반품/교환</option>
							                        <option>안전거래</option>
					                        	</c:if>
					                        	
					                        	<c:if test="${cvo.cate2 eq '안전거래'}">
							                        <option>회원</option>
							                        <option>쿠폰/혜택/이벤트</option>
							                        <option>주문/결제</option>
							                        <option>배송</option>
							                        <option>취소/반품/교환</option>
							                        <option>여행/숙박/항공</option>
					                        	</c:if>
                    					</select>
					                    <select name="type" class="type">
					                        <option selected>${cvo.type}</option>
					                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>제목</td>
	                                <td>
	                                    <input type="text" name="title" placeholder="제목을 입력합니다." value="${cvo.title}">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td>
	                                    <textarea name="content" placeholder="내용을 입력하세요.">${cvo.content}</textarea>
	                                </td>
	                            </tr>
	                        </table>
	                        
	                        <a href="<c:url value='/admin/cs/view.do?no=${cvo.csNo}&cate1=${cvo.cate1}'/>" class="btnList">취소</a>
	                    	<input type="submit" class="btnWrite" value="등록">
	                    </form>
                    </c:if>
                    
                    <c:if test="${cvo.cate1 eq 'qna'}">
	                    <form action="<c:url value='/admin/cs/modify.do'/>" method="post">
	                    	<input type="hidden" name="no" value="${cvo.csNo}"/>
	                    	<input type="hidden" name="cate1" value="${cvo.cate1}"/>
	                        <table>
	                            <tr>
	                                <td>유형</td>
	                                <td>
	                                    <select name="type" class="type">
	                                    	<option selected>${cvo.type}</option>
	                                    	
	                                    	<c:if test="${cvo.type eq '고객서비스'}">
		                                        <option>안전거래</option>
		                                        <option>위해상품</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '안전거래'}">
		                                        <option>고객서비스</option>
		                                        <option>위해상품</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '위해상품'}">
		                                        <option>고객서비스</option>
		                                        <option>안전거래</option>
		                                        <option>이벤트당첨</option>
	                                        </c:if>
	                                        <c:if test="${cvo.type eq '이벤트당첨'}">
		                                        <option>고객서비스</option>
		                                        <option>안전거래</option>
		                                        <option>위해상품</option>
	                                        </c:if>
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>제목</td>
	                                <td>
	                                    <input type="text" name="title" placeholder="제목을 입력합니다." value="${cvo.title}">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td>내용</td>
	                                <td>
	                                    <textarea name="content" placeholder="내용을 입력하세요.">${cvo.content}</textarea>
	                                </td>
	                            </tr>
	                        </table>
	                        
	                        <input type="button" name='cancel' class="btnList" value="취소">
	                    	<input type="submit" class="btnWrite" value="등록">
	                    </form>
                    </c:if>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>