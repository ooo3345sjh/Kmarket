<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./_header.jsp"/>

                <section id="admin-index" class="admin">
                    <nav>
                        <h1>관리자 메인</h1>
                        <p>HOME > <span>메인</span></p>
                    </nav>
                    <section>
                        <table border="0">
                            <caption>쇼핑몰 운영현황</caption>
                            <tr>
                                <th>
                                    <p>주문건수(건)</p> 
                                    <strong>131</strong>
                                </th>
                                <th>
                                    <p>주문금액(원)</p>
                                    <strong>1,130</strong>
                                </th>
                                <th>
                                    <p>회원가입(명)</p>
                                    <strong>1014</strong>
                                </th>
                                <th>
                                    <p>쇼핑몰 방문(명)</p>
                                    <strong>1014</strong>
                                </th>
                                <th>
                                    <p>신규 게시물(건)</p>
                                    <strong>100</strong>
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <span>PC</span>
                                        <span>60</span>
                                    </p>
                                    <p>
                                        <span>Mobile</span>
                                        <span>71</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>PC</span>
                                        <span>60</span>
                                    </p>
                                    <p>
                                        <span>Mobile</span>
                                        <span>71</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>PC</span>
                                        <span>60</span>
                                    </p>
                                    <p>
                                        <span>Mobile</span>
                                        <span>71</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>PC</span>
                                        <span>60</span>
                                    </p>
                                    <p>
                                        <span>Mobile</span>
                                        <span>71</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>PC</span>
                                        <span>60</span>
                                    </p>
                                    <p>
                                        <span>Mobile</span>
                                        <span>71</span>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        <span>어제</span>
                                        <span>4</span>
                                    </p>
                                    <p>
                                        <span>주간</span>
                                        <span>10</span>
                                    </p>
                                    <p>
                                        <span>월간</span>
                                        <span>30</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>어제</span>
                                        <span>4</span>
                                    </p>
                                    <p>
                                        <span>주간</span>
                                        <span>10</span>
                                    </p>
                                    <p>
                                        <span>월간</span>
                                        <span>30</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>어제</span>
                                        <span>4</span>
                                    </p>
                                    <p>
                                        <span>주간</span>
                                        <span>10</span>
                                    </p>
                                    <p>
                                        <span>월간</span>
                                        <span>30</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>어제</span>
                                        <span>4</span>
                                    </p>
                                    <p>
                                        <span>주간</span>
                                        <span>10</span>
                                    </p>
                                    <p>
                                        <span>월간</span>
                                        <span>30</span>
                                    </p>
                                </td>
                                <td>
                                    <p>
                                        <span>어제</span>
                                        <span>4</span>
                                    </p>
                                    <p>
                                        <span>주간</span>
                                        <span>10</span>
                                    </p>
                                    <p>
                                        <span>월간</span>
                                        <span>30</span>
                                    </p>
                                </td>
                            </tr>
                        </table>
                    </section>
                    <section>
                        <table border="0">
                            <caption>주문 업무현황</caption>
                            <tr>
                                <th>
                                    <p>입금대기(건)</p> 
                                    <strong>100</strong>
                                </th>
                                <th>
                                    <p>배송준비(건)</p>
                                    <strong>100</strong>
                                </th>
                                <th>
                                    <p>취소요청(건)</p>
                                    <strong>100</strong>
                                </th>
                                <th>
                                    <p>교환요청(건)</p>
                                    <strong>100</strong>
                                </th>
                                <th>
                                    <p>반품요청(건)</p>
                                    <strong>100</strong>
                                </th>
                            </tr>
                        </table>
                    </section>
                    <section>
                        <article>
                            <table border="0">
                                <caption>공지사항</caption>
                                <c:choose>
                                	<c:when test="${fn:length(latest1) == 0}">
                                		<tr>
                                			<td colspan="2">등록된 게시물이 없습니다.</td>
                                		</tr>
                                	</c:when>
                                	<c:otherwise>
	                                	<c:forEach var="vo" items="${latest1}">
		                                	<tr>
		                                    	<td>
			                                        <p>
			                                            <span>
			                                            	<a href="<c:url value='/admin/cs/view.do?no=${vo.csNo}&cate1=notice'/>">${vo.title}</a>
			                                            </span>
			                                            <span>${vo.rdate}</span>
			                                        </p>
		                                    	</td>
		                                    </tr>
	                                    </c:forEach>
                                    </c:otherwise>
                                 </c:choose>
                            </table>
                        </article>
                        <article>
                            <table>
                                <caption>고객문의</caption>
                                	<c:choose>
                                	<c:when test="${fn:length(latest2) == 0}">
                                		<tr>
                                			<td colspan="2">등록된 게시물이 없습니다.</td>
                                		</tr>
                                	</c:when>
                                	<c:otherwise>
	                                	<c:forEach var="vo" items="${latest2}">
		                                	<tr>
		                                    	<td>
			                                        <p>
			                                            <span>
			                                            	<a href="<c:url value='/admin/cs/view.do?no=${vo.csNo}&cate1=qna'/>">[${vo.type}]${vo.title}</a>
			                                            </span>
			                                            <span>${vo.rdate}</span>
			                                        </p>
		                                    	</td>
		                                    </tr>
	                                    </c:forEach>
                                    </c:otherwise>
                                 </c:choose>
                            </table>
                        </article>
                    </section>
                </section>
            </div>
        </main>
    </div>
<jsp:include page="./_footer.jsp"/>