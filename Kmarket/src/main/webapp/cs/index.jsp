<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/_header.jsp"/>
        <section id="cs">
            <div class="main">
                <h1 class="title">
                    <strong>케이마켓</strong>이 도와드릴게요!
                </h1>
                <section class="notice">
                    <h1>공지사항<a href="<c:url value='/cs/list.do?cate1=notice&cate2=all&pg=1'/>">전체보기</a></h1>
                    <ul>
                    
                    	<c:forEach var="idx" items="${noticList}" end="4">
	                        <li>
	                           <a href="<c:url value='/cs/view.do?cate1=notice&cate2=${idx.cate2}&no=${idx.csNo}'/>" class="title">[${idx.type}] ${idx.title}</a>
	                           
	                           <c:set var="rdate"  value="${idx.rdate}"/>
	                           <span class="date">${fn:substring(rdate,2,10)}</span> 
	                        </li>
                        </c:forEach>
                        
                    </ul>
                    
                </section>
                <section class="faq">
                    <h1>자주 묻는 질문<a href="<c:url value='/cs/list.do?cate1=faq&cate2=user&pg=1'/>">전체보기</a></h1>
                    <ol>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=user&pg=1'/>"><span>회원</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=coupon&pg=1'/>"><span>쿠폰/이벤트</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=order&pg=1'/>"><span>주문/결제</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=delivery&pg=1'/>"><span>배송</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=cancel&pg=1'/>"><span>취소/반품/교환</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=travel&pg=1'/>"><span>여행/숙박/항공</span></a>
                        </li>
                        <li>
                            <a href="<c:url value='/cs/list.do?cate1=faq&cate2=safeDeal&pg=1'/>"><span>안전거래</span></a>
                        </li>

                    </ol>
                </section>
                <section class="qna">
                    <h1>
                        문의하기
                        <a href="<c:url value='/cs/list.do?cate1=qna&cate2=user&pg=1'/>">전체보기</a>
                    </h1>
                    <ul>
                        <c:forEach var="idx" items="${qnaList}" end="4">
	                        <li>
	                           <a href="<c:url value='/cs/view.do?cate1=qna&cate2=${idx.cate2}&no=${idx.csNo}'/>" class="title">[${idx.type}] ${idx.title}</a>
	                           
	                           <!-- id -->
	                           <span style="margin-right: 10px;">${fn:substring(idx.uid,0,3)}**</span>
	                           
	                           <!-- rdate -->
	                           <c:set var="rdate"  value="${idx.rdate}"/>
	                           <span class="date" style="float: right;">${fn:substring(rdate,2,10)}</span> 
	                        </li>
                        </c:forEach>
                    </ul>
                    <a href="<c:url value='/cs/write.do?cate1=qna&cate2=user'/>" class="ask">문의글 작성 ></a>
                </section>

                <section class="tel">
                    <h1>
                        1:1 상담이 필요하신가요?
                    </h1>
                    <article>
                        <div>
                            <h3>고객센터 이용안내</h3>
                            <p>
                                <span>일반회원/비회원</span><br/>
                                <strong>1566-0001</strong><span> (평일 09:00 ~ 18:00)</span>
                            </p>
                            <p>
                                <span>스마일클럽 전용</span><br/>
                                <strong>1566-0002</strong><span> (365일 09:00 ~ 18:00)</span>
                            </p>
                        </div>
                    </article>
                    <article>
                        <div>
                            <h3>판매상담 이용안내</h3>
                            <p>
                                <span>판매고객</span><br/>
                                <strong>1566-5700</strong><span> (평일 09:00 ~ 18:00)</span>
                            </p>
                            <p>
                                <a href="#">판매자 가입 및 서류 접수 안내 ></a>
                            </p>
                        </div>
                    </article>

                </section>
            </div>
        </section>
       </div>
<jsp:include page="/_footer.jsp"/>