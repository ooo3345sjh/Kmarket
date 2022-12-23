<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
        
                <section id="admin-product-register" class="admin">
                    <nav>
                        <h1>상품등록</h1>
                        <p>HOME > 상품관리 > <span>상품등록</span></p>
                    </nav>
                    <form action="/Kmarket/admin/registerAuto.do" method="post">
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
                        <input type="submit" value="등록하기">
                    </form>
                </section>
            </div>
        </main>
    </div>
<jsp:include page="./_footer.jsp"/>