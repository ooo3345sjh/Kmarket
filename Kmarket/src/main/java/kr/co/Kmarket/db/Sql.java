package kr.co.Kmarket.db;

import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.ProductVO;

public class Sql {
	
	/*** member ***/
	
	// uid 등록
	public static final String INSERT_UID = "INSERT INTO `km_member_uid` SET "
											+ "`uid`=?";
	// 일반 회원 가입
	public static final String INSERT_MEMBER = "INSERT INTO `km_member_general` SET "
											+ "`uid`=?, "
											+ "`pass`=SHA2(?, 256), "
											+ "`name`=?, "
											+ "`gender`=?, "
											+ "`hp`=?, "
											+ "`email`=?, "
											+ "`type`=1, "
											+ "`zip`=?, "
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
	// 판매자 회원 가입
	public static final String INSERT_SELLER = "INSERT INTO `km_member_seller` SET "
											+ "`uid`=?, "
											+ "`pass`=SHA2(?, 256), "
											+ "`type`=3, "
											+ "`zip`=?, "
											+ "`addr1`=?, "
											+ "`addr2`=?, "
											+ "`company`=?, "
											+ "`ceo`=?, "
											+ "`bizRegNum`=?, "
											+ "`comRegNum`=?, "
											+ "`tel`=?, "
											+ "`manager`=?, "
											+ "`managerHp`=?, "
											+ "`fax`=?, "
											+ "`regip`=?, "
											+ "`rdate`=NOW()";
	// 약관 불러오기
	public static final String SELECT_TERMS = "SELECT * FROM `km_member_terms`";
	// 아이디 중복 확인
	public static final String SELECT_COUNT_UID = "SELECT COUNT(`uid`) FROM `km_member_uid` WHERE `uid`=?";
	// 로그인
	public static final String SELECT_MEMBER = "SELECT * FROM `km_member_general` WHERE `uid`=? AND `pass`=SHA2(?, 256)";
	
	/*** product ***/
	public static final String INSERT_PRODUCT = "INSERT INTO `km_product` SET "
												+ "`cate1`=?, "
												+ "`cate2`=?, "
												+ "`prodName`=?, "
												+ "`descript`=?, "
												+ "`company`=?, "
												+ "`seller`='a101', "
												+ "`price`=?, "
												+ "`discount`=?, "
												+ "`point`=?, "
												+ "`stock`=?, "
												+ "`delivery`=?, "
												+ "`thumb1`=?, "
												+ "`thumb2`=?, "
												+ "`thumb3`=?, "
												+ "`detail`=?, "
												+ "`status`=?, "
												+ "`duty`=?, "
												+ "`receipt`=?, "
												+ "`bizType`=?, "
												+ "`origin`=?, "
												+ "`ip`=?, "
												+ "`rdate`=NOW()";
	

	public static final String SELECT_PRODUCTS = "SELECT * FROM `km_product` "
												+ "ORDER BY `prodNo` DESC "
												+ "LIMIT ?, 10";
	
	public static final String SELECT_COUNT_TOTAL_PROD = "SELECT COUNT(`prodNo`) FROM `km_product`";
	
	public static final String DELETE_PRODUCT = "DELETE * FROM `km_product` WHERE `prodNo`=?";
	
	
	/*** main ***/
	// 메인 페이지 베스트 상품, 히트 상품, 최신 상품, 할인 상품 조회
	public static final String SELECT_BEST_PRODUCTS = "SELECT b.* FROM (SELECT 'best' AS `type`, a.*  FROM `km_product` a ORDER BY `sold` DESC LIMIT 5) as b "
													+ "UNION "
													+ "SELECT b.* FROM (SELECT  'hit' AS `type`, a.* FROM `km_product` a ORDER BY `hit` DESC LIMIT 8) as b "
													+ "UNION "
													+ "SELECT b.* FROM (SELECT 'score' AS `type`, a.* FROM `km_product` a ORDER BY `score` DESC LIMIT 8) as b "
													+ "UNION "
													+ "SELECT b.* FROM (SELECT 'discount' AS `type`, a.* FROM `km_product` a ORDER BY `discount` DESC LIMIT 8) as b "
													+ "UNION " 
													+ "SELECT b.* FROM (SELECT 'new' AS `type`, a.* FROM `km_product` a ORDER BY `rdate` DESC LIMIT 8) as b "
													+ "UNION " 
													+ "SELECT b.* FROM (SELECT 'favorite' AS `type`, a.* FROM `km_product` a ORDER BY `review` DESC LIMIT 8) as b ";

	/*** product ***/
	/* view */
	// 조건에 해당하는 한개의 상품 데이터 조회
	public static final String SELECT_PRODUCT = "SELECT * FROM `km_product` WHERE prodNo=?";
	
	// 해당 상품에 등록된 총 리뷰갯수 조회
	public static final String SELECT_COUNT_REVIEWS = "SELECT COUNT(`revNo`) FROM `km_product_review` WHERE prodNo=?";
	
	// 해당 상품에 등록된 총 리뷰 조회
	public static final String SELECT_REVIEWS = "SELECT * FROM `km_product_review` WHERE prodNo=? "
											  + "ORDER BY `revNo` DESC "
											  + "LIMIT ?, 10";
	
	/*** cart ***/
	// 상품을 장바구니 담기 버튼 클릭시 추가하는 서비스
	public static final String INSERT_PRODUCT_IN_CART = "INSERT INTO `km_product_cart` SET "
													  + "`prodNo`=?,"
													  + "`uid`=?,"
													  + "`count`=?,"
													  + "`price`=?,"
													  + "`discount`=?,"
													  + "`point`=?,"
													  + "`delivery`=?,"
													  + "`total`=?,"
													  + "`rdate`=NOW()";
	
	// 장바구니 담긴 상품을 조회하는 서비스
	public static final String SELECT_PRODUCT_IN_CART = "SELECT * FROM `km_product_cart` c JOIN "
													  + "`km_product` p ON	c.prodNo = p.prodNo "
													  + "WHERE c.`uid`=?";
	

	
	/*** QnaArticle ***/
	// 문의하기 글쓰기, 카테고리 별 목록(회원, 쿠폰/이벤트, 주문/결제, 배송, 취소/반품/교환, 여행/숙박/항공, 안전거래)
	public static final String INSERT_QNA_ARTICLE = "INSERT INTO `km_cs` SET "
													+ "`uid`=?, "
													+ "`cate1`=?, "
													+ "`cate2`=?, "
													+ "`type`=?, "
													+ "`title`=?, "
													+ "`content`=?, "
													+ "`regip`=?, "
													+ "`rdate`=NOW()";
	
	public static final String SELECT_NOTICE_ALL = "SELECT * FROM `km_cs` WHERE `cate1`='notice' ORDER BY `rdate` DESC;";
	
	public static final String SELECT_CS_ARTICLE = "SELECT * FROM `km_cs` WHERE `csNo`=?";
	
	public static final String SELECT_QNA_ALL = "SELECT * FROM `km_cs` WHERE `cate1`='qna' ORDER BY `rdate` DESC;";
}
