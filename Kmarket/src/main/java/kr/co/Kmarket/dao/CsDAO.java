package kr.co.Kmarket.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.CsVO;

public class CsDAO extends DBHelper {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		
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
	}
	public void select() {}
	
	public void selectQnaArticles(Map<String, Object> map) {
		List<CsVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		String group = (String)map.get("group");
		
		String sql = "SELECT * FROM `km_cs`";
		
		if(!group.equals("admin")) {
			sql += "WHERE `cate1` = '"+cate1+"' AND `cate2`='"+cate2+"'";
		}
		sql += "ORDER BY `csNo` desc LIMIT ?,10";
		
		try {
			logger.info("selectProducts...");
			con = getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int)map.get("limitStart"));
			list = new ArrayList<>();
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CsVO cvo = new CsVO();
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setContent(rs.getString("content"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				
				list.add(cvo);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void countQnaArticles(Map<String, Object> map) {
		int totalCount = 0;
		try {
			
			logger.info("selectCountTotal...");
			
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			String group = (String)map.get("group");
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(`csNo`)FROM `km_cs` ");
			
			if(!group.equals("cs")) { // 그룹명(자칭)이 cs가 아니라면
				sql.append("WHERE `cate1` = '"+cate1+"' AND `cate2`= '"+cate2+"'");
			}
			
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("totalCount : "+totalCount);
		
		map.put("totalCount", totalCount);
	}
	
	public void update() {}
	public void delete() {}
	
}
