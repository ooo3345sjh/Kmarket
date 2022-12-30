<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="<c:url value='/cs/js/cs.js'/>"></script>
<script>
	$(document).ready(function () {
		qnaOption();
	})
</script>
				<section id="cs-list" class="admin">
                    <nav>
                        	<h1>문의하기 목록</h1>
                        	<p>HOME > 고객센터 > <span>문의하기</span></p>
                    </nav>
					
                    <select name="cate2" class="cate2" required onchange="qnaOption()">
                        <option value="none" disabled selected>1차 선택</option>
                        <option value="user" ${cate2 eq 'user' ? 'selected':''}>회원</option>
                        <option value="coupon" ${cate2 eq 'coupon' ? 'selected':''}>쿠폰/혜택/이벤트</option>
                        <option value="order" ${cate2 eq 'order' ? 'selected':''}>주문/결제</option>
                        <option value="delivery" ${cate2 eq 'delivery' ? 'selected':''}>배송</option>
                        <option value="cancel" ${cate2 eq 'cancel' ? 'selected':''}>취소/반품/교환</option>
                        <option value="travel" ${cate2 eq 'travel' ? 'selected':''}>여행/숙박/항공</option>
                        <option value="safeDeal" ${cate2 eq 'safeDeal' ? 'selected':''}>안전거래</option>
                    </select>
                    <select name="type" class="type">
                        <option value="0" disabled selected>2차 선택</option>
                    </select>
					
                    <table class="QNAth">
                        <tr>
                            <th><input type="checkbox" name="prodAllCheck"></th>
                            <th>번호</th>
                            <th>1차유형</th>
                            <th>2차유형</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                            <th>상태</th>
                        </tr>
                        <tbody id='article'>
					<c:forEach var="qna" items="${map.articles}" varStatus="loop">
                        <tr>
                            <td><input type="checkbox" name="prodCheck"></td>
                            <td width="40px">
	                            <input type="hidden" name='csNo' value="${qna.csNo}">
                            	${map.totalCount - map.limitStart - loop.index}
                            </td>
                            
                            <%-- 목록) 2차유형 --%>
                            <td width="100px">
                           	<c:if test="${qna.cate2 eq 'user'}">
                           		회원
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'coupon'}">
                           		쿠폰/혜택/이벤트
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'order'}">
                           		주문/결제
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'delivery'}">
                           		배송
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'cancel'}">
                           		취소/반품/교환
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'travel'}">
                           		여행/숙박/항공
                           	</c:if>
                           	<c:if test="${qna.cate2 eq 'safeDeal'}">
                           		안전거래
                           	</c:if>
                           	</td>
                            <td>${qna.type}</td>
                            
                            <td style='text-align: left;'><a href="<c:url value='/admin/cs/view.do?no=${qna.csNo}&cate1=${qna.cate1}'/>">[${qna.type}]${qna.title}</a></td>
                            <td width="60px">${fn:substring(sessMember.uid,0,3)}**</td>
                            
                            <c:set var="rdate"  value="${qna.rdate}"/>
                            <td width="60px">${fn:substring(rdate,2,10)}</td>
                            
                            <c:choose>
                            	<c:when test="${qna.comment eq null }">
		                            <td class="comfirm" width="50px">
		                               검토중
		                            </td>
                            	</c:when>
                            	<c:otherwise>
		                            <td class="check" width="50px">
		                               답변완료
		                            </td>
                            	</c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                    <input type="button" name='del' value="선택삭제">
                    
                    <div class="paging">
                       ${map.pageTag} 
                    </div>
                </section>
            </div>
        </main>
    </div>