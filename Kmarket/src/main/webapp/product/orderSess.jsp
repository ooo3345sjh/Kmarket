<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./_header.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src='<c:url value='/product/js/zipcode.js'/>'></script>
<script>
	$(function () {
		// 전체 합계 변수
		let tCount = $('#count');	// 상품 수량 
		let tPrice = $('#price');	// 상품 가격 
		let tDiscountPrice = $('#discountPrice');	// 상품 할인가격
		let tPoint = $('#point');	// 적립 포인트
		let tDelivery = $('#delivery');	// 배송비
		let tTotalPrice = $('#totalPrice');	// 전체 가격
		let userPoint = '${vo.point}'; // 회원 포인트
		let currentTotal; // 전제 가격
		
		// 개별 상품들의 값들을 합산하기 위한 변수
		let count = 0;
		let price = 0;
		let discountPrice = 0;
		let delivery = 0;
		let total = 0;
		
		
		
		$(document).ready(function () {
			let orderList = sessionStorage.getItem("orderList"); // 세션값 가져오기
			orderList = JSON.parse(orderList) // JSON 데이터를 객체로 변환
			
			let trTag;
			for(let i=0; i<orderList.length; i++){
				trTag = "<tr>"
					  + "	<td>"
					  + "		<article>"
                      + "			<a href='#'><img src='<c:url value='/" + orderList[i].thumb1 + "'/>' alt='썸네일1'></a>"
                      + "			<div>"
                      + "				<h2>"
                      + "					<a href='#'>" + orderList[i].prodName + "</a>"
                      + "				</h2>"
                      + "				<p>" + orderList[i].descript + "</p>"
                      + "			</div>"
                   	  + "		</article>"
               		  + "	</td>"
               		  + "	<td>" + orderList[i].count + "</td>"
               		  + "	<td>" + orderList[i].price + "</td>"
               		  + "	<td>" + orderList[i].discount + "</td>"
               		  + "	<td>" + orderList[i].point + "</td>";
               		  
 				if(orderList[i].delivery == '0'){
 					trTag +="<td>무료배송</td>";
 				} else {
 					trTag +="<td>" + orderList[i].delivery + "</td>";
 				}      	
 				
 				// 할인가격 계산
 				let discount = Number(orderList[i].discount.replace("%", ""));
 				let cost = Number(orderList[i].price.replace(",", ""));
 				let totalPrice = Math.floor((cost - (cost * discount * 0.01)) * Number(orderList[i].count)); // 할인가격
 				
 				
 				// 숫자로 변형뒤 합산
 				count += Number(orderList[i].count);
 				price += Number(orderList[i].price.replace(",", "")) * Number(orderList[i].count);
 				discountPrice += Math.floor(cost * discount * 0.01 * -1);
 				delivery += Number(orderList[i].delivery.replace(",", ""));
 				total += totalPrice;
 				
 				totalPrice = String(totalPrice).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") // 천단위 ',' 처리
 
 				trTag +="<td>" + totalPrice + "</td></tr>";
 				$('#cart').append(trTag);
			}	
			
			// 천단위 ',' 처리
			price = String(price).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			discountPrice = String(discountPrice).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			delivery = String(delivery).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			total = String(total).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			
			
			// 최종결제 정보에 값 넣기
			tCount.text(count);
			tPrice.text(price);
			tDiscountPrice.text(discountPrice);
			tDelivery.text(delivery);
			tTotalPrice.text(total);
			
			currentTotal = total.replaceAll(",", ""); // 전제 가격
		})
		
		// 포인트 입력하는 이벤트
		$('input[name=point]').keyup(function () {
			let inputVal = $(this).val().replaceAll(",", "");
			if(!inputVal.match(/^[0-9 || ,]+$/) && inputVal != ''){
				$(this).val(inputVal.replace(/[^0-9]/g, "").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				alert('숫자만 입력해주세요.');
				return;
			}

			// 회원이 가지고 있는 포인트 이상 입력시
			if(Number(inputVal) > Number(userPoint)){
				inputVal = userPoint;	
			}
			
			$(this).val(inputVal.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		})
		
		
		// 포인트 적용시키는 이벤트
		let currentPoint = $('#currentPoint');
		let apply = false;
		$('input[name=pointBtn]').click(function () {
			
			if(!apply){
				let point = $('input[name=point]').val().replaceAll(",", "");
				
				if(Number(point) < 5000){
					alert('5,000점이상 부터 사용가능합니다.');
					return;
				}
				
				tPoint.text((Number(point)*-1).toLocaleString('ko-KR')); // 사용할 포인트 입력
				currentPoint.text((Number(userPoint)- Number(point)).toLocaleString('ko-KR')); // 현재 포인트에 사용할 포인트를 뺀다.
				let totalPrice = Number(currentTotal) - Number(point);  // 현재 전체 주문금액에서 포인트를 뺀다.
				tTotalPrice.text(totalPrice.toLocaleString('ko-KR'));   // 사용한 포인트를 뺀 주문금액 입력
				
				$(this).val('취소');
				
				$(this).css({
					'background':'#F99C9C',
					'color':'#8E1010',
					'border-color':'#BF6C6C'
				});
				apply = true;
			} else {
				tTotalPrice.text(Number(currentTotal).toLocaleString('ko-KR'));
				tPoint.text('0');
				currentPoint.text(Number(userPoint).toLocaleString('ko-KR'));
				
				$(this).val('적용');
				$(this).css({
					'background':'#f0f4f9',
					'color':'#3371c9',
					'border-color':'#acc0e0'
				});
				apply = false;
			}
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
                        	<!-- 주문 상품 정보가 온다. -->
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
                                    <td><input type="text" name="orderer" value='${vo.name}'></td>
                                </tr>
                                <tr>
                                    <td>휴대폰</td>
                                    <td>
                                        <input type="text" name="hp" value="${vo.hp}">
                                        <span>- 포함 입력</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>우편번호</td>
                                    <td>
                                        <input type="text" name="zip" id="zip" value="${vo.zip}">
                                        <input type="button" class="AuthBtn" onclick="zipcode()" value="검색">
                                    </td>
                                </tr>
                                <tr>
                                    <td>기본주소</td>
                                    <td><input type="text" name="addr1" id="addr1" value="${vo.addr1}"></td>
                                </tr>
                                <tr>
                                    <td>상세주소</td>
                                    <td><input type="text" name="addr2" id="addr2" value="${vo.addr2}"></td>
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
                                <span id='currentPoint'><fmt:formatNumber value="${vo.point}" pattern="#,###"/></span>
                                점
                            </p>
                            <label>
                                <input type="text" name="point">
                                점
                                <input type="button" name="pointBtn" value="적용">
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
                                    <input type="radio" name="payment" value="1">
                                    신용카드 결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="2">
                                    체크카드 결제
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>계좌이체</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="3">
                                    실시간 계좌이체
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="4">
                                    무통장 입금
                                </label>
                            </p>
                        </div>
                        <div>
                            <span>기타</span>
                            <p>
                                <label>
                                    <input type="radio" name="payment" value="5">
                                    휴대폰결제
                                </label>
                                <label>
                                    <input type="radio" name="payment" value="6">
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