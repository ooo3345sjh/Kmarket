<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<jsp:include page="./_header.jsp"/>
<script>
	
	$(function () {
		let contextRoot = '${request.getContextPath()}';
		console.log(contextRoot);	
		// 상품 수량 - 클릭시
		$('.decrease').click(function () {
			let numTag = $(this).next();
			let num = numTag.val();
			if(num == 1) {
				return;
			} else {
				numTag.val(--num);
				let total = (num * ${vo.discountPrice}).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$('.total > span').text(total);
			}
		})
		
		// 상품 수량 + 클릭시
		$('.increase').click(function () {
			let numTag = $(this).prev();
			let num = numTag.val();
			//console.log(num);
			if(num >= ${vo.stock}) {
				alert('재고량이 부족합니다.');
				return;
			} else {
				numTag.val(++num);
				let total = (num * ${vo.discountPrice}).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$('.total > span').text(total);
			}
		})
		
		// 해당 상품 리뷰를 불러오는 AJAX
		let pageGroupEnd;
		$(document).ready(function () {
			let jsonData = {"cate1":'${vo.cate1}', "cate2":'${vo.cate2}', "prodNo":'${vo.prodNo}'};
			
	        $.post(contextRoot + '/product/review.do', jsonData, function(data){
	        	pageGroupEnd = data.pageGroupEnd;
	        	let arr = JSON.parse(data.reviews); // JSON 문자열을 배열로 변환
	        	if(arr.length == 0){
                	$('.review > ul').append('<li><p>등록된 리뷰가 없습니다.</p></li>');
	        	}
				for(let review of arr){
					let liTag = '<li>'
	                          + '<div>'
	                          + '<h5 class="rating star' + review.rating + '">상품평</h5>'
	                          + '<span>' + review.uid.substring(0,3) + '****** ' + review.rdate.substring(0, 10) + '</span>'
	                          + '</div>'
	                          + '<h3>${vo.prodName}</h3>'
			                  + '<p>' + review.content + '</p>'
                			  + '</li>';

                	$('.review > ul').append(liTag);
                	$('.paging').html(data.pageTag);
				}
	        });
		})
		
		// 상품리뷰 페이지 클릭시 해당 상품리뷰가 나오도록 하는 AJAX
		$(document).on('click', '.paging > a',function (e) {
			e.preventDefault();
			let pg = $(this).text();
			//console.log(pg.includes('다음'));
			if(pg.includes('다음')){
				pg = pageGroupEnd + 1;
				console.log(pg);
			} else if(pg.includes('이전')){
				pg = pageGroupEnd - 1;
				console.log(pg);
			}
			let jsonData = {"cate1":'${vo.cate1}', "cate2":'${vo.cate2}', "prodNo":'${vo.prodNo}', "pg":pg};
			
	        $.post(contextRoot + '/product/review.do', jsonData, function(data){
	        	//console.log(data.pageTag);	
	        //	console.log(data.reviews);
	        	$('.review > ul').children().remove(); // 현재 페이지에 출력된 상품리뷰 삭제
	        	let arr = JSON.parse(data.reviews); // JSON 문자열을 배열로 변환
				for(let review of arr){
					console.log(review.revNo);
					console.log(review.prodNo);
					console.log(review.uid);
					console.log(review.content);
					
					let liTag = '<li>'
	                          + '<div>'
	                          + '<h5 class="rating star' + review.rating + '">상품평</h5>'
	                          + '<span>' + review.uid.substring(0,3) + '****** ' + review.rdate.substring(0, 10) + '</span>'
	                          + '</div>'
	                          + '<h3>${vo.prodName}</h3>'
			                  + '<p>' + review.content + '</p>'
                			  + '</li>';

                	
                	$('.review > ul').append(liTag);
                	$('.paging').html(data.pageTag);
				}
	        });
		})

		// 장바구니에 해당 상품을 추가하는 이벤트 함수		
		$(document).on('click', '.cart', function () {
			
			let num = $('input[name=num]').val();
			let total = $('.total > span').text();
			let jsonData = {
					"prodNo":'${vo.prodNo}', 
					"uid":'${sessMember.uid}', 
					"thumb1":'${vo.thumb1}', 
					"prodName":'${vo.prodName}', 
					"descript":'${vo.descript}', 
					"cate1":'${vo.cate1}', 
					"cate2":'${vo.cate2}', 
					"count": num, 
					"price":'${vo.price}',
					"discount":'${vo.discount}',
					"point":'${vo.point}',
					"delivery":'${vo.delivery}',
					"total": total.replaceAll(',', '')
			};
			
	        $.post(contextRoot + '/product/view.do', jsonData, function(data){
	        	console.log(data.result);
	        	if(data.result != 0){
	        		$('#cartMove').show();
	        		$('#background').show();
	        		$('body').css("overflow", "hidden");
	        	};
	        });
		})
		
		$(document).on('click', '#cartMove > button', function () {
			let value = $(this).text();
			
			if(value == '계속 쇼핑'){
	        	$('#cartMove').hide();
	        	$('#background').hide();
	        	$('body').css("overflow", "auto");
			} else{
        		location.href = contextRoot + '/product/cart.do';
			}
		})
		
		// 구매하기 버튼 클릭시 바로 해당 상품을 주문하는 페이지로 이동하는 이벤트
		$('.order').click(function () {
			let num = $('input[name=num]').val(); // 주문 갯수
			let total = $('.total > span').text(); // 총 상품금액
			let list=[];
			
			// 천 단위 ',' 처리
			let price = String('${vo.price}').replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			let point = String('${vo.point}').replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			let delivery = String('${vo.delivery}').replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			list.push({
					"prodNo":'${vo.prodNo}', 
					"cate1":'${vo.cate1}', 
					"cate2":'${vo.cate2}', 
					"count": num, 
					"price": price,
					"discount":'${vo.discount}%',
					"point": point,
					"delivery": delivery,
					"thumb1":'${vo.thumb1}',
					"prodName":'${vo.prodName}',
					"descript":'${vo.descript}'
			});
			
			sessionStorage.setItem("orderList", JSON.stringify(list)); // 세션 저장
			
			location.href = contextRoot + '/product/order.do';
		})
	})
</script>
            </aside>
            <!-- 상품 상세페이지 시작-->
            <section class="view">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>상품보기</h1>
                    <p>
                        HOME >
                        <span id='cate1'>패션·의류·뷰티</span>
                        >
                        <strong id='cate2' style="font-weight: bold;">남성의류</strong>
                    </p>
                </nav>
                <!-- 상품 전체 정보 내용 -->
                <article class="info">
                    <div class="image">
                        <img src='<c:url value='${vo.thumb2}'/>' alt="상품 이미지" width="460px" height="460px">
                    </div>
                    <div class="summary">
                        <nav>
                            <h1>${vo.company}</h1>
                            <h2>
                                상품번호&nbsp;:&nbsp;
                                <span>${vo.prodNo}</span>
                            </h2>
                        </nav>
                        <nav>
                            <h3>${vo.prodName}</h3>
                            <p>${vo.descript}</p>
                            <h5 class="rating star${vo.score}">
                                <a href="#review">상품평보기</a>
                            </h5>
                        </nav>
                        <nav>
                            <div class="org_price">
                                <del><fmt:formatNumber value="${vo.price}" pattern="#,###"/></del>
                                <span>${vo.discount}%</span>
                            </div>
                            <div class="dis_price">
                                <ins><fmt:formatNumber value="${vo.discountPrice}" pattern="#,###"/></ins>
                            </div>
                        </nav>
                        <nav>
                        	<c:choose>
	                           	<c:when test="${vo.delivery != 0}">
	                            	<span class="delivery"><fmt:formatNumber value="${vo.delivery}" pattern="#,###"/>원</span>
	                           	</c:when>
	                           	<c:otherwise>
	                            	<span class="delivery">무료배송</span>
	                           	</c:otherwise>
	                       	</c:choose>
                            <span class="arrival">모레(${yoil}) ${date} 도착예정</span>
                            <span class="desc">본 상품은 국내배송만 가능합니다.</span>
                        </nav>
                        <nav>
                            <span class="card cardfree">
                                <i>아이콘</i>
                                무이자할부
                            </span>
                            &nbsp;&nbsp;
                            <span class="card cardadd">
                                <i>아이콘</i>
                                카드추가혜택
                            </span>
                        </nav>
                        <nav>
                            <span class="origin">원산지-상세설명 참조</span>
                        </nav>
                        <img src="../img/vip_plcc_banner.png" alt="100원만 결제해도 1만원 적립!" class="banner">
                        <div class="count">
                            <button class="decrease">-</button>
                            <input type="text" name="num" value="1" readonly>
                            <button class="increase">+</button>
                        </div>
                        <div class="total">
                            <span><fmt:formatNumber value="${vo.discountPrice}" pattern="#,###"/></span>
                            <em>총 상품금액</em>
                        </div>
                        <div class="button">
                            <input type="button" class="cart" value="장바구니">
                            <input type="button" class="order" value="구매하기">
                        </div>
                    </div>
                </article>
                <!-- 상품 정보 내용 -->
                <article class="detail">
                    <nav>
                        <h1>상품정보</h1>
                    </nav>
                    <!-- 상품상세페이지 이미지 -->
                    <img src='<c:url value='${vo.thumb3}'/>' alt="상세페이지1">
                    <img src='<c:url value='${vo.detail}'/>' alt="상세페이지2">
                </article>
                <!-- 상품 정보 제공 고시 내용 -->
                <article class="notice">
                    <nav>
                        <h1>상품 정보 제공 고시</h1>
                        <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록된 정보입니다.</p>
                    </nav>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>상품번호</td>
                                <td>${vo.prodNo}</td>
                            </tr>
                            <tr>
                                <td>상품상태</td>
                                <td>${vo.status}</td>
                            </tr>
                            <tr>
                                <td>부가세 면세여부</td>
                                <td>${vo.duty}</td>
                            </tr>
                            <tr>
                                <td>영수증발행</td>
                                <td>${vo.receipt}</td>
                            </tr>
                            <tr>
                                <td>사업자구분</td>
                                <td>${vo.bizType}</td>
                            </tr>
                            <tr>
                                <td>브랜드</td>
                                <td>${vo.company}</td>
                            </tr>
                            <tr>
                                <td>원산지</td>
                                <td>${vo.origin}</td>
                            </tr>
                        </tbody>
                    </table>
                    <table border="0">
                        <tbody>
                            <tr>
                                <td>제품소재</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>색상</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>치수</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>제조자/수입국</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>제조국</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>취급시 주의사항</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>제조연월</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>품질보증기준</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>A/S 책임자와 전화번호</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td>주문 후 예상 배송기간</td>
                                <td>상세정보 직접입력</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    구매, 교환, 반품, 배송, 설치 등과 관련하여 추가비용, 제한조건 등의 특이사항이 있는 경우
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="notice">
                        소비자가 전자상거래등에서 소비자 보호에 관한 법률 제 17조 제1항 또는 제3항에 따라 청약철회를 하고 동법 제 18조 제1항에 따라 청약철회한 물품을 판매자에게 반환하였음에도 불구 하고 결제 대금의 환급이 3영업일을 넘게 지연된 경우, 소비자 는 전자상거래등에서 소비자보호에 관한 법률 제18조 제2항 및 동법 시행령 제21조 2에 따라 지연일수에 대하여 전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(“지연배상금”)를 신청할 수 있습니다. 아울러, 교환∙반품∙보증 및 결제대금의 환급신청은 [나의쇼핑정보]에서 하실 수 있으며, 자세한 문의는 개별 판매자에게 연락하여 주시기 바랍니다.
                    </p>
                </article>
                <!-- 상품 리뷰 내용 -->
                <article class="review">
                	<a name="review"></a> <!-- 상품리뷰로 이동하기 위한 타켓링크 -->
                    <nav><h1>상품리뷰</h1></nav>
                    <ul>
                    	<!-- 상품 리뷰 목록 들어오는 곳 -->
                    </ul>
                    <div class="paging">
                    <!-- 
	                    <a href="#"><&nbsp;이전</a>
	                    <a href="#" class="on">1</a>
	                    <a href="#">2</a>
	                    <a href="#">3</a>
	                    <a href="#">4</a>
	                    <a href="#">5</a>
	                    <a href="#">6</a>
	                    <a href="#">7</a>
	                    <a href="#">다음&nbsp;></a>-->
                    </div>
                </article>
            </section>
            <!-- 상품 상세페이지 끝 -->
        </main>
        </div>
        <div id='background'>
        </div>
        <div id='cartMove'>
        	<img alt="장바구니" src='<c:url value='/product/img/cart.png'/>'>
			<p>장바구니에 상품을 담았습니다.</p>
		 	<button type="button" name='shopping'>계속 쇼핑</button>
		 	<button type="button" name='cart'>장바구니로</button>
		</div>;
<jsp:include page="/_footer.jsp"/>