<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/_header.jsp"/>
        <section id="cs">
            <div class="notice">
                <nav>
                    <div>
                      <p>홈<span>></span>공지사항</p>
                    </div>
                </nav>
                <section class="view">
                    <aside>
                        <h2>공지사항</h2>
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
                            <h2 class="title">${cvo.title}</h2>
                            <span class="date">${cvo.rdate}</span>
                        </nav>
                        <div class="content">
                            <p>
                                ${cvo.content}
                            </p>
                        </div>
                        <a href="<c:url/ value='/cs/board/list'>" class="btnList">목록보기</a>
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>