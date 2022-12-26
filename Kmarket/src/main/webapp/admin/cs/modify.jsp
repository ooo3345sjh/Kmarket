<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../_header.jsp"/>
<script src="<c:url value='/admin/js/csArticle.js'/>"></script>
                <section id="cs-modify" class="admin">
                    <nav>
                        <h1>공지사항 수정</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
                    <form action="<c:url value='/admin/cs/modify.do'/>" method="post">
                    	<input type="hidden" name="no" value="${cvo.csNo}"/>
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="type" class="type">
                                    	<option selected>${cvo.type}</option>
                                    	
                                    	<c:if test="${cvo.type eq '고객서비스'}">
	                                        <option>안전거래</option>
	                                        <option>위해상품</option>
	                                        <option>이벤트당첨</option>
                                        </c:if>
                                        <c:if test="${cvo.type eq '안전거래'}">
	                                        <option>고객서비스</option>
	                                        <option>위해상품</option>
	                                        <option>이벤트당첨</option>
                                        </c:if>
                                        <c:if test="${cvo.type eq '위해상품'}">
	                                        <option>고객서비스</option>
	                                        <option>안전거래</option>
	                                        <option>이벤트당첨</option>
                                        </c:if>
                                        <c:if test="${cvo.type eq '이벤트당첨'}">
	                                        <option>고객서비스</option>
	                                        <option>안전거래</option>
	                                        <option>위해상품</option>
                                        </c:if>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td>
                                    <input type="text" name="title" placeholder="제목을 입력합니다." value="${cvo.title}">
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content" placeholder="내용을 입력하세요.">${cvo.content}</textarea>
                                </td>
                            </tr>
                        </table>
                        
                        <input type="button" class="btnList" value="취소">
                    	<input type="submit" class="btnWrite" value="등록">
                    </form>
                    
                    
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>