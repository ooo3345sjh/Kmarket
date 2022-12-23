<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"/>
        <main>
            <div>
                <aside>
                    <ul id="gnb">
                        <li>
                            <a href="#">
                                <i class="fa fa-cogs" aria-hidden="true"></i>환경설정
                            </a>
                            <ol>
                                <li><a href="#">기본환경설정</a></li>
                                <li><a href="#">배너관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-store" aria-hidden="true"></i>상점관리
                            </a>
                            <ol>
                                <li><a href="#">판매자현황</a></li>
                                <li><a href="#">재고관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-users" aria-hidden="true"></i>회원관리
                            </a>
                            <ol>
                                <li><a href="#">회원현황</a></li>
                                <li><a href="#">포인트관리</a></li>
                                <li><a href="#">비회원관리</a></li>
                                <li><a href="#">접속자집계</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-box-open" aria-hidden="true"></i>상품관리
                            </a>
                            <ol>
                                <li><a href='<c:url value='/admin/list.do'/>'>상품현황</a></li>
                                <li><a href='<c:url value='/admin/register.do'/>'>상품등록</a></li>
                                <li><a href="#">재고관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-credit-card" aria-hidden="true"></i>주문관리
                            </a>
                            <ol>
                                <li><a href="#">주문현황</a></li>
                                <li><a href="#">매출현황</a></li>
                                <li><a href="#">결제관리</a></li>
                                <li><a href="#">배송관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>고객센터
                            </a>
                            <ol>
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자주묻는질문</a></li>
                                <li><a href="#">문의하기</a></li>
                            </ol>
                        </li>
                    </ul>
                </aside>
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
                                	<c:forEach var="vo" items="${latest1}">
	                                	<tr>
	                                    	<td>
		                                        <p>
		                                            <span>
		                                            	<a href="#">${vo.title}</a>
		                                            </span>
		                                            <span>${vo.rdate}</span>
		                                        </p>
	                                    	</td>
	                                    </tr>
                                    </c:forEach>
                            </table>
                        </article>
                        <article>
                            <table>
                                <caption>고객문의</caption>
                                	<c:forEach var="vo" items="${latest2}">
	                                	<tr>
	                                    	<td>
		                                        <p>
		                                            <span>
		                                            	<a href="#">${vo.title}</a>
		                                            </span>
		                                            <span>${vo.rdate}</span>
		                                        </p>
	                                    	</td>
	                                    </tr>
                                    </c:forEach>
                            </table>
                        </article>
                    </section>
                </section>
            </div>
        </main>
    </div>
<jsp:include page="./_footer.jsp"/>