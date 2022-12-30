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
                        	<h1>자주묻는 질문 목록</h1>
                        	<p>HOME > 고객센터 > <span>자주묻는 질문</span></p>
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
					
                    <table class="FAQth">
                        <tr>
                            <th><input type="checkbox" name="prodAllCheck"></th>
                            <th>번호</th>
                            <th>1차유형</th>
                            <th>2차유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                    
                    <tbody id=article>
					<c:forEach var="faq1" items="${map.articles}" varStatus="loop">
                        <tr>
                            <td><input type="checkbox" name='prodCheck'></td>
                            <td>
                            	${map.totalCount - map.limitStart - loop.index}
                            	<input type="hidden" name='csNo' value="${faq1.csNo}">
                            </td>
                           	<td width="100px">
                           	<c:if test="${faq1.cate2 eq 'user'}">
                           		회원
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'coupon'}">
                           		쿠폰/혜택/이벤트
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'order'}">
                           		주문/결제
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'delivery'}">
                           		배송
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'cancel'}">
                           		취소/반품/교환
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'travel'}">
                           		여행/숙박/항공
                           	</c:if>
                           	<c:if test="${faq1.cate2 eq 'safeDeal'}">
                           		안전거래
                           	</c:if>
                           	</td>
                           	<td>${faq1.type}</td>
                           
                            <td style="text-align: left;"><a href="<c:url value='/admin/cs/view.do?no=${faq1.csNo}&cate1=${faq1.cate1}'/>">[${faq1.type}]${faq1.title}</a></td>
                            <td>${faq1.hit}</td>
                            
                            <c:set var="rdate"  value="${faq1.rdate}"/>
                            <td>${fn:substring(rdate,2,10)}</td>
                            
                            <td>
                                <a href="#" class="remove" data-no="${faq1.csNo}">[삭제]</a>
                                <a href="<c:url value='/admin/cs/modify.do?no=${faq1.csNo}'/>" class="modify">[수정]</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    </table>
                    <input type="button" name=del value="선택삭제">
                    
                    <div class="paging">
                       ${map.pageTag} 
                    </div>
                    <a href="<c:url value='/admin/cs/write.do?cate1=${cate1}'/>" class="btnWrite">작성하기</a>
                </section>
            </div>
        </main>
    </div>