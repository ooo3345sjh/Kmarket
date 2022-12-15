<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"/>
<script>
	$(document).on('click', '.remove', function(e){
		e.preventDefault();
		
		let isDeleteOk = confirm("정말 삭제하시겠습니까?");
				
			if (isDeleteOk){
				let product = $(this).closest('product');
				let no = $(this).attr('data-prodNo');
			}
			
			let jsonData = {"no" : prodNo};
			
			$.ajax ({
				url: '/Kmarket/admin/list.do',
				type: 'POST',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result == 1){
						alert('상품이 삭제되었습니다.');
						product.hide();
					}
				}
			});
	});
</script>
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
                        <c:forEach var="vo" items="${map.products}">
                        <tr>
                            <td><input type="checkbox" name="상품코드"></td>
                            <td>
                                <img src="<c:url value='${vo.thumb1}'/>" alt="thumb">
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
                                <a href="#" class="remove" data-prodNo="${vo.prodNo}">[삭제]</a>
                                <a href="#" class="modify">[수정]</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <input type="button" value="선택삭제">
                    <div class="paging">
                    <%-- 
                        <a href='<c:url value='/admin/list.do?pg=${pageGroupStart - 1}'/>' class="${pageGroupStart > 1 ? 'prevon' : 'prevoff'}"></a>
                        <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
                        	<a href='<c:url value='/admin/list.do?pg=${i}'/>' class="pageNum ${currentPage == i ? 'on' : 'off'}">${i}</a>
                        </c:forEach>
                        <a href='<c:url value='/admin/list.do?pg=${pageGroupEnd + 1}'/>' class="${pageGroupEnd < lastPageNum ? 'nexton' : 'nextoff'}"></a>
                    --%>
                    	${map.pageTag}
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