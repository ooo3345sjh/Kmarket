<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="./js/product.js"></script>
<script src="./js/checkbox.js"></script>
<jsp:include page="./_header.jsp"/>

                <section id="admin-product-list" class="admin">
                    <nav>
                        <h1>상품목록</h1>
                        <p>HOME > 상품관리 > <span>상품목록</span></p>
                    </nav>
                    <form>
                    	<c:choose>
                    		<c:when test="${sessMember.type eq 5}">
		                    	<select name="searchField">
		                      	  <option value="prodName">상품명</option>
		                   	      <option value="prodNo">상품코드</option>
		                   	      <option value="seller">판매자</option>
		                    	</select>
		                    </c:when>
		                    <c:otherwise>
		                    	<select name="searchField">
		                      	  <option value="prodName">상품명</option>
		                   	      <option value="prodNo">상품코드</option>
		                    	</select>
		                    </c:otherwise>
                    	</c:choose>
                    	<input type="text" name="searchWord"/>
                    	<input type="submit" value="검색하기"/>
                    </form>   
                    <table border="0">
                        <tr>
                            <th><input type="checkbox" name="allCheck" value="all" onclick="selectAll(this)"></th>
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
                        <c:choose>
                        	<c:when test="${fn:length(map.products) == 0}">
                        	<tr>
                        		<td colspan="11">등록된 상품이 없습니다.</td>
                        	</tr>
                        	</c:when>
                        	<c:otherwise>
		                        <c:forEach var="vo" items="${map.products}">
		                        <tr>
		                            <td><input type="checkbox" name="check" value="${vo.prodNo}"></td>
		                            <td>
		                            	<a href="<c:url value='/product/view.do?cate1=${vo.cate1}&cate2=${vo.cate2}&no=${vo.prodNo}'/>">
		                                	<img src="<c:url value='${vo.thumb1}'/>" alt="thumb">
		                                </a>
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
		                                <a href="#" class="remove" data-no="${vo.prodNo}">[삭제]</a>
		                                <a href="#" class="modify" data-no="${vo.prodNo}">[수정]</a>
		                            </td>
		                        </tr>
		                        </c:forEach>
		                   </c:otherwise>
		            </c:choose>
                    </table>
                    <input type="button" id="deleteButton" value="선택삭제" onclick="checkDelete()">
                    <input type="button" id="registerButton" value="등록하기" onclick="location.href='<c:url value='/admin/register.do'/>'">
                    <div class="paging">
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