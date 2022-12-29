<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
			
			<section id="cs-list" class="admin">
                    <nav>
                        	<h1>공지사항 목록</h1>
                        	<p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
					
                    <select>
                        <option>유형선택</option>
                        <option value="service">고객서비스</option>
                        <option value="safeDeal">안전거래</option>
                        <option value="xproduct">위해상품</option>
                        <option value="great">이벤트당첨</option>
                    </select>
					
                    <table>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>유형</th>
                            <th>제목</th>
                            <th>조회</th>
                            <th>날짜</th>
                            <th>관리</th>
                        </tr>
					<c:forEach var="notice" items="${map.articles}">
                        <tr>
                            <td width="20px"><input type="checkbox"></td>
                            <td width="50px">${notice.csNo}</td>
                            <td width="60px">${notice.type}</td>
                            <td><a href="<c:url value='/admin/cs/view.do?no=${notice.csNo}&cate1=${notice.cate1}'/>">[${notice.type}]${notice.title}</a></td>
                            <td width="30px">${notice.hit}</td>
                            
                            <c:set var="rdate"  value="${notice.rdate}"/>
                            <td width="50px">${fn:substring(rdate,2,10)}</td>
                            
                            <td width="70px">
                                <a href="#" class="remove" data-no="${notice.csNo}">[삭제]</a>
                                <a href="<c:url value='/admin/cs/modify.do?no=${notice.csNo}'/>" class="modify">[수정]</a>
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