<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>

                <section id="cs-view" class="admin">
                    <nav>
                        <h1>공지사항 보기</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
					
					<c:when test="${cate1 eq 'notice'}">
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>고객서비스</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>[안내] 해외결제 사칭 문자 주의</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td class="content">
                                <p>
                                    안녕하세요. K마켓입니다.<br/>
                                    K마켓 해외직구를 사칭하는 피싱 문자가 최근 다시 신고되고 있어 주의 안내드립니다.<br/>
                                    아래와 같이 K마켓 해외직구 승인결제 피싱 문자 또는 발신번호 006, 002 등으로<br/>
                                    시작하는 피싱 문자를 수신하신 고객님께서는 통화 또는 문자 내 기재된 번호/링크 등을<br/>
                                    클릭하지 않도록 주의하여 주시기 바랍니다.
                                </p>
                            </td>
                        </tr>
                    </table>
                    </c:when>
                    <input type="button" class="btnDelete" value="삭제">
                    <input type="button" class="btnModify" value="수정">
                    <input type="button" class="btnList" value="목록">
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>