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
			
			// 전체 합계 변수
			let tCount = $('#count');	// 상품 수량 
			let tPrice = $('#price');	// 상품 가격 
			let tDiscountPrice = $('#discountPrice');	// 상품 할인율
			let tPoint = $('#point');	// 적립 포인트
			let tDelivery = $('#delivery');	// 배송비
			let tTotalPrice = $('#totalPrice');	// 전체 가격
		
			// 0으로 초기화
			tCount.text("0");
			tPrice.text("0");
			tDiscountPrice.text("0");
			tPoint.text("0");
			tDelivery.text("0");
			tTotalPrice.text("0");
			
			if(check == false){ // 체크박스를 체크 했을때
				$("input[name=prodCheck]").prop("checked", true);
				check = true;
				let trTag = $('#cart > tr').get();
				trTag.forEach(function (el, index) {
					let count = Number(el.cells[2].innerHTML);
					let price = Number(el.cells[3].innerHTML.replace(",", "")) * count;
					let discount = Number(el.cells[4].innerHTML.replace("%", ""));
					let discountPrice = price * discount * (-0.01);
					let point = Number(el.cells[5].innerHTML.replace(",", ""));
					let delivery = Number(el.cells[6].innerHTML.replace(",", ""));
					let total = price + discountPrice;
					
					tCount.text(Number(tCount.text()) + count);
					tPrice.text(Number(tPrice.text()) + price);
					tDiscountPrice.text(Number(tDiscountPrice.text()) + discountPrice);
					tPoint.text(Number(tPoint.text()) + point);
					tDelivery.text(Number(tDelivery.text()) + delivery);
					tTotalPrice.text(Number(tTotalPrice.text()) + total);
				});
				
				// 천단위 ',' 처리
				tPrice.text(tPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				tDiscountPrice.text(tDiscountPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				tPoint.text(tPoint.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				tDelivery.text(tDelivery.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				tTotalPrice.text(tTotalPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				
			} else { // 체크박스를 체크 해제 했을때
				$("input[name=prodCheck]").prop("checked", false);
				check = false;
				
				// 0으로 초기화
				tCount.text("0");
				tPrice.text("0");
				tDiscountPrice.text("0");
				tPoint.text("0");
				tDelivery.text("0");
				tTotalPrice.text("0");
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
			let point = tdTag.eq(5).text(); // 적립 포인트
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
				price = Number(tPrice.text().replace(",", "")) + (Number(price) * Number(count));
				count = Number(tCount.text()) + Number(count);
				discountPrice = -(Number(tdiscountPrice.text().replace(/-|,/g , '')) + Number(discountPrice));
				point = Number(tPoint.text().replace(",", "")) + Number(point);
				delivery = Number(tDelivery.text().replace(",", "")) + Number(delivery);
				total = Number(tTotalPrice.text().replace(",", "")) + Number(total);
			} else {
				if(tCount.text() != 0){
					price = Number(tPrice.text().replace(",", "")) - (Number(price) * Number(count));
					count = Number(tCount.text()) - Number(count);
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
		});
		
		
		// 선택된 상품 제거하는 AJAX
		let contextRoot = '${request.getContextPath()}';
		$('input[name=del]').click(function () {
			let trTag = $('#cart > tr');
			let checkbox = $("input[name=prodCheck]");
			let arr = [];
			
			for(let i=0; i<checkbox.length; i++){
				if(checkbox[i].checked){
					trTag[i].remove(); // 선택 상품 제거
					
					// 더 이상 제거할 상품이 없으면
					if($('#cart > tr').length == 0){
						let empty = "<tr class='empty'>"
                        		  + "<td colspan='7'>장바구니에 상품이 없습니다.</td>"
                    			  + "</tr>";
                    	$('#cart').append(empty);
					}
					
					// 제거할 상품의 cartNo를 배열에 저장
					arr.push(trTag[i].children[1].children[0].defaultValue);
				}
			}
			
			if(arr.length != 0){
				$.ajax({
					url: contextRoot + '/product/deleteCart.do',
					type: "post",
					traditional: true,	// ajax 배열 넘기기 옵션!
					data: {"cartNo" : arr},
					dataType: "json",
					success: function (data) {
						console.log(data);
						
						// 전체 합계 변수
						let tCount = $('#count');	// 상품 수량 
						let tPrice = $('#price');	// 상품 가격 
						let tDiscountPrice = $('#discountPrice');	// 상품 할인율
						let tPoint = $('#point');	// 적립 포인트
						let tDelivery = $('#delivery');	// 배송비
						let tTotalPrice = $('#totalPrice');	// 전체 가격
					
						// 0으로 초기화
						tCount.text("0");
						tPrice.text("0");
						tDiscountPrice.text("0");
						tPoint.text("0");
						tDelivery.text("0");
						tTotalPrice.text("0");
						
					}
				});
			} else {
				alert('선택하신 상품이 없습니다. 삭제를 원하시는 상품을 선택 해 주세요.');
			}
		});
		
		// 주문하기 AJAX
		$('input[type=submit]').click(function (e) {
			e.preventDefault();
			let trTag = $('#cart > tr');
			let checkbox = $("input[name=prodCheck]");
			let list = [];
			
			let count = 0;
			console.log(trTag);
			for(let i=0; i<checkbox.length; i++){
				if(checkbox[i].checked){
					count++;
					
					// 썸네일1 사진 주소 작업
					let thumb1 = trTag[0].children[1].children[1].children[0].children[0].currentSrc;
					let index = thumb1.indexOf("file");
					thumb1 = "/" + thumb1.substring(index);
					
					// 체크된 상품 객체화해서 리스트에 저장
					list.push({
						"cartNo":trTag[i].children[1].children[0].defaultValue,
						"count":trTag[i].cells[2].innerHTML,
						"price":trTag[i].cells[3].innerHTML, 
						"discount":trTag[i].cells[4].innerHTML, 
						"point":trTag[i].cells[5].innerHTML, 
						"delivery":trTag[i].cells[6].innerHTML, 
						"totalPrice":trTag[i].cells[7].innerHTML, 
						"thumb1":thumb1,
						"prodName":trTag[0].children[1].children[1].children[1].children[0].innerText,
						"descript":trTag[0].children[1].children[1].children[1].children[1].innerText
					});
					
				}
			}
			
			// 세션 처리
			sessionStorage.setItem("orderList", JSON.stringify(list)); // 세션 저장
			
			
			/*
			let orderList = sessionStorage.getItem("orderList");
			orderList = JSON.parse(orderList) // JSON 데이터를 객체로 변환
			console.log("cartNo : " + orderList[0].cartNo);
			console.log("count : " + orderList[0].count);
			console.log("thumb1 : " + orderList[0].thumb1);
			console.log("prodName : " + orderList[0].prodName);
			console.log("descript : " + orderList[0].descript);
			*/
			
			if(count == 0){
				alert('주문하실 상품을 선택해주세요.');
			} else {
				location.href = contextRoot + '/product/order.do';
			}
		});
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
                <form action='<c:url value='/product/cart.do'/>' method="post">
                    <!-- 장바구니 목록 -->
                    <table>
                        <thead>
                            <tr>
                                <th><input type="checkbox" name="all"></th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>판매가</th>
                                <th>할인</th>
                                <th>포인트</th>
                                <th>배송비</th>
                                <th>총합</th>
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
									<c:forEach items="${list}" var='row' varStatus='loop'>
			                            <tr>
			                                <td><input type="checkbox" name='prodCheck'></td>
			                                <td>
			                                	<input type="hidden" name='cartNo' value='${row.cartNo}'>
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
			                                <td><fmt:formatNumber value="${row.point * row.count}" pattern="#,###"/></td>
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
                        <input type="submit" value="주문하기">
                    </div>
                </form>
            </section>
            <!-- 장바구니 페이지 끝 -->
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>