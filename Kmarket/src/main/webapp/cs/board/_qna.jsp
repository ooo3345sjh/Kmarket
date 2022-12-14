<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="cs">
	<div class="qna">
                <nav>
                    <div>
                      <p>홈<span>></span>문의하기</p>
                    </div>
                </nav>
                <section class="list">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="${cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=user'/>">회원</a></li>
                            <li class="${cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=coupon'/>">쿠폰/이벤트</a></li>
                            <li class="${cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=order'/>">주문/결제</a></li>
                            <li class="${cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=delivery'/>">배송</a></li>
                            <li class="${cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=cancel'/>">취소/반품/교환</a></li>
                            <li class="${cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=travel'/>">여행/숙박/항공</a></li>
                            <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=safeDeal'/>">안전거래</a></li>
                        </ul>
                    </aside>
                    <article>
                        <nav>
                        	<c:if test="${cate2 eq 'user'}">
	                            <h1>회원</h1>
	                            <h2>회원관련 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'coupon'}">
	                            <h1>쿠폰/이벤트</h1>
	                            <h2>쿠폰/이벤트 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'order'}">
	                            <h1>주문/결제</h1>
	                            <h2>주문/결제 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'delivery'}">
	                            <h1>배송</h1>
	                            <h2>배송 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'cancel'}">
	                            <h1>취소/반품/교환</h1>
	                            <h2>취소/반품/교환 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'travel'}">
	                            <h1>여행/숙박/항공</h1>
	                            <h2>여행/숙박/항공 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${cate2 eq 'safeDeal'}">
	                            <h1>안전거래</h1>
	                            <h2>안전거래 문의 내용입니다.</h2>
                            </c:if>
                        </nav>