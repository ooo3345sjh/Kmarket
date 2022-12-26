<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>케이마켓:: 대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<c:url value='/member/css/style.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/cs/css/style.css'/>">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
</head>
<script>
	$(function () {
		$(document).ready(function () {
			let csTag = "<a href='<c:url value='/cs/index.do'/>'>고객센터</a>";
			let uri = window.location.pathname;
			
			if(uri.includes('cs')){
				$('.logo > div').append(csTag);
			}
		});
	})
</script>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <nav>
                    	<c:choose>
                    		<c:when test="${sessMember.type eq 1}">
                        		<a href='<c:url value='/member/logout.do'/>'>로그아웃</a>
                        		<a href="#">마이페이지</a>
                        	</c:when>
                        	<c:when test="${sessMember.type > 1}">
                        		<a href='<c:url value='/admin/index.do'/>'>관리자</a>
                        		<a href='<c:url value='/member/logout.do'/>'>로그아웃</a>
                        		<a href="#">마이페이지</a>
                        	</c:when>
                        	<c:otherwise>
                        		<a href='<c:url value='/member/login.do'/>'>로그인</a>
                        		<a href='<c:url value='/member/join.do'/>'>회원가입</a>
                        	</c:otherwise>
                        </c:choose>
                        <a href='<c:url value='/product/cart.do'/>'><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;장바구니</a>
                    </nav>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="<c:url value='/index.do'/>">
                        <img src='<c:url value='/member/img/header_logo.png'/>' alt="Kmarket 대한민국 1등 온라인 쇼핑">
                    </a>
                </div>
            </div>
        </header>
        