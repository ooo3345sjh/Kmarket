<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/_header.jsp"/>
<jsp:include page="./_${map.cate1}.jsp"/>
<script>
	$(function(){
		for(let i = 1; i < 8; i++){
			
			$('.more'+i+'').click(function(e){
				e.preventDefault();
				$('.more'+i+'').hide();
				$('.short'+i+'').show();
				$('.ul'+i+' > #m_list:nth-child(n+4)').show();
			});
			
			$('.short'+i+'').click(function(e){
				e.preventDefault();
				$('.ul'+i+' > #m_list:nth-child(n+4)').hide();
				$('.short'+i+'').hide();
				$('.more'+i+'').show();
			})
		}
	
	})
	
	
</script>

            <c:choose>
            	<%-- 공지사항 전체 --%>
            	<c:when test="${map.cate1 eq 'notice' && map.cate2 eq 'all'}"> 
            	<table>
             	<c:forEach var="nl" items="${map.articles}">
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
	              	<c:forEach var="list"  items="${map.faqLists}" varStatus="i">
   		  		       	<div>
	                    	<h3>${list.get(0).type}</h3>
	                    	
	                    	<ul class="ul${i.count}">
	                     		<c:forEach var="article" items="${list}">

	                         		<li id="m_list"><a href="<c:url value='/cs/view.do?no=${article.csNo}&cate1=${map.cate1}&cate2=${map.cate2}'/>"><span>Q.</span>${article.title}</a></li>
	                         	</c:forEach>
	                         		<li class="more${i.count}"> <a href="#">더보기</a> </li>
	                         		<li class="short${i.count}"> <a href="#">간단히 보기</a> </li>
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
                    		
                    		<c:if test="${vo.comment eq '0'}">
                    			<td>검토중</td>
                    		</c:if>
                    		
                    		<c:if test="${vo.comment ne null}">
                    			<td style="color: skyblue;">답변완료</td>
                    		</c:if>
                    		
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