<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="./_header.jsp"/>
<script>
	$(function () {
		// 주문 페이지에서 넘어온 정보 받기
		let listArr = sessionStorage.getItem("list"); // 주문 상품 정보 세션값 가져오기
		let orderinfo = sessionStorage.getItem("orderInfo"); // 최종 결제 정보 세션값 가져오기
		
		// JSON 데이터를 객체로 변환
		listArr = JSON.parse(listArr);
		orderinfo = JSON.parse(orderinfo);
		
		console.log(listArr);
		console.log(orderinfo);
		
		$(document).ready(function () {
			let trTag;
			
			// 개별 상품 정보 입력
			for(let i=0; i<listArr.length; i++){
				trTag = "<tr>"
					  + "	<td>"
					  + "		<article>"
	                  + "			<a href='<c:url value='/product/view.do?cate1=" + listArr[i].cate1 + "&cate2=" + listArr[i].cate2 + "&no=" + listArr[i].prodNo + "'/>'>"
	                  + " 				<img src='<c:url value='/" + listArr[i].thumb1 + "'/>' alt='썸네일1'>"
	                  + "           </a>"
	                  + "			<div>" 
	                  + "				<h2>"
	                  + "			<a href='<c:url value='/product/view.do?cate1=" + listArr[i].cate1 + "&cate2=" + listArr[i].cate2 + "&no=" + listArr[i].prodNo + "'/>'>" 
	                  + 				listArr[i].prodName 
	                  + "			</a>"
	                  + "				</h2>"
	                  + "				<p>" + listArr[i].descript + "</p>"
	                  + "			</div>"
	               	  + "		</article>"
	           		  + "	</td>"
	           		  + "	<td>" + Number(listArr[i].price).toLocaleString('ko-KR') + "</td>"
	           		  + "	<td>" + Number(listArr[i].discountPrice).toLocaleString('ko-KR') + "</td>"
	           		  + "	<td>" + Number(listArr[i].count).toLocaleString('ko-KR') + "</td>"
	           		  + "	<td>" + Number(listArr[i].total).toLocaleString('ko-KR') + "</td>";
	           		  
					
					$('#cart').append(trTag);
			}
			
			// 최종 결제 정보 입력
			let totalDiscountPrice = orderinfo.ordDiscount + orderinfo.usedPoint; // 총할인 금액 계산
			
			$('#total > tr:eq(0)').children(1).children(0).text(orderinfo.ordPrice.toLocaleString('ko-KR')); 		  // 총 상품금액
			$('#total > tr:eq(1)').children(1).children(0).text("-" + totalDiscountPrice.toLocaleString('ko-KR'));    // 총 할인금액
			$('#total > tr:eq(2)').children(1).children(0).text(orderinfo.ordDelivery.toLocaleString('ko-KR')); 	  // 배송비
			$('#total > tr:eq(3)').children(1).children(0).text(orderinfo.ordTotPrice.toLocaleString('ko-KR'));       // 총 결제금액
			
			// 주문 정보
			$('#ordNo').text(orderinfo.ordNo);       // 주문번호
			
			let payment = orderinfo.ordPayment; 
			switch(payment){
				case 1: payment = '신용카드 결제'; break;
				case 2: payment = '체크카드 결제'; break;
				case 3: payment = '실시간계좌이체'; break;
				case 4: payment = '무통장 입금'; break;
				case 5: payment = '휴대폰 결제'; break;
				case 6: payment = '카카오페이'; break;
			}
			
			$('#ordPayment').text(payment);       		  						   // 결제방법
			$('#orderName').text(payment);        		  						   // 수취인 이름
			$('#orderHp').text(orderinfo.recipHp);        					       // 수취인 연락처
			$('#ordTotPrice').text(orderinfo.ordTotPrice.toLocaleString('ko-KR')); // 총 결제금액
			$('#orderAddress').text(orderinfo.recipAddr1 + orderinfo.recipAddr2);  // 배송지 주소
			
		})
	})

</script>
            </aside>
            <!-- 결제완료 페이지 시작-->
            <section class="complete" >
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>주문완료</h1>
                    <p>
                        HOME > 장바구니 > 주문결제 >
                        <strong style="font-weight: bold;">주문완료</strong>
                    </p>
                </nav>
                <!-- 완료 멘트 -->
                <article class="message">
                    <h2>
                        고객님의 주문이 정상적으로 완료되었습니다.
                        <i class="far fa-smile" aria-hidden="ture"></i>
                    </h2>
                    <p>
                        즐거운 쇼핑이 되셨습니까? 항상 고객님을 최우선으로 생각하는 케이마켓이 되겠습니다.
                    </p>
                </article>
                <!-- 상품정보 -->
                <article class="info">
                    <h1>상품정보</h1>
                    <table border="0">
                        <tbody id='cart'>
                            <tr>
                                <th>상품명</th>
                                <th>상품금액</th>
                                <th width="70px">할인금액</th>
                                <th width='50px'>수량</th>
                                <th>주문금액</th>
                            </tr>
                            
                        </tbody>
                        <tbody>
                            <tr class="total">
                                <td colspan="2"></td>
                                <td colspan="3">
                                    <table border="0">
                                        <tbody id='total'>
                                            <tr>
                                                <td>총 상품금액</td>
                                                <td>
                                                    <span>34,000</span>원
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>총 할인금액</td>
                                                <td>
                                                    <span>-2,000</span>원
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>배송비</td>
                                                <td>
                                                    <span>3,000</span>원
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>총 결제금액</td>
                                                <td>
                                                    <span>35,000</span>원
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <!-- 주문정보 -->
                <article class="order">
                    <h1>주문정보</h1>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>주문번호</td>
                                <td id='ordNo'>2008101324568</td>
                                <td rowspan="3">총 결제금액</td>
                                <td rowspan="3"><span id='ordTotPrice'>35,000</span>원</td>
                            </tr>
                            <tr>
                                <td>결제방법</td>
                                <td id='ordPayment'>신용카드</td>
                            </tr>
                            <tr>
                                <td>주문자/연락처</td>
                                <td>${userName} / ${userHp}</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <!-- 배송정보 -->
                <article class="delivery">
                    <h1>배송정보</h1>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>수취인</td>
                                <td id='orderName'>홍길동</td>
                                <td>주문자 정보</td>
                            </tr>
                            <tr>
                                <td>연락처</td>
                                <td id='orderHp'>010-1234-1234</td>
                                <td rowspan="2">
                                    ${userName} / ${userHp}
                                </td>
                            </tr>
                            <tr>
                                <td>배송지 주소</td>
                                <td id='orderAddress'>부산광역시 강남구 대연동 123 10층</td>
                            </tr>
                        </tbody>
                    </table>
                </article>
                <!-- 꼭 알아두세요. -->
                <article class="alert">
                    <h1>꼭 알아두세요.</h1>
                    <ul>
                        <li>
                            <span>케이마켓은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 케이마켓은 상품, 거래정보 및 거래에 대하여 책임을 지지 않습니다.</span>
                        </li>
                        <li>
                            <span>구매주문내역, 배송상태 확인, 구매영수증 출력, 구매취소/반품/교환은 사이트 상단의 주문/배송조회에서 확인할 수 있습니다.</span>
                        </li>
                        <li>
                            <span>고객님의 주문이 체결된 후 상품품절 및 단종 등에 의해 배송이 불가능할 경우, 전자상거래등에서의 소비자 보호에 관한 법률 제15조 2항에 의거하여 3영업일(공휴일 제외) 이내에 자동으로 취소될 수 있으며, 이 경우 취소 안내 메일이 고객님께 발송되오니 양지 바랍니다.</span>
                        </li>
                        <li>
                            <span>극히 일부 상품에 대해 수량부족, 카드결제승인 오류 등의 사례가 간혹 있을 수 있으니 `나의쇼핑정보`에서 다시 한 번 확인해 주세요.</span>
                        </li>
                        <li>
                            <span>현금잔고로 구매하셨을 경우, 나의 쇼핑정보에서 입금확인이 되었는지를 다시 한 번 확인해 주세요.</span>
                        </li>
                        <li>
                            <span>
                                배송주소를 추가하거나 변경, 삭제 등의 관리는 `나의쇼핑정보 > 나의정보`에서 가능합니다.
                            </span>
                        </li>
                    </ul>
                </article>
 				<div id='link'>
 					<a href="#">구매내역 보기</a>
 					<a href='<c:url value='/index.do'/>'>쇼핑홈 가기</a>
 				</div>
            </section>
            <!-- 결제완료 페이지 끝 -->
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>