package kr.co.Kmarket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.ProductVO;

public class ProductDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertProduct (ProductVO vo) {
		
		try {
			logger.info("insertProduct...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_PRODUCT);
			psmt.setInt(1, vo.getCate1());
			psmt.setInt(2, vo.getCate2() + 10);
			psmt.setString(3, vo.getProdName());
			psmt.setString(4, vo.getDescript());
			psmt.setString(5, vo.getCompany());
			psmt.setInt(6, vo.getPrice());
			psmt.setInt(7, vo.getDiscount());
			psmt.setInt(8, vo.getPoint());
			psmt.setInt(9, vo.getStock());
			psmt.setInt(10, vo.getDelivery());
			psmt.setString(11, vo.getThumb1());
			psmt.setString(12, vo.getThumb2());
			psmt.setString(13, vo.getThumb3());
			psmt.setString(14, vo.getDetail());
			psmt.setString(15, vo.getStatus());
			psmt.setString(16, vo.getDuty());
			psmt.setString(17, vo.getReceipt());
			psmt.setString(18, vo.getBizType());
			psmt.setString(19, vo.getOrigin());
			psmt.setString(20, vo.getIp());
			psmt.executeUpdate();

			close();
		
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	public void selectProduct () {}


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
	public void updateProduct () {}
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
	// 메인 페이지 베스트 상품, 히트 상품, 최신 상품, 할인 상품, 인기상품
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
	
	
	//====== product-list ======//
	/*** 검색 조건에 해당하는 상품 목록 전체 개수 구하는 메서드 ***/
	public void countProducts(Map<String, Object> map) {
		int totalCount = 0; // 전체 게시물 저장 변수 
		
		try {
			
			logger.info("countProducts...");
			
			String searchField = (String)map.get("searchField");
			String searchWord = (String)map.get("searchWord");
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			String group = (String)map.get("group");
		
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(`prodNo`) FROM `km_product` ");
			

			if(!group.equals("admin")) {	// 그룹명이 admin이 아니라면
				sql.append("WHERE `cate1` = '" + cate1 + "' AND `cate2`= '" + cate2 + "'");
			} 
			
			else {	// 그룹명이 admin이라면
				// 검색 조건이 있다면 WHERE절 추가
				if(searchWord != null) {	// 검색 단어가 있을 경우
					sql.append("WHERE `" + searchField  + "` ");
					sql.append("LIKE '%" + searchWord   + "%'");  
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
	
	/*** 검색 조건에 맞는 상품 목록을 반환하는 메서드 ***/
	public void selectProducts(Map<String, Object> map){
		List<ProductVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		String group = (String)map.get("group");
		
		String sql = "SELECT p.*, s.`level` FROM `km_product` p JOIN `km_member_seller` s on p.`seller` = s.`uid` ";
		
		if(!group.equals("admin")) {	// 그룹명이 admin이 아니라면
			sql += "WHERE p.`cate1` = '" + cate1 + "' AND p.`cate2`= '" + cate2 + "'";
		}
		
		else {	// 그룹명이 admin이라면
			// 검색 조건이 있다면 WHERE절 추가
			if(map.get("searchField") != null) {
				sql += " WHERE p.`" + map.get("searchField") + "` LIKE '%" + map.get("searchWord") + "%' ";
			}
		}
		
		sql += " ORDER BY p.`ProdNo` desc  LIMIT ?, 10";
		
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
}
