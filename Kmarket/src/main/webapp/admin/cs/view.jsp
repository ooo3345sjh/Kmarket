<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>

                <section id="cs-view" class="admin">
                    <nav>
                        <h1>공지사항 보기</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
                    <table>
                        <tr>
                            <td>유형</td>
                            <td class="type">${cvo.type}</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td class="title">${cvo.title}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td class="content">
                                <p>
                                    ${cvo.content} 
                                </p>
                            </td>
                        </tr>
                    </table>
                    <input type="button" class="btnDelete" value="삭제">
                    <input type="button" class="btnModify" value="수정">
                    <input type="button" class="btnList" value="목록">
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>