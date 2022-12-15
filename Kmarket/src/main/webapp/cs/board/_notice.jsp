<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<section id="cs">
    <div class="notice">
        <nav>
            <div>
              <p>홈<span>></span>공지사항 >
              
              <c:if test="${cate2 eq 'all'}">
              전체
              </c:if>
              
              <c:if test="${cate2 eq 'service'}">
              고객서비스
              </c:if>
              
              <c:if test="${cate2 eq 'safeDeal'}">
              안전거래
              </c:if>
              
              <c:if test="${cate2 eq 'xproduct'}">
              위해상품
              </c:if>
              
              <c:if test="${cate2 eq 'great'}">
              이벤트당첨
              </c:if>
              
              </p>
            </div>
        </nav>
        <section class="list">
            <aside>
                <h2>공지사항</h2>
                <ul>
                    <li class="${cate2 eq 'all' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=notice&cate2=all'/>">전체</a></li>
                    <li class="${cate2 eq 'service' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=notice&cate2=service'/>">고객서비스</a></li>
                    <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=notice&cate2=safeDeal'/>">안전거래</a></li>
                    <li class="${cate2 eq 'xproduct' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=notice&cate2=xproduct'/>">위해상품</a></li>
                    <li class="${cate2 eq 'great' ? 'on':'off'}"><a href="<c:url value='/cs/board/list.do?cate1=notice&cate2=great'/>">이벤트당첨</a></li>
                </ul>
            </aside>
            <article>
                <nav>
                	<c:if test="${cate2 eq 'all'}">
                    <h1>전체</h1>
                    <h2>공지사항 전체 내용입니다.</h2>
                    </c:if>
                    
                    <c:if test="${cate2 eq 'service'}">
                    <h1>고객서비스</h1>
                    <h2>고객서비스 공지사항입니다.</h2>
                    </c:if>
                    
                    
                    <c:if test="${cate2 eq 'safeDeal'}">
                    <h1>안전거래</h1>
                    <h2>안전거래 공지사항입니다.</h2>
                    </c:if>
                    
                    <c:if test="${cate2 eq 'xproduct'}">
                    <h1>위해상품</h1>
                    <h2>위해상품 공지사항입니다.</h2>
                    </c:if>
                    
                    <c:if test="${cate2 eq 'great'}">
                    <h1>이벤트당첨</h1>
                    <h2>이벤트당첨 공지사항입니다.</h2>
                    </c:if>
                </nav>