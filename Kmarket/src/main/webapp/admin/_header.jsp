<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>케이마켓:: 대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/img/favicon.ico'/>" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<c:url value='/admin/css/style.css'/>">
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="<c:url value='/admin/js/js.js'/>"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div>
                <a href='<c:url value='/admin/index.do'/>'>
                    <img src='<c:url value='/admin/img/admin_logo.png'/>' alt="ADMINSTRATOR">
                </a>
                <nav>
                	<c:choose>
                    	<c:when test="${sessMember.type eq 2}">
                    		<span>${sessMember.manager}님 반갑습니다.</span>
                    	</c:when>
                    	<c:otherwise>
                    		<span>${sessMember.name}님 반갑습니다.</span>
                    	</c:otherwise>
                    </c:choose>
                    <a href='<c:url value='/index.do'/>'>HOME</a>
                    <a href='<c:url value='/member/logout.do'/>'>로그아웃</a>
                    <a href="#">고객센터</a>
                </nav>
            </div>
        </header>

        <main>
            <div>
                <aside>
                    <ul id="gnb">
                        <li>
                            <a href="#">
                                <i class="fa fa-cogs" aria-hidden="true"></i>환경설정
                            </a>
                            <ol>
                                <li><a href="#">기본환경설정</a></li>
                                <li><a href="#">배너관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-store" aria-hidden="true"></i>상점관리
                            </a>
                            <ol>
                                <li><a href="#">판매자현황</a></li>
                                <li><a href="#">재고관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-users" aria-hidden="true"></i>회원관리
                            </a>
                            <ol>
                                <li><a href="#">회원현황</a></li>
                                <li><a href="#">포인트관리</a></li>
                                <li><a href="#">비회원관리</a></li>
                                <li><a href="#">접속자집계</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fas fa-box-open" aria-hidden="true"></i>상품관리
                            </a>
                            <ol>
                                <li><a href='<c:url value='/admin/list.do'/>'>상품현황</a></li>
                                <li><a href='<c:url value='/admin/register.do'/>'>상품등록</a></li>
                                <li><a href="#">재고관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-credit-card" aria-hidden="true"></i>주문관리
                            </a>
                            <ol>
                                <li><a href="#">주문현황</a></li>
                                <li><a href="#">매출현황</a></li>
                                <li><a href="#">결제관리</a></li>
                                <li><a href="#">배송관리</a></li>
                            </ol>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>고객센터
                            </a>
                            <ol>
                                <li><a href="<c:url value='/admin/cs/list.do?cate1=notice'/>">공지사항</a></li>
                                <li><a href="<c:url value='/admin/cs/list.do?cate1=faq'/>">자주묻는질문</a></li>
                                <li><a href="<c:url value='/admin/cs/list.do?cate1=qna'/>">문의하기</a></li>
                            </ol>
                        </li>
                    </ul>
                </aside>