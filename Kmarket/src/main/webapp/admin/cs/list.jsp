<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="../_header.jsp"/>
        
                <section id="cs-list" class="admin">
                
                    <nav>
                        <h1>공지사항 목록</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>

                    <select>
                        <option value="0">유형선택</option>
                        <option value="10">고객서비스</option>
                        <option value="20">안전거래</option>
                        <option value="30">위해상품</option>
                        <option value="40">이벤트당첨</option>
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
					<c:forEach var="vo" items="${cvo}">
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>${vo.csNo}</td>
                            <td>${vo.type}</td>
                            <td><a href="<c:url value='/admin/cs/view.do?no=${vo.csNo}cate1=notice'/>">[${vo.type}]${vo.title}</a></td>
                            <td>${vo.hit}</td>
                            
                            <c:set var="rdate"  value="${vo.rdate}"/>
                            <td>${fn:substring(rdate,2,10)}</td>
                            
                            <td>
                                <a href="#" class="remove">[삭제]</a>
                                <a href="#" class="modify">[수정]</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </table>
                    <input type="button" value="선택삭제">
                    
                    <div class="paging">
                       ${map.pageTag} 
                    </div>

                    <a href="<c:url value='/admin/cs/write.do?cate1=notice'/>">작성하기</a>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>