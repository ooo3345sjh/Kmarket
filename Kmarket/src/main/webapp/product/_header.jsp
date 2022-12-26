<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href='<c:url value='/img/favicon.ico'/>'>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href='<c:url value='/css/style.css'/>'>
    <link rel="stylesheet" href='<c:url value='/product/css/style.css'/>'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(function(){
        	
        	// 슬라이더 플러그인 함수
        	$(".slider > ul").bxSlider({
                controls: true,
                auto: true,
            });
            
            // 베스트 상품 사이드메뉴바 이동시키는 함수
            $(window).scroll(function(){
	            let best = $("aside > .best");
                let t = $(this).scrollTop(); // 스크롤바 TOP 높이
				console.log(t);
				
                if(t > 620){ 
                	if(t > 3500){
	                    best.css({
	                        position: "absolute",
	                        top: "3600px"
	                    });
                		return;
                	}
                    best.css({
                        position: "absolute",
                        top: t
                    });
                } else {
                    best.css({position: "static"});
                }
            });
            
            
            let type = null;
			let w = $(window); 
			
			let uri = window.location.pathname;
           
			// main index 페이지 일때 
			if(!uri.includes('product')){
				
	            // class="menu" 에 해당하는 링크 버튼 클릭시 해당 화면으로 이동하는 함수
	            $('.move  a').click(function (e) {
					e.preventDefault();
					let cate = $(this).attr('id');
					
					
					switch(cate){
						case 'hit': $('.hit')[0].scrollIntoView({ behavior: 'smooth' }); break;
						case 'score': $('.recommend')[0].scrollIntoView({ behavior: 'smooth' }); break;
						case 'newProd': $('.new')[0].scrollIntoView({ behavior: 'smooth' }); break;
						case 'favorite': $('.favorite')[0].scrollIntoView({ behavior: 'smooth' }); break;
						case 'discount': $('.discount')[0].scrollIntoView({ behavior: 'smooth' }); break;
					}
				})
            }
			
			$(document).ready(function () {
				
				// 메인페이지가 아닌 곳에서 class="menu" 에 해당하는 링크 버튼을 클릭시 사용되는 함수
				const url = new URL(window.location.href); // URL 객체 생성
				const urlParams = url.searchParams; // URLSearchParams 객체
				type = urlParams.get('type') // type value 값을 가져온다.
				
				switch(type){
					case 'hit': w.scrollTop(623); break;
					case 'score': w.scrollTop(1344); break;
					case 'newProd': w.scrollTop(2089); break;
					case 'favorite': w.scrollTop(2818); break;
					case 'discount': w.scrollTop(3542); break;
				}
				
				
				
				// uri확인 후 product이면 main에 id값 부여
				if(uri.includes('product')){
					$('main').attr('id', 'product');
				}
				
				// HOME > cate1 > cate2에 삽입 코드
				let cate1 = urlParams.get('cate1');
				let cate2 = urlParams.get('cate2');
				
				$('#cate1').text($('.' + cate1).text());
				$('#cate2').text($('.' + cate1 + cate2).text());
				
			})
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
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
                    <a href='<c:url value='/product/cart.do'/>'>
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href='<c:url value='/index.do'/>'>
                        <img src='<c:url value='/img/header_logo.png'/>' alt="로고">
                    </a>
                    <form action="#">
                        <input type="text" name="search">
                        <button>
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul class="move">
                        <li><a href='<c:url value='/index.do?type=hit'/>' id='hit'>히트상품</a></li>
                        <li><a href='<c:url value='/index.do?type=score'/>' id='score'>추천상품</a></li>
                        <li><a href='<c:url value='/index.do?type=newProd'/>' id='newProd'>최신상품</a></li>
                        <li><a href='<c:url value='/index.do?type=favorite'/>' id='favorite'>인기상품</a></li>
                        <li><a href='<c:url value='/index.do?type=discount'/>' id='discount'>할인상품</a></li>
                    </ul>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <!-- 카테고리/베스트 상품 영역 -->
            <aside>
                <!-- 카테고리 -->
                <ul class="category">
                    <li>
                        <i class="fa fa-bars" aria-hidden="true"></i>
                        카테고리
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-shopping-bag" aria-hidden="true"></i>
                            <span class='10'>브랜드패션</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=10'/>' class='1010'>브랜드 여성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=11'/>' class='1011'>브랜드 남성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=12'/>' class='1012'>브랜드 진/캐쥬얼</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=13'/>' class='1013'>브랜드 신발/가방</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=14'/>' class='1014'>브랜드 신발/가방</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=15'/>' class='1015'>브랜드 쥬얼리/시계</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=16'/>' class='1016'>브랜드 아웃도어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>
                            <span class='11'>패션의류·잡화·뷰티</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=10'/>' class='1110'>여성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=11'/>' class='1111'>남성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=12'/>' class='1112'>언더웨어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=13'/>' class='1113'>신발</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=14'/>' class='1114'>가방/잡화</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=15'/>' class='1115'>쥬얼리/시계</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=16'/>' class='1116'>화장품/향수</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=17'/>' class='1117'>바디/헤어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-baby-carriage" aria-hidden="true"></i>
                            <span class='12'>유아동</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=10'/>' class='1210'>출산/육아</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=11'/>' class='1211'>장난감/완구</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=12'/>' class='1212'>유아동 의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=13'/>' class='1213'>유아동 신발/잡화</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-utensils" aria-hidden="true"></i>
                            <span class='13'>식품·생필품</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=10'/>' class='1310'>신선식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=11'/>' class='1311'>가공식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=12'/>' class='1312'>건강식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=13'/>' class='1313'>커피/음료</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=14'/>' class='1314'>생필품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=15'/>' class='1315'>바디/헤어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-home" aria-hidden="true"></i>
                            <span class='14'>홈데코·문구·취미·반려</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=10'/>' class='1410'>가구/DIY</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=11'/>' class='1411'>침구/커튼</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=12'/>' class='1412'>조명/인테리어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=13'/>' class='1413'>생활용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=14'/>' class='1414'>주방용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=15'/>' class='1415'>문구/사무용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=16'/>' class='1416'>사무기기</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=17'/>' class='1417'>악기/취미</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=18'/>' class='1418'>반려동물용품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-tv" aria-hidden="true"></i>
                            <span class='15'>컴퓨터·디지털·가전</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=10'/>' class='1510'>노트북/PC</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=11'/>' class='1511'>모니터/프린터</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=12'/>' class='1512'>PC주변기기</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=13'/>' class='1513'>모바일/태블릿</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=14'/>' class='1514'>카메라</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=15'/>' class='1515'>게임</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=16'/>' class='1516'>영상가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=17'/>' class='1517'>주방가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=18'/>' class='1518'>계절가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=19'/>' class='1519'>생활/미용가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=20'/>' class='1520'>음향가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=21'/>' class='1521'>건강가전</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-running" aria-hidden="true"></i>
                            <span class='16'>스포츠·건강·렌탈</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=10'/>' class='1610'>스포츠의류/운동화</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=11'/>' class='1611'>휘트니스/수영</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=12'/>' class='1612'>구기/라켓</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=13'/>' class='1613'>골프</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=14'/>' class='1614'>자전거/보드/기타레저</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=15'/>' class='1615'>캠핑/낚시</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=16'/>' class='1616'>등산/아웃도어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=17'/>' class='1617'>건강/의료용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=18'/>' class='1618'>건강식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=19'/>' class='1619'>렌탈서비스</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-car" aria-hidden="true"></i>
                            <span class='17'>자동차·공구</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=17&cate2=10'/>' class='1710'>자동차용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=17&cate2=11'/>' class='1711'>공구/안전/산업용품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-book" aria-hidden="true"></i>
                            <span class='18'>여행·도서·티켓·e쿠폰</span>
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=10'/>' class='1810'>여행/항공권</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=11'/>' class='1811'>도서/음반/e교육</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=12'/>' class='1812'>공연티켓</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=13'/>' class='1813'>e쿠폰</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=14'/>' class='1814'>상품권</a></li>
                        </ol>
                    </li>
                </ul>