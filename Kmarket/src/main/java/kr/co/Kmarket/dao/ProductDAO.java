package kr.co.Kmarket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.OrderItemVO;
import kr.co.Kmarket.vo.OrderVO;
import kr.co.Kmarket.vo.ProductVO;
import kr.co.Kmarket.vo.ReviewVO;

public class ProductDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertProduct (ProductVO vo) {
		
		try {
			logger.info("insertProduct...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_PRODUCT);
			psmt.setInt(1, vo.getCate1());
			psmt.setInt(2, vo.getCate2());
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setString(6, vo.getSeller());
			psmt.setInt(7, vo.getPrice());
			psmt.setInt(8, vo.getDiscount());
			psmt.setInt(9, vo.getPoint());
			psmt.setInt(10, vo.getStock());
			psmt.setInt(11, vo.getDelivery());
			psmt.setString(12, vo.getThumb1());
			psmt.setString(13, vo.getThumb2());
			psmt.setString(14, vo.getThumb3());
			psmt.setString(15, vo.getDetail());
			psmt.setString(16, vo.getStatus());
			psmt.setString(17, vo.getDuty());
			psmt.setString(18, vo.getReceipt());
			psmt.setString(19, vo.getBizType());
			psmt.setString(20, vo.getOrigin());
			psmt.setString(21, vo.getIp());
			psmt.executeUpdate();

			close();
		
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}


	public List<ProductVO> selectProducts (int start) {
		
		List<ProductVO> vo = new ArrayList<>();
		try {
			logger.info("selectProducts...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_PRODUCTS);
			psmt.setInt(1, start);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO prod = new ProductVO();
				String cate1 = rs.getString("cate1");
				String cate2 = rs.getString("cate2");
				String path = "/file/" + cate1 + "/" + cate2 + "/";
				prod.setProdNo(rs.getInt("prodNo"));
				prod.setCate1(cate1);
				prod.setCate2(cate2);
				prod.setProdName(rs.getString("prodName"));
				prod.setDescript(rs.getString("descript"));
				prod.setCompany(rs.getString("company"));
				prod.setSeller(rs.getString("seller"));
				prod.setPrice(rs.getInt("price"));
				prod.setDiscount(rs.getInt("discount"));
				prod.setPoint(rs.getInt("point"));
				prod.setStock(rs.getInt("stock"));
				prod.setSold(rs.getInt("sold"));
				prod.setDelivery(rs.getInt("delivery"));
				prod.setHit(rs.getInt("hit"));
				prod.setScore(rs.getInt("score"));
				prod.setReview(rs.getInt("review"));
				prod.setThumb1(path + rs.getString("thumb1"));
				prod.setThumb2(path + rs.getString("thumb2"));
				prod.setThumb3(path + rs.getString("thumb3"));
				prod.setDetail(path + rs.getString("detail"));
				prod.setStatus(rs.getString("status"));
				prod.setDuty(rs.getString("duty"));
				prod.setReceipt(rs.getString("receipt"));
				prod.setBizType(rs.getString("bizType"));
				prod.setOrigin(rs.getString("origin"));
				prod.setIp(rs.getString("ip"));
				prod.setRdate(rs.getString("rdate"));
				vo.add(prod);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return vo;
	}
  
	public int selectCountTotalProduct() {
		int total = 0;
		try {
			logger.info("selectCountTotal...");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL_PROD);
			if(rs.next()) {
				total = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return total;
	}
	// ?????? ?????? ??????
	public int updateProduct (ProductVO vo) {
		int result = 0;
		try {
			logger.info("updateProduct...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.UPDATE_PRODUCT);
			psmt.setString(1, vo.getProdName());
			psmt.setInt(2, vo.getPrice());
			psmt.setInt(3, vo.getDiscount());
			psmt.setInt(4, vo.getPoint());
			psmt.setInt(5, vo.getStock());
			psmt.setInt(6, vo.getProdNo());
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	// ?????? ??????
	public int deleteProduct (String prodNo) {
		int result = 0;
		try {
			logger.info("deleteProduct...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.DELETE_PRODUCT);
			psmt.setString(1, prodNo);
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	/*** main ***/
	/* ?????? ????????? ????????? ??????, ?????? ??????, ?????? ??????, ?????? ??????, ???????????? */
	public Map<String, Object> selectBestProducts () {
		Map<String, Object> map = null;
		List<ProductVO> bestList = null;
		List<ProductVO> hitList = null;
		List<ProductVO> scoreList = null;
		List<ProductVO> discountList = null;
		List<ProductVO> newList = null;
		List<ProductVO> favoriteList = null;
		try {
			logger.info("selectBestProducts...");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_BEST_PRODUCTS);
			
			bestList = new ArrayList<>();
			hitList = new ArrayList<>();
			scoreList = new ArrayList<>();
			discountList = new ArrayList<>();
			newList = new ArrayList<>();
			favoriteList = new ArrayList<>();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				String type  = rs.getString(1); // ?????? - ?????????:best , ??????:hit, ??????:score, ??????:new, ??????:discount, ??????:favorite
				String cate1 = rs.getString("cate1");              // ????????????1
				String cate2 = rs.getString("cate2");			   // ????????????2
				String path = "file/" + cate1 + "/" + cate2 + "/"; // ????????? ????????????
				int price = rs.getInt("price");                    // ?????? ??????
				int discount = rs.getInt("discount");			   // ?????????
				int discountPrice = (int)(price - (price * (discount/100.0))); // ?????? ?????? ????????? ??????
				logger.debug("discount : " + discount);
				logger.debug("discountPrice : " + discountPrice);				
				logger.debug("price : " + price);				
				vo.setDiscountPrice(discountPrice);
				vo.setProdNo(rs.getInt("prodNo"));
				vo.setCate1(cate1);
				vo.setCate2(cate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(price);
				vo.setDiscount(discount);
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				
				switch(type) {
					case "best":
						bestList.add(vo);
						break;
					case "hit":
						hitList.add(vo);
						break;
					case "score":
						scoreList.add(vo);
						break;
					case "discount":
						discountList.add(vo);
						break;
					case "new":
						newList.add(vo);
						break;
					case "favorite":
						favoriteList.add(vo);
						break;
				}
				
				
			}
			map = new HashMap<>();
			map.put("best", bestList);
			map.put("hit", hitList);
			map.put("score", scoreList);
			map.put("discount", discountList);
			map.put("newProd", newList);
			map.put("favorite", favoriteList);
			
			logger.debug("bestListSize : " + bestList.size());
			logger.debug("hitListSize : " + hitList.size());
			logger.debug("scoreListSize : " + scoreList.size());
			logger.debug("discountListSize : " + discountList.size());
			logger.debug("newListSize : " + newList.size());
			logger.debug("favoriteListSize : " + favoriteList.size());
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("map : " + map);
		return map;
	}
	
	
	/*** product ***/
	/** list **/
	/* ?????? ????????? ???????????? ?????? ?????? ?????? ?????? ????????? ????????? */
	public void countProducts(Map<String, Object> map) {
		int totalCount = 0; // ?????? ????????? ?????? ?????? 
		
		try {
			
			logger.info("countProducts...");
			
			String searchField = (String)map.get("searchField");
			String searchWord = (String)map.get("searchWord");
			String uid = (String)map.get("uid");
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			String group = (String)map.get("group");
			String type = (String)map.get("type");		// product_list ?????? ???????????????, ???????????????, ???????????????...????????? ?????????????????? ??????
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(`prodNo`) FROM `km_product` ");
			

			if(!group.contains("admin")) {	// ???????????? admin??? ????????????
				sql.append("WHERE `cate1` = '" + cate1 + "' AND `cate2`= '" + cate2 + "' ORDER BY " + type + " DESC");
			} 
			
			else {	// ???????????? admin?????????
				int types = (int)map.get("types");	// ?????? ?????? ??????
				if (types == 2) {
					// ?????? ????????? ????????? ????????????
					sql.append("WHERE `seller` = '"+ uid + "'" );
					if(searchWord != null) {	// ?????? ????????? ?????? ??????
						// ?????? ????????? ????????? AND??? ??????
						sql.append("AND `" + searchField + "` ");
						sql.append("LIKE '%" + searchWord + "%'");  
						}
					} else {
						// ?????? ????????? ???????????????
						if(searchWord != null) {	// ?????? ????????? ?????? ??????
							// ?????? ????????? ????????? WHERE??? ??????
							sql.append("WHERE `" + searchField + "` ");
							sql.append("LIKE '%" + searchWord + "%'");  
							}
					}
				
			}
	
				
		
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
			close();
		
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("totalCount : " + totalCount);
		
		map.put("totalCount", totalCount);
	};
	
	/* ?????? ????????? ?????? ?????? ????????? ???????????? ????????? */
	public void selectProducts(Map<String, Object> map){
		List<ProductVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		String group = (String)map.get("group");
		String sort = (String)map.get("sort"); // product_list?????? ????????? ???????????? ????????????.
		
		String sql = "SELECT p.*, s.`level` FROM `km_product` p JOIN `km_member_seller` s on p.`seller` = s.`uid` ";
		
		if(group.contains("admin")) {	// ???????????? admin?????????
			int types = (int)map.get("types");
			// ?????? ????????? ????????? ?????? ??????
			if(types == 2) {
				// ?????? ????????? ????????? WHERE??? ??????
				if(map.get("searchField") != null) {
					sql += " WHERE s.`uid` = '" + map.get("uid") + "' AND p.`" + map.get("searchField") + "` LIKE '%" + map.get("searchWord") + "%' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				} else {
					sql += " WHERE s.`uid` = '" + map.get("uid") + "' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				}
			}
			// ?????? ????????? ????????? ??????
			else {
				if(map.get("searchField") != null) {
					sql += " WHERE p.`" + map.get("searchField") + "` LIKE '%" + map.get("searchWord") + "%' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				} else {
					sql += " ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				}
			}
		}
		
		else {	// ???????????? admin??? ????????????
			String desc_asc = sort.equals("rowPrice") ? "asc":"desc"; // ?????? ??????????????? ???????????? sql?????? asc??? ????????????. ??? ????????? ?????? desc
			if(sort.equals("rowPrice") || sort.equals("highPrice")) sort = "price"; // ?????????????????? sort???????????? ??????????????? ??????
			sql += "WHERE p.`cate1` = '" + cate1 + "' AND p.`cate2`= '" + cate2 + "'"
				+ " ORDER BY p.`" + sort + "` " + desc_asc + "  LIMIT ?, 10";
		}
		
		try {
			logger.info("selectProducts...");
			con = getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int)map.get("limitStart"));
			list = new ArrayList<>();
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				String path = "/file/" + cate1 + "/" + cate2 + "/"; // ????????? ????????????
				int price = rs.getInt("price");                    // ?????? ??????
				int discount = rs.getInt("discount");			   // ?????????
				int discountPrice = price - (int)(price * (discount/100.0)); // ?????? ?????? ????????? ??????
				logger.debug("discount : " + discount);
				logger.debug("discountPrice : " + discountPrice);				
				logger.debug("price : " + price);				
				vo.setDiscountPrice(discountPrice);
				vo.setProdNo(rs.getInt("prodNo"));
				if(group.contains("admin")) {
					String acate1 = rs.getString("cate1");
					String acate2 = rs.getString("cate2");
					path = "/file/" + acate1 + "/" + acate2 + "/"; // ????????? ????????????
				}
				vo.setCate1(rs.getString("cate1"));
				vo.setCate2(rs.getString("cate2"));					
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(price);
				vo.setDiscount(discount);
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
				vo.setSellerLevel(rs.getInt("level"));
				
				list.add(vo);
			}
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
				
		map.put("products", list);
		logger.debug(" list : " + list);
		logger.debug(" map : " + map);
	}
	
	/** view **/
	/* ????????? ???????????? ????????? ?????? ????????? ?????? */
	public ProductVO selectProduct(String prodNo) {
		ProductVO vo = null;
		try {
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_PRODUCT);
			psmt.setString(1, prodNo);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new ProductVO();
				int price = rs.getInt("price");                    // ?????? ??????
				int discount = rs.getInt("discount");			   // ?????????
				int discountPrice = price - (int)(price * (discount/100.0)); // ?????? ?????? ????????? ??????
				vo.setDiscountPrice(discountPrice);
				vo.setProdNo(rs.getInt("prodNo"));
				vo.setCate1(rs.getString("cate1"));
				vo.setCate2(rs.getString("cate2"));					
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // ????????? ????????????
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(price);
				vo.setDiscount(discount);
				vo.setPoint(rs.getInt("point"));
				vo.setStock(rs.getInt("stock"));
				vo.setSold(rs.getInt("sold"));
				vo.setDelivery(rs.getInt("delivery"));
				vo.setHit(rs.getInt("hit"));
				vo.setScore(rs.getInt("score"));
				vo.setReview(rs.getInt("review"));
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setThumb2(path + rs.getString("thumb2"));
				vo.setThumb3(path + rs.getString("thumb3"));
				vo.setDetail(path + rs.getString("detail"));
				vo.setStatus(rs.getString("status"));
				vo.setDuty(rs.getString("duty"));
				vo.setReceipt(rs.getString("receipt"));
				vo.setBizType(rs.getString("bizType"));
				vo.setOrigin(rs.getString("origin"));
				vo.setIp(rs.getString("ip"));
				vo.setRdate(rs.getString("rdate"));
			}
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("productVo : " + vo);
		return vo;
	}
	
	/* ????????? ????????? ????????? ?????? ?????? */
	public void selectCountReviews(Map<String, Object> map) {
		String prodNo = (String)map.get("prodNo");
		logger.debug(prodNo);
		int totalCount = 0;
		try {
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_COUNT_REVIEWS);
			psmt.setString(1, prodNo);
			rs = psmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
				logger.debug("totalCount : "+totalCount);
			}
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("totalCount : " + totalCount);
		map.put("totalCount", totalCount);
	}
	
	/* ?????? ????????? ?????? ?????? ????????? ???????????? ????????? */
	public void selectReviews(Map<String, Object> map){
		List<ReviewVO> list = null;
		String prodNo = (String)map.get("prodNo");
		try {
			logger.info("selectReviews...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_REVIEWS);
			psmt.setString(1, prodNo);
			psmt.setInt(2, (int)map.get("limitStart"));
			list = new ArrayList<>();
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setRevNo(rs.getInt(1));
				vo.setProdNo(rs.getInt(2));
				vo.setUid(rs.getString(3));
				vo.setContent(rs.getString(4));
				vo.setRating(rs.getInt(5));
				vo.setRegip(rs.getString(6));
				vo.setRdate(rs.getString(7));
				
				list.add(vo);
			}
			
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
				
		map.put("reviews", list);
		logger.debug(" list : " + list);
		logger.debug(" map : " + map);
	}
	
	/** cart **/
	// ????????? ???????????? ?????? ?????? ????????? ???????????? ?????????
	public int insertProductInCart(CartVo vo) {
		int result = 0;
		try {
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_PRODUCT_IN_CART);
			psmt.setInt(1, vo.getProdNo());
			psmt.setString(2, vo.getUid());
			psmt.setInt(3, vo.getCount());
			psmt.setInt(4, vo.getPrice());
			psmt.setInt(5, vo.getDiscount());
			psmt.setInt(6, vo.getPoint());
			psmt.setInt(7, vo.getDelivery());
			psmt.setInt(8, vo.getTotal());
			
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	// ???????????? ???????????? ??????????????? ????????? ????????? ???????????? product_cart???????????? ???????????? ?????????
	public int insertProductsInCart(List<CartVo> cartList, String userID) {
		int result = 0;
		String sql = "INSERT INTO `km_product_cart`(`prodNo`, `uid`, `count`, `price`, `discount`, `point`, `delivery`, `total`, `rdate`) VALUES";
		for(int i=0; i<cartList.size(); i++) {
			if(i == cartList.size()-1) {
				sql += " (?,?,?,?,?,?,?,?, NOW())";
				break;
			}
			sql += " (?,?,?,?,?,?,?,?, NOW()), ";
		}
		try {
			logger.info("insertProductsInCart...");
			con = getConnection();
			psmt = con.prepareStatement(sql);
			int count = 1;
			for(int i=0; i<cartList.size(); i++) {
				psmt.setInt(count++, cartList.get(i).getProdNo());
				psmt.setString(count++, userID);
				psmt.setInt(count++, cartList.get(i).getCount());
				psmt.setInt(count++, cartList.get(i).getPrice());
				psmt.setInt(count++, cartList.get(i).getDiscount());
				psmt.setInt(count++, cartList.get(i).getPoint());
				psmt.setInt(count++, cartList.get(i).getDelivery());
				psmt.setInt(count++, cartList.get(i).getTotal());
			}
			
			result = psmt.executeUpdate();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	// ???????????? ?????? ????????? ???????????? ?????????
	public List<CartVo> selectProductInCart(String uid) {
		List<CartVo> list = null;
		
		try {
			logger.info("selectProductInCart...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_PRODUCT_IN_CART);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			list = new ArrayList<>();
			while(rs.next()) {
				CartVo vo = new CartVo();
				vo.setCartNo(rs.getInt(1));
				vo.setProdNo(rs.getInt(2));
				vo.setUid(rs.getString(3));
				vo.setCount(rs.getInt(4));
				vo.setPrice(rs.getInt(5));
				vo.setDiscount(rs.getInt(6));
				vo.setPoint(rs.getInt(7));
				vo.setDelivery(rs.getInt(8));
				vo.setTotal(rs.getInt(9));
				vo.setrdate(rs.getString(10));
				vo.setCate1(rs.getString("cate1"));
				vo.setCate2(rs.getString("cate2"));
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // ????????? ????????????
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("list : " + list);
		return list;
	}
	
	// ???????????? ?????? ?????? ??? ????????? ???????????? ???????????? ?????? ????????? ???????????? ????????? 
	public int deleteProductInCart(String[] cartNo) {
		int result = 0;
		String sql = "DELETE FROM `km_product_cart` WHERE `cartNo` IN(";
		
		for(int i=0; i<cartNo.length; i++) {
			if(i == cartNo.length-1) {
				sql += cartNo[i] + ")";
				break;
			}
			sql += cartNo[i] + ", ";
		}
				   
		try {
			logger.info("deleteProductInCart...");
			con = getConnection();
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	/** order **/
	/* ????????????????????? ????????? ?????? ????????? ???????????? ????????? */
	public List<CartVo> selectProductInCart(String[] cartNo) {
		List<CartVo> list = null;
		String sql = "SELECT * FROM `km_product_cart` c JOIN `km_product` p ON c.`prodNo` = p.`prodNo` "
				   + " WHERE c.`cartNo` IN(";
		
		for(int i=0; i<cartNo.length; i++) {
			if(i == cartNo.length-1) {
				sql += cartNo[i] + ")";
				break;
			}
			sql += cartNo[i] + ", ";
		}
		
		try {
			logger.info("selectProductInCart...");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			list = new ArrayList<>();
			while(rs.next()) {
				CartVo vo = new CartVo();
				vo.setCartNo(rs.getInt(1));
				vo.setProdNo(rs.getInt(2));
				vo.setUid(rs.getString(3));
				vo.setCount(rs.getInt(4));
				vo.setPrice(rs.getInt(5));
				vo.setDiscount(rs.getInt(6));
				vo.setPoint(rs.getInt(7));
				vo.setDelivery(rs.getInt(8));
				vo.setTotal(rs.getInt(9));
				vo.setrdate(rs.getString(10));
				vo.setCate1(rs.getString("cate1"));
				vo.setCate2(rs.getString("cate2"));
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // ????????? ????????????
				vo.setThumb1(path + rs.getString("thumb1"));
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("list : " + list);
		return list;
	}
	
	/* ????????? ?????? DB??? ???????????? ????????? */
	public int insertOrder(OrderVO vo, List<OrderItemVO> list, MemberVO user) {
		int result = 0;
		
		try {
			logger.info("insertOrder...");
			con = getConnection();
			con.setAutoCommit(false);
			
			// km_product_order??? ?????? ????????? ???????????? ???????????? ??????
			psmt = con.prepareStatement(Sql.INSERT_ORDER);
			psmt.setString(1, vo.getOrdNo());
			psmt.setString(2, vo.getUid());
			psmt.setInt(3, vo.getOrdCount());
			psmt.setInt(4, vo.getOrdPrice());
			psmt.setInt(5, vo.getOrdDiscount());
			psmt.setInt(6, vo.getOrdDelivery());
			psmt.setInt(7, vo.getSavePoint());
			psmt.setInt(8, vo.getUsedPoint());
			psmt.setInt(9, vo.getOrdTotPrice());
			psmt.setString(10, vo.getRecipName());
			psmt.setString(11, vo.getRecipHp());
			psmt.setString(12, vo.getRecipZip());
			psmt.setString(13, vo.getRecipAddr1());
			psmt.setString(14, vo.getRecipAddr2());
			psmt.setInt(15, vo.getOrdPayment());
			psmt.setInt(16, vo.getOrdComplete());
			psmt.setString(17, vo.getOrdState());
			
			psmt.executeUpdate();
			
			// km_product_order_item??? ????????? ?????? ???????????? ??????
			String sql = "INSERT INTO `km_product_order_item` VALUES";
			
			for(int i=0; i<list.size(); i++) {
				OrderItemVO oiv = list.get(i);
				sql += "('" + oiv.getOrdNo() + "', " + oiv.getProdNo() + ", " + oiv.getCount() + ", "
					+  oiv.getPrice() + ", " + oiv.getDiscount() + ", " + oiv.getPoint() + ", " + oiv.getDelivery() + ", "
					+ oiv.getTotal() + ")";
				
				if(i != list.size()-1) {
					sql += ", ";
				} 
			}
			
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
			// km_member_point ???????????? ????????? ????????? ???????????? ??????
			if(vo.getUsedPoint() != 0) {
				psmt.close();
				
				psmt = con.prepareStatement(Sql.INSERT_POINT);
				psmt.setString(1, vo.getUid());
				psmt.setString(2, vo.getOrdNo());
				psmt.setInt(3, vo.getUsedPoint() * -1);
				
				psmt.executeUpdate();
				
				// km_member ???????????? ????????? ????????? ???????????? ??????
				String mamberPointSql = "UPDATE ";
				
				if(user.getType() == 1 || user.getType() == 3) {
					mamberPointSql += " `km_member_general` ";
				} else {
					mamberPointSql += " `km_member_seller` ";
				}
				
				mamberPointSql += "SET `point` = " +  (user.getPoint() - vo.getUsedPoint()) + " WHERE `uid`= '" + user.getUid() + "'";
				
				stmt.close();
				stmt = con.createStatement();
				result = stmt.executeUpdate(mamberPointSql);
			}
			
			con.commit();
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	/* ????????????????????? ?????????????????? ??? ?????? ????????? ????????? ???????????? ??????????????? ???????????? ????????? */
	public int deleteProdcuctInCart(String[] cartNo) {
		int result = 0;
		
		String sql = "DELETE FROM `km_product_cart` `cartNo` IN(";
		
		for(int i=0; i<cartNo.length; i++) {
			if(i == cartNo.length-1) {
				sql += "'" + cartNo[i] + "') ";
				break;
			}
			sql += "'" + cartNo[i] + "', ";
		}
		
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		logger.debug("result : " + result);
		return result;
	}
}
