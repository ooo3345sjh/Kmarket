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
                    
                    <table>
                    
                    	<c:if test="${cvo.cate1 eq 'notice'}">
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
                        </c:if>
                        
                        <c:if test="${cvo.cate1 eq 'faq'}">
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
                        </c:if>
                        
                        <c:if test="${cvo.cate1 eq 'qna'}">
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
                        </c:if>
                    </table>
                    <div>
	                    <a href="#" class="remove" data-no="${cvo.csNo}">삭제</a>
	                    <a href="<c:url value='/admin/cs/modify.do?no=${cvo.csNo}&cate1=${cvo.cate1}'/>" class="btnModify">수정</a>
	                    <a href="<c:url value='/admin/cs/list.do?cate1=${cate1}'/>" class="btnList">목록</a>
                    </div>
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>