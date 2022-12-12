package kr.co.Kmarket.utils.autoUpload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.ProductVO;

public class AutoUploadDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public int insertAutoUpload (List<XmlVO> list, String cate1, String cate2) {
		int result = 0;
		try {
			logger.info("insertAutoUpload...");
			Connection conn = getConnection();
			
			String sql = "INSERT INTO `km_product` "
					+ "(`cate1`, `cate2`, `prodName`, `descript`, `company`, `seller`, `price`, `discount`, `point`, `stock`, `sold`, `delivery`, `hit`,"
					+ " `score`, `review`, `thumb1`, `thumb2`, `thumb3`, `detail`, `status`, `duty`, `receipt`, `bizType`, `origin`, `ip`, `rdate`) VALUES ";
			int i = 1;
			for(XmlVO xv : list) {
				System.out.println("title check : " + xv.getTitle());
				if(list.size() == i) {
					sql += "(" + cate1 + ", " + cate2 + ", ?, ?, ?, 'a101', ?, 0, 0, 0, 0, 0, 0, 0, 0, ?, ?, ?, ?,"
							+ " '새상품', '과세상품', '발행가능 - 신용카드 전표, 온라인 현금영수증', '사업자 판매자', '국내산', '0:0:0:0:0:0:0:1', NOW())";
				} else {
					sql += "(" + cate1 + ", " + cate2 + ", ?, ?, ?, 'a101', ?, 0, 0, 0, 0, 0, 0, 0, 0, ?, ?, ?, ?,"
							+ " '새상품', '과세상품', '발행가능 - 신용카드 전표, 온라인 현금영수증', '사업자 판매자', '국내산', '0:0:0:0:0:0:0:1', NOW()), ";
				}
				i++;
			}
			
			PreparedStatement psmt = conn.prepareStatement(sql);
			i = 1;
			for(XmlVO xv : list) {
				psmt.setString(i++, xv.getTitle());
				psmt.setString(i++, xv.getTitle());
				psmt.setString(i++, xv.getCompany());
				psmt.setInt(i++, xv.getPrice());
				psmt.setString(i++, xv.getThumb1());
				psmt.setString(i++, xv.getThumb2());
				psmt.setString(i++, xv.getThumb3());
				psmt.setString(i++, xv.getDetail());
			}
			result = psmt.executeUpdate();
			
			
			psmt.close();
			conn.close();
		
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	public void selectProduct () {}
	public void selectProducts () {}
	public void updateProduct () {}
	public void deleteProduct () {}

}
