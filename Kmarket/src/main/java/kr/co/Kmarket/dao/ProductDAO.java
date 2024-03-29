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
	// 상품 정보 수정
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
	// 상품 삭제
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
	/* 메인 페이지 베스트 상품, 히트 상품, 최신 상품, 할인 상품, 인기상품 */
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
				String type  = rs.getString(1); // 타입 - 베스트:best , 히트:hit, 추천:score, 최신:new, 할인:discount, 인기:favorite
				String cate1 = rs.getString("cate1");              // 카테고리1
				String cate2 = rs.getString("cate2");			   // 카테고리2
				String path = "file/" + cate1 + "/" + cate2 + "/"; // 이미지 저장경로
				int price = rs.getInt("price");                    // 상품 가격
				int discount = rs.getInt("discount");			   // 할인율
				int discountPrice = (int)(price - (price * (discount/100.0))); // 상품 할인 적용된 가격
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
	/* 검색 조건에 해당하는 상품 목록 전체 개수 구하는 메서드 */
	public void countProducts(Map<String, Object> map) {
		int totalCount = 0; // 전체 게시물 저장 변수 
		
		try {
			
			logger.info("countProducts...");
			
			String searchField = (String)map.get("searchField");
			String searchWord = (String)map.get("searchWord");
			String uid = (String)map.get("uid");
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			String group = (String)map.get("group");
			String type = (String)map.get("type");		// product_list 에서 판매목록순, 낮은가격순, 높은가격순...등으로 정렬하기위한 변수
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(`prodNo`) FROM `km_product` ");
			

			if(!group.contains("admin")) {	// 그룹명이 admin이 아니라면
				sql.append("WHERE `cate1` = '" + cate1 + "' AND `cate2`= '" + cate2 + "' ORDER BY " + type + " DESC");
			} 
			
			else {	// 그룹명이 admin이라면
				int types = (int)map.get("types");	// 유저 등급 확인
				if (types == 2) {
					// 최고 관리자 계정이 아니라면
					sql.append("WHERE `seller` = '"+ uid + "'" );
					if(searchWord != null) {	// 검색 단어가 있을 경우
						// 검색 조건이 있다면 AND절 추가
						sql.append("AND `" + searchField + "` ");
						sql.append("LIKE '%" + searchWord + "%'");  
						}
					} else {
						// 최고 관리자 계정이라면
						if(searchWord != null) {	// 검색 단어가 있을 경우
							// 검색 조건이 있다면 WHERE절 추가
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
	
	/* 검색 조건에 맞는 상품 목록을 반환하는 메서드 */
	public void selectProducts(Map<String, Object> map){
		List<ProductVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		String group = (String)map.get("group");
		String sort = (String)map.get("sort"); // product_list에서 정렬할 변수값을 가져온다.
		
		String sql = "SELECT p.*, s.`level` FROM `km_product` p JOIN `km_member_seller` s on p.`seller` = s.`uid` ";
		
		if(group.contains("admin")) {	// 그룹명이 admin이라면
			int types = (int)map.get("types");
			// 최고 관리자 계정이 아닌 경우
			if(types == 2) {
				// 검색 조건이 있다면 WHERE절 추가
				if(map.get("searchField") != null) {
					sql += " WHERE s.`uid` = '" + map.get("uid") + "' AND p.`" + map.get("searchField") + "` LIKE '%" + map.get("searchWord") + "%' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				} else {
					sql += " WHERE s.`uid` = '" + map.get("uid") + "' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				}
			}
			// 최고 관리자 계정인 경우
			else {
				if(map.get("searchField") != null) {
					sql += " WHERE p.`" + map.get("searchField") + "` LIKE '%" + map.get("searchWord") + "%' ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				} else {
					sql += " ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
				}
			}
		}
		
		else {	// 그룹명이 admin이 아니라면
			String desc_asc = sort.equals("rowPrice") ? "asc":"desc"; // 낮은 가격순으로 정렬시엔 sql문에 asc를 넣어준다. 이 외에는 전부 desc
			if(sort.equals("rowPrice") || sort.equals("highPrice")) sort = "price"; // 가격정렬시에 sort변수값을 컬럼값으로 변경
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
				String path = "/file/" + cate1 + "/" + cate2 + "/"; // 이미지 저장경로
				int price = rs.getInt("price");                    // 상품 가격
				int discount = rs.getInt("discount");			   // 할인율
				int discountPrice = price - (int)(price * (discount/100.0)); // 상품 할인 적용된 가격
				logger.debug("discount : " + discount);
				logger.debug("discountPrice : " + discountPrice);				
				logger.debug("price : " + price);				
				vo.setDiscountPrice(discountPrice);
				vo.setProdNo(rs.getInt("prodNo"));
				if(group.contains("admin")) {
					String acate1 = rs.getString("cate1");
					String acate2 = rs.getString("cate2");
					path = "/file/" + acate1 + "/" + acate2 + "/"; // 이미지 저장경로
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
	/* 조건에 해당하는 한개의 상품 데이터 조회 */
	public ProductVO selectProduct(String prodNo) {
		ProductVO vo = null;
		try {
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_PRODUCT);
			psmt.setString(1, prodNo);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new ProductVO();
				int price = rs.getInt("price");                    // 상품 가격
				int discount = rs.getInt("discount");			   // 할인율
				int discountPrice = price - (int)(price * (discount/100.0)); // 상품 할인 적용된 가격
				vo.setDiscountPrice(discountPrice);
				vo.setProdNo(rs.getInt("prodNo"));
				vo.setCate1(rs.getString("cate1"));
				vo.setCate2(rs.getString("cate2"));					
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // 이미지 저장경로
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
	
	/* 한개의 상품에 등록된 리뷰 조회 */
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
	
	/* 검색 조건에 맞는 리뷰 목록을 반환하는 메서드 */
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
	// 상품을 장바구니 담기 버튼 클릭시 추가하는 서비스
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
	
	// 비로그인 상태에서 장바구니에 등록한 상품을 로그인시 product_cart테이블에 넣기위한 서비스
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
	
	// 장바구니 담긴 상품을 조회하는 서비스
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
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // 이미지 저장경로
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
	
	// 장바구니 담긴 상품 중 체크된 상품으로 선택삭제 버튼 클릭시 삭제하는 서비스 
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
	/* 장바구니로부터 체크한 상품 목록을 가져오는 서비스 */
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
				String path = "/file/" + vo.getCate1() + "/" + vo.getCate2() + "/"; // 이미지 저장경로
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
	
	/* 주문한 상품 DB에 저장하는 메서드 */
	public int insertOrder(OrderVO vo, List<OrderItemVO> list, MemberVO user) {
		int result = 0;
		
		try {
			logger.info("insertOrder...");
			con = getConnection();
			con.setAutoCommit(false);
			
			// km_product_order에 최종 주문한 결제정고 추가하는 작업
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
			
			// km_product_order_item에 주문한 상품 추가하는 작업
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
			
			// km_member_point 테이블에 사용한 포인트 추가하는 작업
			if(vo.getUsedPoint() != 0) {
				psmt.close();
				
				psmt = con.prepareStatement(Sql.INSERT_POINT);
				psmt.setString(1, vo.getUid());
				psmt.setString(2, vo.getOrdNo());
				psmt.setInt(3, vo.getUsedPoint() * -1);
				
				psmt.executeUpdate();
				
				// km_member 테이블에 사용한 포인트 삭감하는 작업
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
	
	/* 장바구니로부터 주문페이지로 온 경우 주문한 상품을 장바구니 테이블에서 삭제하는 메서드 */
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
