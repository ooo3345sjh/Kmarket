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
                    	<form action="#">
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
		                                <p>
		                                    ${cvo.content} 
		                                </p>
		                            </td>
		                        </tr>
		                        
		                        <%-- 답변 --%>
		                        <tr>
		                        	<td>답변</td>
		                        	<td>
		                        		<textarea name="content" class="content"></textarea>

		                        	<td id="rep">
		                        	
		                        	<c:choose>
		                        	 <c:when test="${cvo.comment eq null}">
		                        	<textarea name="reply" class="reply"></textarea>
		                        	 </c:when>
			                        	 <c:otherwise>
			                        	 	${cvo.comment}
			                        	 </c:otherwise>
		                        	</c:choose>
		                        	</td>
		                        	
		                        </tr>
	                    	</table>
	                    	
	                    	<a href="#" class="remove" data-no="${cvo.csNo}">삭제</a>
		                    <a href="#" id="reply" class="btnWrite">답변등록</a>
		                    <a href="<c:url value='/admin/cs/list.do?cate1=${cate1}'/>" class="btnList">목록</a>
                    	</form>
                    	
                   </c:if>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>