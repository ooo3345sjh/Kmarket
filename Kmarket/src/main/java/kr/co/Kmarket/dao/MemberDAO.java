package kr.co.Kmarket.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.TermsVO;

public class MemberDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember() {}
	public void selectMember() {}
	public void selectMembers() {}
	public TermsVO selectTerms() {
		logger.info("selectTerms...");
		TermsVO vo = null;
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				vo = new TermsVO();
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
				vo.setLocation(rs.getString(3));
				vo.setFinance(rs.getString(4));
				vo.setTax(rs.getString(5));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	// 아이디 중복 체크
	public int selectCountUid(String uid) {
		int result = 0;
		
		try {
			logger.info("selectCountUid...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public void updateMember() {}
	public void deleteMember() {}

}
