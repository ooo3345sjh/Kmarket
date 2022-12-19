<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<jsp:include page="./_header.jsp"/>
            </aside>
            <section class="list">
                <!-- 제목, 페이지 네비게이션 -->
                <nav>
                    <h1>상품목록</h1>
                    <p>
                        HOME >
                        <span>패션·의류·뷰티</span>
                        >
                        <strong>남성의류</strong>
                    </p>
                </nav>
                <!-- 정렬 메뉴 -->
                <ul class="sort">
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=sold'/>' class='${map.sort eq "sold" ? "on":""}'>판매많은순</a>
                    </li>
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=rowPrice'/>' class='${map.sort eq "rowPrice" ? "on":""}'>낮은가격순</a>
                    </li>
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=highPrice'/>' class='${map.sort eq "highPrice" ? "on":""}'>높은가격순</a>
                    </li>
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=score'/>' class='${map.sort eq "score" ? "on":""}'>평점높은순</a>
                    </li>
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=review'/>' class='${map.sort eq "review" ? "on":""}'>후기많은순</a>
                    </li>
                    <li>
                        <a href='<c:url value='/product/list.do?cate1=${map.cate1}&cate2=${map.cate2}&sort=prodNo'/>' class='${map.sort eq "newProd" ? "on":""}'>최근등록순</a>
                    </li>
                </ul>
                <!-- 상품 목록 -->
                <table border="0">
                    <tbody>
                    	<c:forEach items="${map.products}" end="${map.totalCount}" var='row' varStatus="loop">
	                        <tr>
	                            <td>
	                                <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>' class="thumb">
	                                    <img src='<c:url value='${row.thumb1}'/>' alt="상품이미지">
	                                </a>
	                            </td>
	                            <td>
                               		<h3 class="name"><a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>${row.prodName}</a></h3>
                               		<a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>' class="desc">${row.descript}</a>
                            	</td>
	                            <td width="10%">
	                                <ul>
	                                    <li>
	                                        <ins class="dis-price"><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                    </li>
	                                    <li>
	                                        <del class="org-price"><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                        <span class="discount">${row.discount}%</span>
	                                    </li>
	                                    <li>
		                                	<c:choose>
		                                		<c:when test="${row.delivery != 0}">
				                            	    <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
		                                		</c:when>
		                                		<c:otherwise>
		                                        	<span class="free-delivery">무료배송</span>
		                                		</c:otherwise>
		                                	</c:choose>
	                                    </li>
	                                </ul>
	                            </td>
	                            <td width="10%">
	                                <h4 class="seller">
	                                    <i class="fas fa-home" aria-hidden="true"></i>
	                                    ${row.company}
	                                </h4>
	                                <h5 class="badge power">
	                                	<c:choose>
		                                	<c:when test="${row.sellerLevel eq 2}">
			                                	<img alt="고객만족우수" src='<c:url value='/product/img/ico_great_seller.gif'/>'>
		                                	</c:when>
		                                	<c:when test="${row.sellerLevel eq 3}">
			                                	<img alt="파워딜러" src='<c:url value='/product/img/ico_power_dealer.gif'/>'>
		                                	</c:when>
	                                	</c:choose>
	                                </h5>
	                                <h6 class="rating star${row.score}">상품평</h6>		                            
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
                <!-- 상품목록 페이지번호 -->
                <div class="paging">
                    <span class="num">
                    	${map.pageTag}
                    </span>
                </div>
            </section>
        </main>
		</div>        
<jsp:include page="/_footer.jsp"/>