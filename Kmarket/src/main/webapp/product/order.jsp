<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./_header.jsp"/>
<script>
	$(function () {
		// 전체 합계 변수
		let tCount = $('#count');	// 상품 수량 
		let tPrice = $('#price');	// 상품 가격 
		let tDiscountPrice = $('#discountPrice');	// 상품 할인율
		let tPoint = $('#point');	// 적립 포인트
		let tDelivery = $('#delivery');	// 배송비
		let tTotalPrice = $('#totalPrice');	// 전체 가격
		
		$(document).ready(function () {
			let trTag = $('#cart > tr').get(); // 상품 정보가 담겨있는 tr 태그를 배열로 가져온다.
			console.log(trTag);
			
			trTag.forEach(function (el, index) { // 반복문을 통해 현재 주문페이지에 있는 상품들의 정보를 가져온다.
				console.log(el);
				let count = Number(el.cells[1].innerHTML);							 // 상품의 갯수를 가져옴.
				let price = Number(el.cells[2].innerHTML.replace(",", "")) * count;  // 상품의 가격을 가져옴.
				let discount = Number(el.cells[3].innerHTML.replace("%", ""));       // 상품의 할인율을 가져옴.
				let discountPrice = price * discount * (-0.01);						 // 가져온 할인율을 통해 할인가격을 계산
				let delivery = Number(el.cells[5].innerHTML.replace(",", ""));       // 상품의 배달비를 가져옴.
				let total = price + discountPrice;									 // 하나의 상품의 가격과 갯수를 곱해 총합계를 계산
				
				
				// 위에서 구한 값을 최종결제 정보에 다 더해준다.
				tCount.text(Number(tCount.text()) + count);            
				tPrice.text(Number(tPrice.text()) + price);
				tDiscountPrice.text(Number(tDiscountPrice.text()) + discountPrice);
				tDelivery.text(Number(tDelivery.text()) + delivery);
				tTotalPrice.text(Number(tTotalPrice.text()) + total);
			});
			
			// 천단위 ',' 처리
			tPrice.text(tPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			tDiscountPrice.text(tDiscountPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			tDelivery.text(tDelivery.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			tTotalPrice.text(tTotalPrice.text().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		})
	})
</script>
            </aside>
            <!-- 주문 페이지 시작-->
            <section class="order">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>주문결제</h1>
                    <p>
                        HOME >
                        <span>장바구니</span>
                        >
                        <strong>주문결제</strong>
                    </p>
                </nav>
                <form action="#">
                    <!-- 주문 상품 목록 -->
                    <table>
                        <thead>
                            <tr>
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
	                            <c:when test='${type eq "buyNow"}'>
			                            <tr>
			                                <td>
			                                	<input type="hidden" name='discount' value='${vo.discount}'>
			                                    <article>
			                                        <a href="#"><img src='<c:url value='${vo.thumb1}'/>' alt='썸네일1'></a>
			                                        <div>
			                                            <h2>
			                                                <a href="#">${vo.prodName}</a>
			                                            </h2>
			                                            <p>${vo.descript}</p>
			                                        </div>
			                                    </article>
			                                </td>
			                                <td>${count}</td>
			                                <td><fmt:formatNumber value="${vo.price}" pattern="#,###"/></td>
			                                <td>${vo.discount}%</td>
			                                <td><fmt:formatNumber value="${vo.point}" pattern="#,###"/></td>
			                                <c:choose>
			                                	<c:when test="${vo.delivery eq 0}">
			                                		<td>무료배송</td>
			                                	</c:when>
			                                	<c:otherwise>
			                                		<td><fmt:formatNumber value="${vo.delivery}" pattern="#,###"/></td>
			                                	</c:otherwise>
			                                </c:choose>
			                                <td><fmt:formatNumber value="${vo.discountPrice * count}" pattern="#,###"/></td>
			                            </tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var='row'>
			                            <tr>
			                                <td>
			                                	<input type="hidden" name='discount' value='${row.discount}'>
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
			                                <td><fmt:formatNumber value="${(row.price -(row.price * row.discount * 0.01)) * row.count}" pattern="#,###"/></td>
			                            </tr>
									</c:forEach>
								</c:otherwise>
                        	</c:choose>
                        </tbody>
                    </table>
                    <!-- 최종 결제 정보 -->
                    <div class="final">
                        <h2>최종결제 정보</h2>
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>총</td>
                                    <td><span id='count' style="font-size: 14px;">0</span> 건</td>
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
                                    <td>포인트 할인</td>
                                    <td id='point'>0</td>
                                </tr>
                                <tr>
                                    <td>전체주문금액</td>
                                    <td id='totalPrice'>0</td>
                                </tr>
                            </tbody>
                        </table>
                        <input type="button" name value="결제하기">
                    </div>
                    <!-- 배송정보 -->
                    <article class="delivery">
                        <h1>배송정보</h1>
                        <table>
                            <tbody>
                                <tr>
                                    <td>주문자</td>
                                    <td><input type="text" name="orderer"></td>
                                </tr>
                                <tr>
                                    <td>휴대폰</td>
                                    <td>
                                        <input type="text" name="hp">
                                        <span>- 포함 입력</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>우편번호</td>
                                    <td>
                                        <input type="text" name="zip">
                                        <input type="button" value="검색">
                                    </td>
                                </tr>
                                <tr>
                                    <td>기본주소</td>
                                    <td><input type="text" name="addr1"></td>
                                </tr>
                                <tr>
                                    <td>상세주소</td>
                                    <td><input type="text" name="addr2"></td>
                                </tr>
                            </tbody>
                        </table>
                    </article>
                    <!-- 할인정보 -->
                    <article class="discount">
                        <h1>할인정보</h1>
                        <div>
                            <p>
                                현재 포인트 : 
                                <span>7200</span>
                                점
                            </p>
                            <label>
                                <input type="text" name="point">
                                점
                                <input type="button" value="적용">
                            </label>
                            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
                        </div>
                    </article>
                    <!-- 결제방법 -->
                    <article class="payment">
                        <h1>결제방법</h1>
                        <div>
                            <span>신용카드</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type1">
                                    신용카드 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type1">
                                    체크카드 결제
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>계좌이체</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type3">
                                    실시간 계좌이체
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type4">
                                    무통장 입금
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="type5">
                                    휴대폰결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="type6">
                                    카카오페이
                                    <img src="../img/ico_kakaopay.gif" alt="카카오페이">
                                </label>
                            </p>
                        </div>
                    </article>
                    <!-- 경고 -->
                    <article class="alert">
                        <ul>
                            <li>
                                <span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</span>
                            </li>
                            <li>
                                <span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008입니다.</span>
                            </li>
                            <li>
                                <span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.</span>
                            </li>
                        </ul>
                    </article>
                </form>
            </section>
            <!-- 주문 페이지 끝 -->
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>