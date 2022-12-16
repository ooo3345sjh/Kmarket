<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/_header.jsp"/>
        <main id="member">
            <div class="register">
                <nav>
                    <h1>판매자 회원가입</h1>
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
                        <caption>판매자 정보입력</caption>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                회사명
                            </th>
                            <td>
                                <input type="text" name="km_company" placeholder="회사명 입력" required>
                                <span class="msgCompany">&ensp;㈜ 포함 입력, 예) ㈜케이마켓</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                대표자
                            </th>
                            <td>
                                <input type="text" name="km_ceo" placeholder="대표자 입력" required>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                사업자등록번호
                            </th>
                            <td>
                                <input type="text" name="km_corp_reg" placeholder="사업자등록번호 입력" required>
                                <span class="msgCorp">&ensp;( - ) 표시 포함 12자리 입력, 예) 123-45-67890</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                통신판매업신고 번호
                            </th>
                            <td>
                                <input type="text" name="kms_online_reg" placeholder="통신판매업신고 입력" required>
                                <span class="msgOnline">&ensp;( - ) 표시 포함, 예) 강남-12345, 제 1-01-23-4567호, 2017-경기성남-0011</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                전화번호
                            </th>
                            <td>
                                <input type="tel" name="kms_tel" placeholder="전화번호 입력" required>
                                <span class="msgTel">&ensp;( - ) 표시 포함, 지역번호 포함, 예) 02-234-1234</span>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <span class="essential">*</span>
                                팩스번호
                            </th>
                            <td>
                                <input type="tel" name="kms_fax" placeholder="팩스번호 입력" required>
                                <span class="msgFax">&ensp;( - ) 표시 포함, 지역번호 포함, 예) 02-234-1234</span>
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
                <section>
                    <table>
                        <caption>담당자 정보입력</caption>
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
                                휴대폰
                            </th>
                            <td>
                                <input type="tel" name="km_hp" maxlength="13" placeholder="휴대폰 번호 입력" required>
                                <span class="msgHp">&ensp;( - ) 포함 13자리를 입력하세요.</span>
                            </td>
                        </tr>
                    </table>
                </section>  
                <input type="button" class="registerBtn" value="회원가입">               
            </div>
        </main>
    </div>
<jsp:include page="/_footer.jsp"/>