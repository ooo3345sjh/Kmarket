package kr.co.Kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
<<<<<<< HEAD
=======
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.CsVO;
>>>>>>> 5761965c04c3cb5e695714adf2ef4ecb5f245dbf

public class CsDAO extends DBHelper {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
<<<<<<< HEAD
	public void insertArticle() {
		
=======
	public int insertQnaArticle(CsVO cvo) {
		int result = 0;
		try {
			logger.info("insertQnaArticle...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_QNA_ARTICLE);
			psmt.setString(1, cvo.getUid());
			psmt.setString(2, cvo.getCate1());
			psmt.setString(3, cvo.getCate2());
			psmt.setString(4, cvo.getType());
			psmt.setString(5, cvo.getTitle());
			psmt.setString(6, cvo.getContent());
			psmt.setString(7, cvo.getRegip());
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
>>>>>>> 5761965c04c3cb5e695714adf2ef4ecb5f245dbf
	}
	public void select() {}
	public void selects() {}
	public void update() {}
	public void delete() {}
	
}
