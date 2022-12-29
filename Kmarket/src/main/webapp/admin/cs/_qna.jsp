<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="<c:url value='/cs/js/cs.js'/>"></script>
				<section id="cs-list" class="admin">
                    <nav>
                        	<h1>문의하기 목록</h1>
                        	<p>HOME > 고객센터 > <span>문의하기</span></p>
                    </nav>
					
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
					
                    <table class="QNAth">
                        <tr>
                            <th><input type="checkbox" class="all"></th>
                            <th>번호</th>
                            <th>1차유형</th>
                            <th>2차유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                            <th>상태</th>
                        </tr>
                        
					<c:forEach var="qna" items="${qnalist}">
                        <tr>
                            <td><input type="checkbox" name="check" value="${qna.csNo}"></td>
                            <td>${qna.csNo}</td>
                            
                            <%-- 목록) 2차유형 --%>
                           	<c:if test="${qna.cate2 eq 'user'}">
                           		<td>회원</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'coupon'}">
                           		<td>쿠폰/혜택/이벤트</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'order'}">
                           		<td>주문/결제</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'delivery'}">
                           		<td>배송</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'cancel'}">
                           		<td>취소/반품/교환</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'travel'}">
                           		<td>여행/숙박/항공</td>
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'safeDeal'}">
                           		<td>안전거래</td>
                           	</c:if>
                           	
                            <td>${qna.type}</td>
                            
                            <td><a href="<c:url value='/admin/cs/view.do?no=${qna.csNo}&cate1=${qna.cate1}'/>">[${qna.type}]${qna.title}</a></td>
                            <td>${fn:substring(sessMesmber.uid,0,3)}**</td>
                            
                            <c:set var="rdate"  value="${qna.rdate}"/>
                            <td>${fn:substring(rdate,2,10)}</td>
                            <c:if test="">
                            <td class="comfirm">
                               검토중
                            </td>
                            </c:if>
                            
                            <td class="check">
                               답변완료
                            </td>
                         
                        </tr>
                    </c:forEach>
                    </table>
                    <input type="button" value="선택삭제" class="delete">
                    
                    <div class="paging">
                       ${map.pageTag} 
                    </div>
                </section>
            </div>
        </main>
    </div>