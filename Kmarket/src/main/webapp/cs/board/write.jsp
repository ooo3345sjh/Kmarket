<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
<script src="<c:url value='/cs/js/cs.js'/>"></script>

		<%-- 고객센터는 QNA 만 글 작성함 --%>
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
                            <li class="${cate2 eq 'user' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=user'/>">회원</a></li>
                            <li class="${cate2 eq 'coupon' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=coupon'/>">쿠폰/이벤트</a></li>
                            <li class="${cate2 eq 'order' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=order'/>">주문/결제</a></li>
                            <li class="${cate2 eq 'delivery' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=delivery'/>">배송</a></li>
                            <li class="${cate2 eq 'cancel' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=cancel'/>">취소/반품/교환</a></li>
                            <li class="${cate2 eq 'travel' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=travel'/>">여행/숙박/항공</a></li>
                            <li class="${cate2 eq 'safeDeal' ? 'off':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=safeDeal'/>">안전거래</a></li>
                        </ul>
                    </aside>
                    <article>
                    	<nav>
                    	<h1>문의하기</h1>
                    	<!-- 
                    		<c:if test="${cate2 eq 'user'}">
	                            <h1>회원</h1>
	                            <h2>회원관련 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'coupon'}">
	                            <h1>쿠폰/이벤트</h1>
	                            <h2>쿠폰/이벤트 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'order'}">
	                            <h1>주문/결제</h1>
	                            <h2>주문/결제 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'delivery'}">
	                            <h1>배송</h1>
	                            <h2>배송 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'cancel'}">
	                            <h1>취소/반품/교환</h1>
	                            <h2>취소/반품/교환 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'travel'}">
	                            <h1>여행/숙박/항공</h1>
	                            <h2>여행/숙박/항공 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'safeDeal'}">
	                            <h1>안전거래</h1>
	                            <h2>안전거래 문의 내용입니다.</h2>
                            </c:if>
                             -->
                    	</nav>
                        <form action="<c:url value='/cs/write.do?cate1=${cate1}&pg=1'/>" method="post" id='csForm'>
                        	<input type="hidden" name="uid" value="${sessMember.uid}">
                            <table>
                                <tr>
                                    <td>문의유형</td>
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
                                    <td>문의제목</td>
                                    <td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
                                </tr>
                                <tr>
                                    <td>문의내용</td>
                                    <td><textarea name="content" placeholder="내용을 입력하세요"></textarea></td>
                                </tr>
                            </table>
                            
                            <!--  <a href="<c:url value='/cs/list.do?cate1=${cate1}&cate2=${cate2}'/>" class="btnList">취소하기</a> -->
                            <a href="javascript:history.back()" class="btnList">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </form>
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>
      