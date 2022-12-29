<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="<c:url value='/cs/js/cs.js'/>"></script>
				<section id="cs-list" class="admin">
                    <nav>
                        	<h1>자주묻는 질문 목록</h1>
                        	<p>HOME > 고객센터 > <span>자주묻는 질문</span></p>
                    </nav>
					
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
					
                    <table class="FAQth">
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>1차유형</th>
                            <th>2차유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
                    
					<c:forEach var="faq1" items="${faq}">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>${faq1.csNo}</td>
                           	<td>${faq1.cate2}</td>
                           	<td>${faq1.type}</td>
                           
                            <td><a href="<c:url value='/admin/cs/view.do?no=${faq1.csNo}&cate1=${faq1.cate1}'/>">[${faq1.type}]${faq1.title}</a></td>
                            <td>${faq1.hit}</td>
                            
                            <c:set var="rdate"  value="${faq1.rdate}"/>
                            <td>${fn:substring(rdate,2,10)}</td>
                            
                            <td>
                                <a href="#" class="remove" data-no="${faq1.csNo}">[삭제]</a>
                                <a href="<c:url value='/admin/cs/modify.do?no=${faq1.csNo}'/>" class="modify">[수정]</a>
                            </td>
                        </tr>
                    </c:forEach>
                    
                    </table>
                    <input type="button" value="선택삭제">
                    
                    <div class="paging">
                       ${map.pageTag} 
                    </div>
                    <a href="<c:url value='/admin/cs/write.do?cate1=${cate1}'/>" class="btnWrite">작성하기</a>
                </section>
            </div>
        </main>
    </div>