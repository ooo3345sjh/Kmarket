<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/_header.jsp"/>
        <main id="member">
            <div class="login">
                <nav>
                    <h1>로그인</h1>
                    <p>HOME > <span>로그인</span></p>
                </nav>
                <form action='<c:url value='/member/login.do'/>' method="post">
                    <table>
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력">
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="pass" placeholder="비밀번호 입력">
                            </td>
                        </tr>
                    </table>
                    <input type="submit" value="로그인">
                    <div>
                        <label>
                            <input type="checkbox" name="auto">
                            자동 로그인
                        </label>
                        <a href="#">아이디 찾기</a>
                        <a href="#">비밀번호 찾기</a>
                        <a href='<c:url value='/member/join.do'/>'>회원가입</a>
                    </div>
                    <a href="https://www.naver.com">
                        <img src='<c:url value='/member/img/member_login_banner.jpg'/>' alt="휴대폰번호로 편리하게 로그인">
                    </a>
                </form>
                <img src='<c:url value='/member/img/member_certifi_logo.gif'/>' alt="banner">
            </div>
        </main>
    </div>
<jsp:include page="/_footer.jsp"/>