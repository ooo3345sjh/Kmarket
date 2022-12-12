<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/_header.jsp"/>
        <main id="member">
            <div class="register">
                <nav>
                    <h1>일반 회원가입</h1>
                </nav>
                <section>
                    <table>
                        <caption>필수 정보입력</caption>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                아이디
                            </th>
                            <td>
                                <input type="text" name="km_uid" placeholder="아이디 입력" required>
                                <span class="msgId">&ensp;영문, 숫자로 4~12자까지 설정해 주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                비밀번호
                            </th>
                            <td>
                                <input type="password" name="km_pass1" placeholder="비밀번호 입력" required>
                                <span class="msgPass">&ensp;영문, 숫자, 특수문자를 조합하여 8~12자까지 설정해 주세요.</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                비밀번호 확인
                            </th>
                            <td>
                                <input type="password" name="km_pass2" placeholder="비밀번호 확인" required>
                                <span class="msgPass">&ensp;비밀번호 재입력</span>
                            </td>
                        </tr>
                    </table>
                </section>          
                <section>
                    <table>
                        <caption>기본 정보입력</caption>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                이름
                            </th>
                            <td>
                                <input type="text" name="km_name" placeholder="이름 입력" required>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                성별
                            </th>
                            <td class="radio">
                                <label><input type="radio" name="km_gender" value="1"> 남</label>&emsp;
                                <label><input type="radio" name="km_gender" value="2"> 여</label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                EMAIL
                            </th>
                            <td>
                                <input type="email" name="km_email" placeholder="이메일 입력" required>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                휴대폰
                            </th>
                            <td>
                                <input type="tel" name="km_hp" placeholder="휴대폰 번호 입력" required>
                                <span class="msgHp">&ensp;( - ) 포함 13자리를 입력하세요.<span>
                            </td>
                        </tr>
                        <tr class="addr">
                            <th>
                                <span>&nbsp;</span>
                                주소
                            </th>
                            <td>
                                <input type="text" name="km_zip" id="zip" placeholder="우편번호" required><br/>
                                <input type="text" name="km_addr1" id="addr1" placeholder="주소를 검색하세요." required><br/>
                                <input type="text" name="km_addr2" id="addr2" placeholder="상세주소를 입력하세요." required>
                            </td>
                        </tr>
                    </table>
                </section>  
                <input type="button" class="registerBtn" value="회원가입">               
            </div>
        </main>
    </div>
<jsp:include page="/_footer.jsp"/>