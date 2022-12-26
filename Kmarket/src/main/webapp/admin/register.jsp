<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="./_header.jsp"/>
<script src="./js/point.js"></script>

<script>
$(function(){
	
	$(document).on('click', '#submit', function(){
		
		let cate1 = $('.category1').val();
		let cate2 = $('.category2').val();
		
		$.ajax({
			type:'POST',
			url: '/Kmarket/admin/register.do',
			data: {'cate1':cate1, 'cate2':cate2},
			dataType: 'json'
		});
	});
});
</script>
                <section id="admin-product-register" class="admin">
                    <nav>
                        <h1>상품등록</h1>
                        <p>HOME > 상품관리 > <span>상품등록</span></p>
                    </nav>
                    <form action='<c:url value="/admin/register.do"/>' name="form" method="post" enctype="multipart/form-data" onsubmit="return checkAll()">
                        <h2>상품분류</h2>
                        <p>기본분류는 반드시 선택하셔야 합니다. 하나의 상품에 1개의 분류를 지정 합니다.</p>
                        <table border="0">
                            <tr>
                                <th>1차 분류</th>
                                <td>
                                    <select name="category1" class="category1" required onchange="optionChange();">
                                        <option value="none" disabled selected>1차 분류 선택</option>
                                        <option value="10">브랜드패션</option>
                                        <option value="11">패션의류·잡화·뷰티</option>
                                        <option value="12">유아동</option>
                                        <option value="13">식품·생필품</option>
                                        <option value="14">홈데코·문구·취미·반려</option>
                                        <option value="15">컴퓨터·디지털·가전</option>
                                        <option value="16">스포츠·건강·렌탈</option>
                                        <option value="17">자동차·공구</option>
                                        <option value="18">여행·도서·티켓·e쿠폰</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>2차 분류</th>
                                <td>
                                    <select name="category2" class="category2" required>
                                        <option value="none" disabled selected>2차 분류 선택</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <h2>기본정보</h2>
                        <p>기본정보는 반드시 입력해야 합니다.</p>
                        <table border="0">
                            <tr>
                                <th>상품명</th>
                                <td>
                                    <input type="text" name="productName" required>
                                </td>
                            </tr>
                            <tr>
                                <th>기본설명</th>
                                <td>
                                    <input type="text" name="description" required>
                                    <p>※ 상품명 하단에 상품에 대한 추가적인 설명이 필요한 경우에 입력</p>
                                </td>
                            </tr>
                            <tr>
                                <th>제조사</th>
                                <td>
                                    <input type="text" name="productCompany" required>
                                </td>
                            </tr>
                            <!-- 정규 표현식과 replace 함수를 이용하여 숫자외의 값을 입력 못하게 막아두었습니다. -->
                            <tr>
                                <th>판매가격</th>
                                <td>
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="sellPrice" id="price" onkeyup="points();" required><span>원</span>
                                </td>
                            </tr>
                            
                            <tr>
                                <th>할인율</th>
                                <td>
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="discountRate" required><span>%</span>
                                    <p>※ '0'을 입력하면 할인율 없음</p>
                                </td>
                            </tr>
                            <tr>
                                <th>포인트</th>
                                <td>
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="point" id="point" required><span>점</span>
                                    <p>※ '0'을 입력하면 포인트 없음</p>
                                </td>
                            </tr>
                            <tr>
                                <th>재고수량</th>
                                <td>
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="stock" required><span>개</span>
                                </td>
                            </tr>
                            <tr>
                                <th>배송비</th>
                                <td>
                                    <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="deliveryCharge" required><span>원</span>
                                    <p>※ '0'을 입력하면 배송비 무료</p>
                                </td>
                            </tr>
                            <tr>
                                <th>상품 썸네일</th>
                                <td>
                                    <div>
                                        <input type="file" name="ThumbnailList" required>
                                        <p>※ 크기 120 x 120, 상품 목록에 출력될 이미지 입니다.</p>
                                    </div>
                                    <div>
                                        <input type="file" name="ThumbnailMain" required>
                                        <p>※ 크기 460 x 460, 상품 메인에 출력될 이미지 입니다.</p>
                                    </div>
                                    <div>
                                        <input type="file" name="ThumbnailDetail" required>
                                        <p>※ 크기 가로 860px, 상품 상세에 출력될 이미지 입니다.</p>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>상세 상품정보</th>
                                <td>
                                    <input type="file" name="detailInfo" required>
                                    <p>※ 크기 가로 860px 높이 제약없음, 크기 최대 1MB, 상세페이지 상품정보에 출력될 이미지 입니다.</p>
                                </td>
                            </tr>
                        </table>
                        <h2>상품정보 제공고시</h2>
                        <p>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 등록해야 되는 정보입니다.</p>
                        <table border="0">
                            <tr>
                                <th>상품상태</th>
                                <td>
                                    <input type="text" name="condition" value="새상품" required>
                                </td>
                            </tr>
                            <tr>
                                <th>부가세 면세여부</th>
                                <td>
                                    <input type="text" name="taxExemption" value="과세상품" required>
                                </td>
                            </tr>
                            <tr>
                                <th>영수증 발행</th>
                                <td>
                                    <input type="text" name="receipt" style="width: 280px;" value="발행가능 - 신용카드 전표, 온라인 현금영수증" required>
                                </td>
                            </tr>
                            <tr>
                                <th>사업자 구분</th>
                                <td>
                                    <input type="text" name="separation" style="width: 280px;" value="사업자 판매자" required>
                                </td>
                            </tr>
                            <tr>
                                <th>원산지</th>
                                <td>
                                    <input type="text" name="origin" value="국내산" required>
                                </td>
                            </tr>
                        </table>
                        <input type="submit" value="등록하기">
                    </form>
                    <p class = "ico info">
                        <strong>Tip!</strong>
                        전자상거래 등에서의 상품 등의 정보제공에 관한 고시에 따라 총 35개 상품군에 대해 상품 특성 등을 양식에 따라 입력할 수 있습니다.
                    </p>
                </section>
            </div>
        </main>
    </div>
<jsp:include page="./_footer.jsp"/>