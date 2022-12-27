<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<jsp:include page="./product/_header.jsp"/>
                <!-- 베스트상품 배너 -->
                <article class="best" style="position: static; top: 0px;">
                    <h1>
                        <i class="fas fa-crown" aria-hidden="true"></i>
                        베스트상품
                    </h1>
                    <ol>
                    <c:forEach items="${map.best}" end="4" var="row" varStatus="loop">
                    	
                        <li>
                            <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
                                <div class="thumb">
                                    <i>${loop.count}</i>
                                    <img src="${row.thumb1}" alt="item1" 
                                    <c:if test="${loop.count eq 1}">width="201" height="201"</c:if>> <!-- 첫번째 상품만 사이즈 설정 -->
                                </div>
                                <h2>${row.prodName}</h2>
                                <div class="org_price">
                                    <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
                                    <span>${row.discount}%</span>
                                </div>
                                <div class="dis_price">
                                    <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ol>
                </article>
            </aside>
            <section>
                <!-- 슬라이더 영역 -->
                <section class="slider">
	                <ul>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item1.jpg'/>' alt="item1">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item2.jpg'/>' alt="item2">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item3.jpg'/>' alt="item3">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item4.jpg'/>' alt="item4">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item5.jpg'/>' alt="item5">
	                        </a>
	                    </li>
	                </ul>
                </section>
                <!-- 히트상품 영역 -->
                <section class="hit">
                    <h3>
                        <span>히트상품</span>
                    </h3>
                    <c:forEach items="${map.hit}" end="7" var="row" varStatus='loop'>
	                    <article>
	                        <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.prodName}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 추천상품 영역 -->
                <section class="recommend">
                    <h3><span>추천상품</span></h3>
                    <c:forEach items="${map.score}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.prodName}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 최신상품 영역 -->
                <section class="new">
                    <h3><span>최신상품</span></h3>
                    <c:forEach items="${map.newProd}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 인기상품 영역 -->
                <section class="favorite">
                    <h3><span>인기상품</span></h3>
                    <c:forEach items="${map.favorite}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 할인상품 영역 -->
                <section class="discount">
                    <h3><span>할인상품</span></h3>
					<c:forEach items="${map.discount}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href='<c:url value='/product/view.do?cate1=${row.cate1}&cate2=${row.cate2}&no=${row.prodNo}'/>'>
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
	                                <del>${row.price}</del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins>${row.discountPrice}</ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
            </section>
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>