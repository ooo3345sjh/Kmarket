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
	
	public static final String SELECT_COUNT_TOTAL_PROD = "SELECT COUNT(`no`) FROM `km_product";

}
