<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/_header.jsp"/>
<jsp:include page="./_${map.cate1}.jsp"/>

						<!-- 공지사항 -->
						<c:if test="${map.cate1 eq 'notice'}">
                        <table>
                            <tr>
                                <td><a href="#">[안내] 해외결제 사칭 문자 주의</a></td>
                                <td>2022.11.21</td>
                            </tr>
                        </table>
                        <div class="page">
                    		${map.pageTag}
                        </div>
                        </c:if>
                        
                        <!-- 문의하기 -->
                        <c:if test="${map.cate1 eq 'qna'}">
                        <table>
                        	<c:forEach var="vo" items="${map.articles}">
                            <tr>
                            	<!-- 타입, 제목 -->
                                <td><a href="<c:url value='/cs/view.do?pg=${map.pg}&cate1=${map.cate1}&cate2=${map.cate2}'/>">[${vo.type}]${vo.title}</a></td>
                                <td>검토중</td>
                                
                                <!-- 아이디 마스킹처리 -->
                                <c:if test="${vo.uid ne null}">
							      <!-- 아이디의 앞 3자리까지 보여 주고 **로 처리 -->
							      <td>${fn:substring(vo.uid,0,3)}**</td>
							    </c:if>
							    
							    <!-- rdate -->
                                <c:set var="rdate"  value="${vo.rdate}"/>
                                <td>
                                	${fn:substring(rdate,2,10)}
                                </td>
                                
                            </tr>
                            </c:forEach>
                        </table>
                        <div class="page">
                            ${map.pageTag}
                        </div>
                        <a href="<c:url value='/cs/write.do?cate1=qna&cate2=${map.cate2}'/>">문의하기</a>
                        </c:if>
                        
                        
                        <!-- 자주묻는 질문 -->
                        <c:if test="${map.cate1 eq 'faq'}">
                        
                        <c:forEach var="vo" items="${map.articles}">
                        <div>
                            <h3>${.type}</h3>
                            <ul>
                                <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                                <li><a href="#"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                                <li><a href="#"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                                <li><a href="#"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                                <li class="more"><a href="#">더보기</a> </li>
                            </ul>                              
                        </div>
                        </c:forEach>
                        <div>
                            <h3>탈퇴</h3>
                            <ul>
                                <li><a href="./view.html"><span>Q.</span>회원 탈퇴 후 재가입이 가능한가요?</a></li>
                                <li><a href="#"><span>Q.</span>회원 탈퇴 후 재가입이 가능한가요?</a></li>
                                <li><a href="#"><span>Q.</span>회원 탈퇴 후 재가입이 가능한가요?</a></li>
                                <li><a href="#"><span>Q.</span>회원 탈퇴 후 재가입이 가능한가요?</a></li>
                                <li class="more"><a href="#">더보기</a> </li>
                            </ul>                              
                        </div>
                        
                        <div>
                            <h3>회원정보</h3>
                            <ul>
                                <li><a href="./view.html"><span>Q.</span>개인회원과 법인회원에 차이가 있나요?</a></li>
                                <li><a href="#"><span>Q.</span>회원정보를 수정하고싶어요.</a></li>
                                <li><a href="#"><span>Q.</span>회원정보를 수정하고싶어요.</a></li>
                                <li><a href="#"><span>Q.</span>회원정보를 수정하고싶어요.</a></li>
                                <li class="more"><a href="#">더보기</a> </li>
                            </ul>                              
                        </div>
                        
                        <div>
                            <h3>로그인</h3>
                            <ul>
                                <li><a href="./view.html"><span>Q.</span>로그인에 문제가 있어요</a></li>
                                <li><a href="#"><span>Q.</span>로그인에 문제가 있어요</a></li>
                                <li><a href="#"><span>Q.</span>로그인에 문제가 있어요</a></li>
                                <li><a href="#"><span>Q.</span>로그인에 문제가 있어요</a></li>
                                <li class="more"><a href="#">더보기</a> </li>
                            </ul>                              
                        </div>
                    </article>
                </section>
                        </c:if>
                        
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>