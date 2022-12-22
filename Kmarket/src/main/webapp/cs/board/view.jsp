<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/_header.jsp"/>

        <section id="cs">
            <div class="faq">
                <nav>
                    <div>
                      <p>홈<span>></span>
                      <c:if test="${cvo.cate1 eq 'notice'}">
                      	공지사항
                      </c:if>
                      
                      <c:if test="${cvo.cate1 eq 'faq'}">
                      	자주묻는 질문
                      </c:if>
                      
                      <c:if test="${cvo.cate1 eq 'qna'}">
                      	문의하기
                      </c:if>
                      </p>
                    </div>
                </nav>
                <section class="view">
                    
                    <c:choose>
                    	<%-- 문의하기 글 보기 --%>
                    	<c:when test="${cate1 eq 'qna'}">
                    		<aside>
                        	<c:if test="${cvo.cate1 eq 'qna'}">
                        		<h2>문의하기</h2>
                        	</c:if>	
                        	<ul>
	                            <li class="${cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=user'/>">회원</a></li>
	                            <li class="${cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=coupon'/>">쿠폰/이벤트</a></li>
	                            <li class="${cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=order'/>">주문/결제</a></li>
	                            <li class="${cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=delivery'/>">배송</a></li>
	                            <li class="${cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=cancel'/>">취소/반품/교환</a></li>
	                            <li class="${cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=travel'/>">여행/숙박/항공</a></li>
	                            <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=qna&cate2=safeDeal'/>">안전거래</a></li>
                        	</ul>
                    		</aside>
                    		<article>
                        		<nav>
                            		<h2 class="title">[${cvo.type}]${cvo.title}</h2>
                            
                            		<!-- id -->
                            		<c:if test="${cvo.uid ne null}">
                            			<span class="date" style="color: black;">${fn:substring(cvo.uid,0,3)}**  </span>
                            		</c:if>
                            
                           			<!-- rdate -->
                            		<c:set var="rdate"  value="${cvo.rdate}"/>
                            		<span class="date">
                            			${fn:substring(rdate,0,10)}
                            		</span>
                        		</nav>
		                        <div class="content">
		                            <p>
		                                ${cvo.content}
		                            </p>
		                        </div>
                        		<a href="<c:url value='/cs/list.do?cate1=qna&cate2=${cvo.cate2}&pg=1'/>" class="btnList">목록보기</a>
                    		</article>
                    	</c:when>
                    	<%-- 문의하기 글 보기 종료 --%>
                    	
                    	<%-- 공지사항 글 보기 --%>
                    	<c:when test="${cate1 eq 'notice'}">
                    		<aside>
                        	<c:if test="${cvo.cate1 eq 'notice'}">
                        		<h2>공지사항</h2>
                        	</c:if>	
                        	<ul>
	                           <li class="${map.cate2 eq 'all' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=notice&cate2=all'/>">전체</a></li>
			                    <li class="${map.cate2 eq 'service' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=notice&cate2=service'/>">고객서비스</a></li>
			                    <li class="${map.cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=notice&cate2=safeDeal'/>">안전거래</a></li>
			                    <li class="${map.cate2 eq 'xproduct' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=notice&cate2=xproduct'/>">위해상품</a></li>
			                    <li class="${map.cate2 eq 'great' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=notice&cate2=great'/>">이벤트당첨</a></li>
                        	</ul>
                    		</aside>
                    		<article>
                        		<nav>
                        		
                            		<h2 class="title">[${cvo.type}]${cvo.title}</h2>
                            
                            <!-- id -->
                            		<c:if test="${cvo.uid ne null}">
                            			<span class="date" style="color: black;">${fn:substring(cvo.uid,0,3)}**  </span>
                            		</c:if>
                            
                            <!-- rdate -->
                            		<c:set var="rdate"  value="${cvo.rdate}"/>
                            		<span class="date">
                            			${fn:substring(rdate,0,10)}
                            		</span>
                        		</nav>
		                        <div class="content">
		                            <p>
		                                ${cvo.content}
		                            </p>
		                        </div>
                        		<a href="<c:url value='/cs/list.do?cate1=notice&cate2=${cvo.cate2}&pg=1'/>" class="btnList">목록보기</a>
                    		</article>
                    	</c:when>
                    	<%-- 공지사항 글 보기 종료 --%>
                    	
                    	<%-- 자주묻는 질문 글 보기 --%>
                    	<c:when test="${cate1 eq 'faq'}">
                    		<aside>
                    		
                        	<c:if test="${cvo.cate1 eq 'faq'}">
                        		<h2>자주묻는 질문</h2>
                        	</c:if>	
                        	
                        		<ul>
		                            <li class="${cate2 eq 'user' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=user'/>">회원</a></li>
		                            <li class="${cate2 eq 'coupon' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=coupon'/>">쿠폰/이벤트</a></li>
		                            <li class="${cate2 eq 'order' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=order'/>">주문/결제</a></li>
		                            <li class="${cate2 eq 'delivery' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=delivery'/>">배송</a></li>
		                            <li class="${cate2 eq 'cancel' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=cancel'/>">취소/반품/교환</a></li>
		                            <li class="${cate2 eq 'travel' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=travel'/>">여행/숙박/항공</a></li>
		                            <li class="${cate2 eq 'safeDeal' ? 'on':'off'}"><a href="<c:url value='/cs/list.do?cate1=faq&cate2=safeDeal'/>">안전거래</a></li>
                        		</ul>
                    		</aside>
                    		
                    		<article>
                    			
                        		<nav>
                            		<h2 class="title"><span>Q.</span>${cvo.title}</h2>
                        	   </nav>
		                        <div class="content">
		                            <p>
		                                ${cvo.content}
		                            </p>
		                        </div>
                        		<a href="<c:url value='/cs/list.do?cate1=faq&cate2=${cvo.cate2}&pg=1'/>" class="btnList">목록보기</a>
                    		</article>
                    	</c:when>
                    	<%-- 자주묻는 질문 글 보기 종료 --%>
                    	
                    </c:choose>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>