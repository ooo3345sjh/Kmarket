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
                	if(t > 2900){
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
            
            // class="menu" 에 해당하는 링크 버튼 클릭시 해당 화면으로 이동하는 함수
            $('.move  a').click(function (e) {
				e.preventDefault();
				let cate = $(this).attr('id');
				switch(cate){
					case 'hit': w.scrollTop(623); break;
					case 'score': w.scrollTop(1344); break;
					case 'newProd': w.scrollTop(2089); break;
					case 'favorite': w.scrollTop(2818); break;
					case 'discount': w.scrollTop(3542); break;
				}
			})
			
			// 메인페이지가 아닌 곳에서 class="menu" 에 해당하는 링크 버튼을 클릭시 사용되는 함수
			$(document).ready(function () {
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
			})
        });
    </script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="<c:url value='#'/>">로그인</a>
                    <a href="#">회원가입</a>
                    <a href="#">마이페이지</a>
                    <a href="#">
                        <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#">
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
                            브랜드패션
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=10'/>'>브랜드 여성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=11'/>'>브랜드 남성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=12'/>'>브랜드 진/캐쥬얼</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=13'/>'>브랜드 신발/가방</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=14'/>'>브랜드 신발/가방</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=15'/>'>브랜드 쥬얼리/시계</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=10&cate2=16'/>'>브랜드 아웃도어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-tshirt" aria-hidden="true"></i>
                            패션의류·잡화·뷰티
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=10'/>'>여성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=11'/>'>남성의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=12'/>'>언더웨어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=13'/>'>신발</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=14'/>'>가방/잡화</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=15'/>'>쥬얼리/시계</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=16'/>'>화장품/향수</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=11&cate2=17'/>'>바디/헤어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-baby-carriage" aria-hidden="true"></i>
                            유아동
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=10'/>'>출산/육아</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=11'/>'>장난감/완구</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=12'/>'>유아동 의류</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=12&cate2=13'/>'>유아동 신발/잡화</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-utensils" aria-hidden="true"></i>
                            식품·생필품
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=10'/>'>신선식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=11'/>'>가공식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=12'/>'>건강식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=13'/>'>커피/음료</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=14'/>'>생필품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=13&cate2=15'/>'>바디/헤어</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-home" aria-hidden="true"></i>
                            홈데코·문구·취미·반려
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=10'/>'>가구/DIY</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=11'/>'>침구/커튼</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=12'/>'>조명/인테리어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=13'/>'>생활용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=14'/>'>주방용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=15'/>'>문구/사무용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=16'/>'>사무기기</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=17'/>'>악기/취미</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=14&cate2=18'/>'>반려동물용품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-tv" aria-hidden="true"></i>
                            컴퓨터·디지털·가전
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=10'/>'>노트북/PC</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=11'/>'>모니터/프린터</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=12'/>'>PC주변기기</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=13'/>'>모바일/태블릿</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=14'/>'>카메라</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=15'/>'>게임</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=16'/>'>영상가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=17'/>'>주방가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=18'/>'>계절가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=19'/>'>생활/미용가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=20'/>'>음향가전</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=15&cate2=21'/>'>건강가전</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-running" aria-hidden="true"></i>
                            스포츠·건강·렌탈
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=10'/>'>스포츠의류/운동화</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=11'/>'>휘트니스/수영</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=12'/>'>구기/라켓</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=13'/>'>골프</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=14'/>'>자전거/보드/기타레저</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=15'/>'>캠핑/낚시</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=16'/>'>등산/아웃도어</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=17'/>'>건강/의료용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=18'/>'>건강식품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=16&cate2=19'/>'>렌탈서비스</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-car" aria-hidden="true"></i>
                            자동차·공구
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=17&cate2=10'/>'>자동차용품</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=17&cate2=11'/>'>공구/안전/산업용품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-book" aria-hidden="true"></i>
                            여행·도서·티켓·e쿠폰
                            <i class="fas fa-angle-right" aria-hidden="true"></i>
                        </a>
                        <ol>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=10'/>'>여행/항공권</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=11'/>'>도서/음반/e교육</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=12'/>'>공연티켓</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=13'/>'>e쿠폰</a></li>
                            <li><a href='<c:url value='/product/list.do?cate1=18&cate2=14'/>'>상품권</a></li>
                        </ol>
                    </li>
                </ul>
                <!-- 베스트상품 배너 -->
                <article class="best" style="position: static; top: 0px;">
                    <h1>
                        <i class="fas fa-crown" aria-hidden="true"></i>
                        베스트상품
                    </h1>
                    <ol>
                    <c:forEach items="${map.best}" end="4" var="row" varStatus="loop">
                    	
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>${loop.count}</i>
                                    <img src="${row.thumb1}" alt="item1" 
                                    <c:if test="${loop.count eq 1}">width="201" height="201"</c:if>> <!-- 첫번째 상품만 사이즈 설정 -->
                                </div>
                                <h2>${row.prodName}</h2>
                                <div class="org_price">
                                    <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
                                    <span>${row.discount}%</span>
                                </div>
                                <div class="dis_price">
                                    <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ol>
                </article>
            </aside>
            <section>
                <!-- 슬라이더 영역 -->
                <section class="slider">
	                <ul>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item1.jpg'/>' alt="item1">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item2.jpg'/>' alt="item2">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item3.jpg'/>' alt="item3">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item4.jpg'/>' alt="item4">
	                        </a>
	                    </li>
	                    <li>
	                        <a href="#">
	                            <img src='<c:url value='/img/slider_item5.jpg'/>' alt="item5">
	                        </a>
	                    </li>
	                </ul>
                </section>
                <!-- 히트상품 영역 -->
                <section class="hit">
                    <h3>
                        <span>히트상품</span>
                    </h3>
                    <c:forEach items="${map.hit}" end="7" var="row" varStatus='loop'>
	                    <article>
	                        <a href="#">
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.prodName}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 추천상품 영역 -->
                <section class="recommend">
                    <h3><span>추천상품</span></h3>
                    <c:forEach items="${map.score}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href="#">
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.prodName}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 최신상품 영역 -->
                <section class="new">
                    <h3><span>최신상품</span></h3>
                    <c:forEach items="${map.newProd}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href="#">
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
<<<<<<< HEAD
	                                <del>${row.price}</del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins>${row.discountPrice}</ins>
=======
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 인기상품 영역 -->
                <section class="new">
                    <h3><span>인기상품</span></h3>
                    <c:forEach items="${map.favorite}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href="#">
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
	                                <del><fmt:formatNumber value="${row.price}" pattern="#,###"/></del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins><fmt:formatNumber value="${row.discountPrice}" pattern="#,###"/></ins>
>>>>>>> 4f14da06ec70d9bb6e6eb870becdf5ec4bda6f20
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
                <!-- 할인상품 영역 -->
                <section class="discount">
                    <h3><span>할인상품</span></h3>
					<c:forEach items="${map.discount}" end="7" var="row" varStatus="loop">
	                    <article>
	                        <a href="#">
	                            <div class="thumb">
	                                <img src="${row.thumb2}" alt="t1">
	                            </div>
	                            <h2>${row.prodName}</h2>
	                            <p>${row.descript}</p>
	                            <div class="org_price">
	                                <del>${row.price}</del>
	                                <span>${row.discount}%</span>
	                            </div>
	                            <div class="dis_price">
	                                <ins>${row.discountPrice}</ins>
	                                <c:choose>
	                                	<c:when test="${row.delivery != 0}">
			                                <span>배송비 <fmt:formatNumber value="${row.delivery}" pattern="#,###"/></span>
	                                	</c:when>
	                                	<c:otherwise>
			                                <span><img alt="무료배송" src='<c:url value='/img/ico_freeshipping.gif'/>'></span>
	                                	</c:otherwise>
	                                </c:choose>
	                            </div>
	                        </a>
	                    </article>
                    </c:forEach>
                </section>
            </section>
        </main>
        </div>
<jsp:include page="/_footer.jsp"/>