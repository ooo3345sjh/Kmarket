<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
<script src="./js/script.js"></script>
        <main id="member">
            <div class="signup">
                <nav>
                    <h1>약관동의</h1>
                </nav>
                <section>
                    <h3><span class="essential">(필수)</span> 케이마켓 이용약관</h3>
                    <textarea name="terms" readonly>
                    	<c:choose>
                    		<c:when test="${type eq 'seller'}">${vo.tax}</c:when>
                    		<c:otherwise>${vo.terms}</c:otherwise>
                    	</c:choose>
                    </textarea>
                    <label><input type="checkbox" name="agree1">동의합니다.</label>
                </section>
                <section>
                    <h3><span class="essential">(필수)</span> 전자금융거래 이용약관</h3>
                    <textarea name="v" readonly>${vo.finance}</textarea>
                    <label><input type="checkbox" name="agree2">동의합니다.</label>
                </section>
                <section>
                    <h3><span class="essential">(필수)</span> 개인정보 수집동의</h3>
                    <textarea name="privacy" readonly>${vo.privacy}</textarea>
                    <label><input type="checkbox" name="agree3">동의합니다.</label>
                </section>
                <c:choose>
                	<c:when test="${type eq 'seller'}"></c:when>
                	<c:otherwise>
                		<section>
                    		<h3><span class="optional">(선택)</span> 위치정보 이용약관</h3>
	                    		<textarea name="terms" readonly>${vo.location}</textarea>
                    		<label><input type="checkbox" name="agree4">동의합니다.</label>
                		</section>
                	</c:otherwise>
                </c:choose>
                <c:choose>
                	<c:when test="${type eq 'seller'}">
                		<input type="button" class="agreeBtn" value="동의하기" onclick="checkSeller()">
                	</c:when>
                	<c:otherwise>
                		<input type="button" class="agreeBtn" value="동의하기" onclick="checkGeneral()">
                	</c:otherwise>
            	</c:choose>
            </div>
        </main>
    </div>
<jsp:include page="/_footer.jsp"/>