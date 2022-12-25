<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>

                <section id="notice-write" class="admin">
                    <nav>
                        <h1>공지사항 작성</h1>
                        <p>HOME > 고객센터 > <span>공지사항</span></p>
                    </nav>
                    <form action="">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="type">
                                        <option value="0">유형선택</option>
                                        <option value="10">고객서비스</option>
                                        <option value="20">안전거래</option>
                                        <option value="30">위해상품</option>
                                        <option value="40">이벤트당첨</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td>
                                    <input type="text" name="title" placeholder="제목을 입력합니다.">
                                </td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td>
                                    <textarea name="content" placeholder="내용을 입력하세요."></textarea>
                                </td>
                            </tr>
                        </table>
                    </form>
                    
                    <input type="button" class="btnList" value="취소">
                    <input type="submit" class="btnWrite" value="등록">
                </section>
            </div>
        </main>
    </div>

<jsp:include page="../_footer.jsp"/>