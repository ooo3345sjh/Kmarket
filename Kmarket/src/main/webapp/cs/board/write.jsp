<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
<script src="<c:url value='/cs/js/cs.js'/>"></script>

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
                            <li class="${cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=user'/>">회원</a></li>
                            <li class="${cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=coupon'/>">쿠폰/이벤트</a></li>
                            <li class="${cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=order'/>">주문/결제</a></li>
                            <li class="${cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=delivery'/>">배송</a></li>
                            <li class="${cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=cancel'/>">취소/반품/교환</a></li>
                            <li class="${cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=travel'/>">여행/숙박/항공</a></li>
                            <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=safeDeal'/>">안전거래</a></li>
                        </ul>
                    </aside>
                    <article>
                    	<nav>
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
                    	</nav>
                        <form action="<c:url value='/cs/board/write.do?cate1=${cate1}&cate2=${cate2}'/>" method="post">
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
                            
                            <a href="<c:url value='/cs/board/list.do?cate1=${cate1}&cate2=${cate2}'/>" class="btnList">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </form>
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>
      