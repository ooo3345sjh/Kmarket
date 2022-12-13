package kr.co.Kmarket.dao;

import java.util.ArrayList;
import java.util.List;

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
				prod.setProdNo(rs.getInt(1));
				prod.setCate1(rs.getInt(2));
				prod.setCate2(rs.getInt(3));
				prod.setProdName(rs.getString(4));
				prod.setDescript(rs.getString(5));
				prod.setCompany(rs.getString(6));
				prod.setSeller(rs.getString(7));
				prod.setPrice(rs.getInt(8));
				prod.setDiscount(rs.getInt(9));
				prod.setPoint(rs.getInt(10));
				prod.setStock(rs.getInt(11));
				prod.setSold(rs.getInt(12));
				prod.setDelivery(rs.getInt(13));
				prod.setHit(rs.getInt(14));
				prod.setScore(rs.getInt(15));
				prod.setReview(rs.getInt(16));
				prod.setThumb1(rs.getString(17));
				prod.setThumb2(rs.getString(18));
				prod.setThumb3(rs.getString(19));
				prod.setDetail(rs.getString(20));
				prod.setStatus(rs.getString(21));
				prod.setDuty(rs.getString(22));
				prod.setReceipt(rs.getString(23));
				prod.setBizType(rs.getString(24));
				prod.setOrigin(rs.getString(25));
				prod.setIp(rs.getString(26));
				prod.setRdate(rs.getString(27));
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
	public void deleteProduct () {}

}
