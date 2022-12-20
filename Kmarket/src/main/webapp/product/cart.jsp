<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./_header.jsp"/>
<script>
	$(function () {
		// 전체 체크 박스 클릭시 개별 체크항목 체크되게 하는 이벤트 함수
		let check = false;
		$('input[name=all]').click(function () {
			if(check == false){
				$("input[name=prodCheck]").prop("checked", true);
				check = true;
			} else {
				$("input[name=prodCheck]").prop("checked", false);
				check = false;
			}
		})
		
		// 체크박스 체크에 변화가 있을 때 전체합계의 값을 바꾸는 이벤트 함수
		$('input[name=prodCheck]').change(function () {
			
			// 해당 상품관련 변수 선언
			let checked = $(this).is(':checked'); // 해당 체크박스 체크 여부
			let tdTag = $(this).closest('tr').children('td'); // 해당 체크박스 상품의 td태그 모음
			let count = tdTag.eq(2).text(); // 상품 수량 
			let price = tdTag.eq(3).text().replace(",", ""); // 상품 가격 
			let discount = tdTag.eq(4).text().replace("%", ""); // 상품 할인율
			let discountPrice = (price * count) * discount * 0.01; // 상품 할인 가격
			let point = tdTag.eq(5).text() * count; // 적립 포인트
			let delivery = tdTag.eq(6).text() == '무료배송'? 0 : tdTag.eq(6).text().replace(",", ""); // 배송비
			let total = (Number(price) * count) - Number(discountPrice); // 전체 가격
			
			// 전체 합계 변수 선언
			let tCount = $('#count');
			let tPrice = $('#price');
			let tdiscountPrice = $('#discountPrice');
			let tPoint = $('#point');
			let tDelivery = $('#delivery');
			let tTotalPrice = $('#totalPrice');
			console.log(checked);
			if(checked){
				count = Number(tCount.text()) + Number(count);
				price = Number(tPrice.text().replace(",", "")) + Number(price);
				discountPrice = -(Number(tdiscountPrice.text().replace(/-|,/g , '')) + Number(discountPrice));
				point = Number(tPoint.text().replace(",", "")) + Number(point);
				delivery = Number(tDelivery.text().replace(",", "")) + Number(delivery);
				total = Number(tTotalPrice.text().replace(",", "")) + Number(total);
			} else {
				if(tCount.text() != 0){
					count = Number(tCount.text()) - Number(count);
					price = Number(tPrice.text().replace(",", "")) - Number(price);
					discountPrice = -(Number(tdiscountPrice.text().replace(/-|,/g , '')) - Number(discountPrice));
					point = Number(tPoint.text().replace(",", "")) - Number(point);
					delivery = Number(tDelivery.text().replace(",", "")) - Number(delivery);
					total = Number(tTotalPrice.text().replace(",", "")) - Number(total);
				} else {
					return;
				}
			}
			
			// 천단위 ',' 처리
			price = String(price).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			discountPrice = String(discountPrice).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			point = String(point).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			delivery = String(delivery).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			total = String(total).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			// 전체 합계에 대입
			tCount.text(count);
			tPrice.text(price);
			tdiscountPrice.text(discountPrice);
			tPoint.text(point);
			tDelivery.text(delivery);
			tTotalPrice.text(total);
		})
	})
</script>
            </aside>
            <!-- 상품 상세페이지 시작-->
            <section class="cart">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>장바구니</h1>
                    <p>
                        HOME >
                        <strong>장바구니</strong>
                    </p>
                </nav>
                <form action="#">
                    <!-- 장바구니 목록 -->
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="all"></th>
                                <th>상품명</th>
                                <th>총수량</th>
                                <th>판매가</th>
                                <th>할인</th>
                                <th>포인트</th>
                                <th>배송비</th>
                                <th>소계</th>
                            </tr>
                        </thead>
                        <tbody id='cart'>
							<c:choose>
								<c:when test="${fn:length(list) == 0}">
		                            <tr class="empty">
		                                <td colspan="7">장바구니에 상품이 없습니다.</td>
		                            </tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var='row'>
			                            <tr>
			                                <td><input type="checkbox" name='prodCheck'></td>
			                                <td>
			                                    <article>
			                                        <a href="#"><img src='<c:url value='${row.thumb1}'/>' alt='썸네일1'></a>
			                                        <div>
			                                            <h2>
			                                                <a href="#">${row.prodName}</a>
			                                            </h2>
			                                            <p>${row.descript}</p>
			                                        </div>
			                                    </article>
			                                </td>
			                                <td>${row.count}</td>
			                                <td><fmt:formatNumber value="${row.price}" pattern="#,###"/></td>
			                                <td>${row.discount}%</td>
			                                <td><fmt:formatNumber value="${row.point}" pattern="#,###"/></td>
			                                <c:choose>
			                                	<c:when test="${row.delivery eq 0}">
			                                		<td>무료배송</td>
			                                	</c:when>
			                                	<c:otherwise>
			                                		<td><fmt:formatNumber value="${row.delivery}" pattern="#,###"/></td>
			                                	</c:otherwise>
			                                </c:choose>
			                                <td><fmt:formatNumber value="${row.total}" pattern="#,###"/></td>
			                            </tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
                        </tbody>
                    </table>
                    <input type="button" name="del" value="선택삭제">
                    <!-- 장바구니 전체합계 -->
                    <div class="total">
                        <h2>전체합계</h2>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>상품수</td>
                                    <td id='count'>0</td>
                                </tr>
                                <tr>
                                    <td>상품금액</td>
                                    <td id='price'>0</td>
                                </tr>
                                <tr>
                                    <td>할인금액</td>
                                    <td id='discountPrice'>0</td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td id='delivery'>0</td>
                                </tr>
                                <tr>
                                    <td>포인트</td>
                                    <td id='point'>0</td>
                                </tr>
                                <tr>
                                    <td>전체주문금액</td>
                                    <td id='totalPrice'>0</td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="submit" name value="주문하기">
                    </div>
                </form>
            </section>
            <!-- 장바구니 페이지 끝 -->
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>