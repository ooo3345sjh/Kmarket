<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
                <section id="cs-view" class="admin">
                    <nav>
                    	<c:if test="${cvo.cate1 eq 'notice'}">
	                        <h1>공지사항 보기</h1>
	                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                        </c:if>
                        <c:if test="${cvo.cate1 eq 'faq'}">
	                        <h1>자주묻는질문 보기</h1>
	                        <p>HOME > 고객센터 > <span>자주묻는 질문</span></p>
                        </c:if>
                        <c:if test="${cvo.cate1 eq 'qna'}">
	                        <h1>문의사항 답변</h1>
	                        <p>HOME > 고객센터 > <span>문의하기</span></p>
                        </c:if>
                    </nav>
                    
                    <c:if test="${cvo.cate1 eq 'notice'}">
                    	<table>
	                        <tr>
	                            <td>유형</td>
	                            <td class="type">${cvo.type}</td>
	                        </tr>
	                        <tr>
	                            <td>제목</td>
	                            <td class="title">${cvo.title}</td>
	                        </tr>
	                        <tr>
	                            <td>내용</td>
	                            <td class="content">
	                                <p>
	                                    ${cvo.content} 
	                                </p>
	                            </td>
	                        </tr>
	                    </table>
	                    <div>
		                    <a href="#" class="remove" data-no="${cvo.csNo}">삭제</a>
		                    <a href="<c:url value='/admin/cs/modify.do?no=${cvo.csNo}&cate1=${cvo.cate1}'/>" class="btnModify">수정</a>
		                    <a href="<c:url value='/admin/cs/list.do?cate1=${cate1}'/>" class="btnList">목록</a>
		                </div>
                   </c:if>
                        
                   <c:if test="${cvo.cate1 eq 'faq'}">
                        <table>
	                        <tr>
	                            <td>유형</td>
	                            <td class="type">
	                            	${cvo.cate2} - ${cvo.type}
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>제목</td>
	                            <td class="title">${cvo.title}</td>
	                        </tr>
	                        <tr>
	                            <td>내용</td>
	                            <td class="content">
	                                <p>
	                                    ${cvo.content} 
	                                </p>
	                            </td>
	                        </tr>
                    	</table>
	                    <div>
		                    <a href="#" class="remove" data-no="${cvo.csNo}">삭제</a>
		                    <a href="<c:url value='/admin/cs/modify.do?no=${cvo.csNo}&cate1=${cvo.cate1}'/>" class="btnModify">수정</a>
		                    <a href="<c:url value='/admin/cs/list.do?cate1=${cate1}'/>" class="btnList">목록</a>
	                    </div>
                    	</c:if>
                    	
                    	<c:if test="${cvo.cate1 eq 'qna'}">
                    	<form action="<c:url value='/admin/cs/reply.do'/>" id='qnaForm' method="get">
                    		<input type="hidden" name="no" value="${cvo.csNo}"/>
                    		<input type="hidden" name="cate1" value="${cvo.cate1}"/>
                    		
	                        <table class="qna">
		                        <tr>
		                            <td>유형</td>
		                            <td class="type">${cvo.type}</td>
		                        </tr>
		                        <tr>
		                            <td>제목</td>
		                            <td class="title">${cvo.title}</td>
		                        </tr>
		                        <tr>
		                            <td>내용</td>
		                            <td>
		                                <p style="font-size: 15px">
		                                    ${cvo.content} 
		                                </p>
		                            </td>
		                        </tr>
		                        
		                        <%-- 답변 --%>
		                        <tr>
		                        	<td>답변</td>
		                        	<td id='commentTextarea'>
		                        		<c:choose>
		                        			<c:when test="${cvo.comment ne null}">
		                        				<p style="font-size: 15px;">${cvo.comment}</p>
		                        			</c:when>
		                        			<c:otherwise>
				                        		<textarea name="comment" class="comment"></textarea>
		                        			</c:otherwise>
		                        		</c:choose>
		                        	</td>
		                        	
		                        </tr>
	                    	</table>
	                    	
	                    	<a href="#" class="remove" id='qnaRemove' data-no="${cvo.csNo}">삭제</a>
                       		<c:choose>
                       			<c:when test="${cvo.comment ne null}">
				                    <input  type="submit" id="reply" class="btnWrite" value="답변수정">
                       			</c:when>
                       			<c:otherwise>
				                    <input  type="submit" id="reply" class="btnWrite" value="답변등록">
                       			</c:otherwise>
                       		</c:choose>
		                    <a href="<c:url value='/admin/cs/list.do?cate1=${cate1}'/>" id='qnaList' class="btnList">목록</a>
                    	</form>
                    	
                   </c:if>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>