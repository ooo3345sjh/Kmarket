package kr.co.Kmarket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public void deleteProduct () {}
	
	/*** main ***/
	// 메인 페이지 베스트 상품, 히트 상품, 최신 상품, 할인 상품
	public Map<String, Object> selectBestProducts () {
		Map<String, Object> map = null;
		List<ProductVO> bestList = null;
		List<ProductVO> hitList = null;
		List<ProductVO> scoreList = null;
		List<ProductVO> discountList = null;
		List<ProductVO> newList = null;
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
			
			while(rs.next()) {
				ProductVO vo = new ProductVO();
				String type  = rs.getString(1); // 타입 - 베스트:best , 히트:hit, 추천:score, 최신:new, 할인:discount
				String cate1 = rs.getString("cate1");
				String cate2 = rs.getString("cate2");
				String path = "file/" + cate1 + "/" + cate2 + "/";
				vo.setProdNo(rs.getInt("prodNo"));
				vo.setCate1(cate1);
				vo.setCate2(cate2);
				vo.setProdName(rs.getString("prodName"));
				vo.setDescript(rs.getString("descript"));
				vo.setCompany(rs.getString("company"));
				vo.setSeller(rs.getString("seller"));
				vo.setPrice(rs.getString("price"));
				vo.setDiscount(rs.getInt("discount"));
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
				}
				
				
			}
			map = new HashMap<>();
			map.put("best", bestList);
			map.put("hit", hitList);
			map.put("score", scoreList);
			map.put("discount", discountList);
			map.put("new", newList);
			
			logger.debug("bestListSize : " + bestList.size());
			logger.debug("hitListSize : " + hitList.size());
			logger.debug("scoreListSize : " + scoreList.size());
			logger.debug("discountListSize : " + discountList.size());
			logger.debug("newListSize : " + newList.size());
			
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("map : " + map);
		return map;
	}
}
