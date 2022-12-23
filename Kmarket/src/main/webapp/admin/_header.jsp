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
    <link rel="stylesheet" href="./css/style.css">
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="./js/js.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div>
                <a href="#">
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