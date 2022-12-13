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
                                <li><a href="#">상품현황</a></li>
                                <li><a href="#">상품등록</a></li>
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
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>게시판관리
                            </a>
                            <ol>
                                <li><a href="#">게시판현황</a></li>
                                <li><a href="#">고객문의</a></li>
                            </ol>
                        </li>
                    </ul>
                </aside>
                <section id="admin-product-list" class="admin">
                    <nav>
                        <h1>상품목록</h1>
                        <p>HOME > 상품관리 > <span>상품목록</span></p>
                    </nav>
                    <select name="searchField">
                        <option value="productName">상품명</option>
                        <option value="productCode">상품코드</option>
                        <option value="productCompany">제조사</option>
                        <option value="productSeller">판매자</option>
                    </select>
                    <input type="text" name="searchWord">
                    <table border="0">
                        <tr>
                            <th><input type="checkbox"name="all"></th>
                            <th>이미지</th>
                            <th>상품코드</th>
                            <th>상품명</th>
                            <th>판매가격</th>
                            <th>할인율</th>
                            <th>포인트</th>
                            <th>재고</th>
                            <th>판매자</th>
                            <th>조회</th>
                            <th>관리</th>
                        </tr>
                        <c:forEach var="vo" items="${vo}">
                        <tr>
                            <td><input type="checkbox" name="상품코드"></td>
                            <td>
                                <img src='<c:url value='/admin/img/sample_thumb.jpg'/>' alt="thumb">
                            </td>
                            <td>${vo.prodNo}</td>
                            <td>${vo.prodName}</td>
                            <td>${vo.price}</td>
                            <td>${vo.discount}</td>
                            <td>${vo.point}</td>
                            <td>${vo.stock}</td>
                            <td>${vo.seller}</td>
                            <td>${vo.hit}</td>
                            <td>
                                <a href="#">[삭제]</a>
                                <a href="#">[수정]</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <input type="button" value="선택삭제">
                    <div class="paging">
                        <a href="#"></a>
                        <a href="#"></a>
                        <a href="#" class="pageNum on">1</a>
                        <a href="#" class="pageNum">2</a>
                        <a href="#" class="pageNum">3</a>
                        <a href="#" class="pageNum">4</a>
                        <a href="#" class="pageNum">5</a>
                        <a href="#" class="pageNum">6</a>
                        <a href="#" class="pageNum">7</a>
                        <a href="#" class="pageNum">8</a>
                        <a href="#" class="pageNum">9</a>
                        <a href="#" class="pageNum">10</a>
                        <a href="#"></a>
                        <a href="#"></a>
                    </div>
                    <p class = "ico info">
                        <strong>Tip!</strong>
                        전자상거래 등에서의 상품 등의 정보제공에 관한 고시에 따라 총 35개 상품군에 대해 상품 특성 등을 양식에 따라 입력할 수 있습니다.
                    </p>
                </section>
            </div>
        </main>
    </div>
<jsp:include page="./_footer.jsp"/>