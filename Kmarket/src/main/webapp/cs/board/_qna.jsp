<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 문의하기 페이지 상단 > (현재 카테고리 이름) 표시 -->
<section id="cs">
	<div class="qna">
                <nav>
                    <div>
                      <p>홈<span>></span>문의하기 >
                      <c:if test="${map.cate2 eq 'user'}">
              		  	회원
              		  </c:if>
                      <c:if test="${map.cate2 eq 'coupon'}">
              		  	쿠폰/이벤트
              		  </c:if>
              		  <c:if test="${map.cate2 eq 'order'}">
              		  	주문/결제
              		  </c:if>
              		  <c:if test="${map.cate2 eq 'delivery'}">
              		  	배송
              		  </c:if>
              		  <c:if test="${map.cate2 eq 'cancel'}">
              		  	취소/반품/교환
              		  </c:if>
              		  <c:if test="${map.cate2 eq 'travel'}">
              		  	여행/숙박/항공
              		  </c:if>
              		  <c:if test="${map.cate2 eq 'safeDeal'}">
              		  	안전거래
              		  </c:if>
                      </p>
                    </div>
                </nav>
                <!-- 문의하기 사이드 구간 -->
                <section class="list">
                    <aside>
                        <h2>문의하기</h2>
                        <ul>
                            <li class="${map.cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=user&pg=1'/>">회원</a></li>
                            <li class="${map.cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=coupon&pg=1'/>">쿠폰/이벤트</a></li>
                            <li class="${map.cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=order&pg=1'/>">주문/결제</a></li>
                            <li class="${map.cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=delivery&pg=1'/>">배송</a></li>
                            <li class="${map.cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=cancel&pg=1'/>">취소/반품/교환</a></li>
                            <li class="${map.cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=travel&pg=1'/>">여행/숙박/항공</a></li>
                            <li class="${map.cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=qna&cate2=safeDeal&pg=1'/>">안전거래</a></li>
                        </ul>
                    </aside>
                    
                <!-- 문의하기 페이지 아티클 상단 nav구간 -->
                    <article>
                        <nav>
                        	<c:if test="${map.cate2 eq 'user'}">
	                            <h1>회원</h1>
	                            <h2>회원관련 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'coupon'}">
	                            <h1>쿠폰/이벤트</h1>
	                            <h2>쿠폰/이벤트 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'order'}">
	                            <h1>주문/결제</h1>
	                            <h2>주문/결제 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'delivery'}">
	                            <h1>배송</h1>
	                            <h2>배송 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'cancel'}">
	                            <h1>취소/반품/교환</h1>
	                            <h2>취소/반품/교환 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'travel'}">
	                            <h1>여행/숙박/항공</h1>
	                            <h2>여행/숙박/항공 문의 내용입니다.</h2>
                            </c:if>
                            <c:if test="${map.cate2 eq 'safeDeal'}">
	                            <h1>안전거래</h1>
	                            <h2>안전거래 문의 내용입니다.</h2>
                            </c:if>
                        </nav>