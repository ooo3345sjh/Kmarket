<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/_header.jsp"/>
<jsp:include page="./_${map.cate1}.jsp"/>
<script>
	$(function(){
		
		
		
	})
</script>
            <c:choose>
            	<%-- 공지사항 전체 --%>
            	<c:when test="${map.cate1 eq 'notice' && map.cate2 eq 'all'}"> 
            	<table>
             	<c:forEach var="nl" items="${nlist}">
                  <tr>
                      <td><a href="<c:url value='/cs/view.do?no=${nl.csNo}&cate1=${map.cate1}&cate2=${map.cate2}'/>">[${nl.type}]${nl.title}</a></td>
                      
                      <c:set var="rdate"  value="${nl.rdate}"/>
                      <td>
                      	${fn:substring(rdate,2,10)}
                      </td>
                  </tr>
                 </c:forEach>
            	</table>
            	
            	<div class="page">
        			${map.pageTag} <!-- 페이지 처리 -->
            	</div>
            	</c:when>
            	<%-- 공지사항 전체 끝 --%>
            	
            	<%-- 자주묻는 질문 --%>
            	<c:when test="${map.cate1 eq 'faq'}">
            	
	              	<c:forEach var="faqCate" items="${map.faqlist}" varStatus="status">
	            		<div class="box">
	                    	<h3>${faqCate.type}</h3>
	                    	
	                    	<ul>
	                     		<c:forEach var="article" items="${map.articles}">
	                         		<li class="m_list"><a href="<c:url value='/cs/view.do'/>"><span>Q.</span>${faqCate.title}</a></li>
	                         	</c:forEach>
	                         	<li class="more"><a href="#">더보기</a> </li>
	                    	</ul>                              
	               		</div>
	              	</c:forEach>
              
            	</c:when>
            	<%-- 자주묻는 질문 끝 --%>
            	
            	<%-- 문의하기 --%>
            	<c:when test="${map.cate1 eq 'qna'}">
            	<table>
            		<c:forEach var="vo" items="${map.articles}">
                		<tr>
                			<!-- 타입, 제목 -->
                    		<td><a href="<c:url value='/cs/view.do?no=${vo.csNo}&pg=${map.pg}&cate1=${map.cate1}&cate2=${map.cate2}'/>">[${vo.type}]${vo.title}</a></td>
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
            	</c:when>
            	<%-- 문의하기 끝 --%>
            	
            	<%-- 공지사항 전체 외 나머지 카테고리 --%>
            		<c:otherwise>
              			<table>
              				<c:forEach var="vo" items="${map.articles}">
                   		<tr>
                   			<td><a href="<c:url value='/cs/view.do?no=${vo.csNo}&pg=${map.pg}&cate1=${map.cate1}&cate2=${map.cate2}'/>">[${vo.type}] ${vo.title}</a></td>
	                       
	                        <c:set var="rdate"  value="${vo.rdate}"/>
	                        <td>${fn:substring(rdate,2,10)}</td>
                	    </tr>       
                   			</c:forEach>
              			</table>
              	<div class="page">
          			${map.pageTag} <!-- 페이지 -->
              	</div>
            		</c:otherwise>
            	<%-- 공지사항 전체 외 나머지 카테고리 끝 --%>
            </c:choose>
                        
                    </article>
                </section>
                        
                    </article>
                </section>
            </div>
        </section>
        </div>
<jsp:include page="/_footer.jsp"/>