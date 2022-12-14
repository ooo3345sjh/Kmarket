package kr.co.Kmarket.db;

public class Sql {
	
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
	
	public static final String SELECT_COUNT_TOTAL_PROD = "SELECT COUNT(`no`) FROM `km_product`";
	
	
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

}
