package kr.co.Kmarket.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
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
	
		
	public int insertArticle(CsVO cvo) {
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
	
	public int insertAdminNoticeArticle(CsVO cvo) {
		int result = 0;
		try {
			logger.info("insertAdminNoticeArticle...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_ADMIN_NOTICE);
			psmt.setString(1, cvo.getUid());
			psmt.setString(2, cvo.getCate2());
			psmt.setString(3, cvo.getType());
			psmt.setString(4, cvo.getTitle());
			psmt.setString(5, cvo.getContent());
			psmt.setString(6, cvo.getRegip());
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	public int insertAdminFaqArticle(CsVO cvo) {
		int result = 0;
		try {
			logger.info("insertAdminNoticeArticle...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.INSERT_ADMIN_FAQ);
			psmt.setString(1, cvo.getUid());
			psmt.setString(2, cvo.getCate2());
			psmt.setString(3, cvo.getType());
			psmt.setString(4, cvo.getTitle());
			psmt.setString(5, cvo.getContent());
			psmt.setString(6, cvo.getRegip());
			
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	/* Reply ?????? ??????*/
	public int updateComment(CsVO comment) {
		
		int result = 0;
		try {
			logger.info("updateComment...");
			con = getConnection();

			psmt = con.prepareStatement(Sql.UPDATE_QNA_COMMENT);
			psmt.setString(1, comment.getComment());
			psmt.setInt(2, comment.getCsNo());

			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
		
	}
	
	public CsVO viewArticle(int csNo) {
		updateHit(csNo);
		
		CsVO cvo = null;
		
		try {
			
			logger.info("viewArticles...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_CS_ARTICLE);
			psmt.setInt(1, csNo);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				cvo = new CsVO();
				cvo.setCsNo(rs.getInt("csNo"));
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setContent(rs.getString("content"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				cvo.setHit(rs.getInt("hit"));
				cvo.setComment(rs.getString("comment"));
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cvo;
	}
	
	
	/* cs ????????? ???????????? ?????? ?????? */
	public void selectFaqArticle(Map<String, Object> map) {
		List<CsVO> faqlist = null;
		
		String cate2 = (String)map.get("cate2");
		String group = (String)map.get("group");
		StringBuffer sql = new StringBuffer();
		
		sql.append("SELECT DISTINCT `cate1`, `cate2`, `type`, `title` FROM `km_cs` WHERE `cate1` = 'faq'");
		
		if(group.equals("cs")) {
			if(cate2.equals("user")) { // cate2??? 'user' ?????? ???????????? ?????? type??? ??????
				sql.append("AND `cate2`= 'user'");
			}
			else if(cate2.equals("coupon")) {	// 
				sql.append("AND `cate2`= 'coupon'");
			}
			else if(cate2.equals("order")) {
				sql.append("AND `cate2`= 'order'");
			}
			else if(cate2.equals("delivery")) {
				sql.append("AND `cate2`= 'delivery'");
			}
			else if(cate2.equals("cancel")) {
				sql.append("AND `cate2`= 'cancel'");
			}
			else if(cate2.equals("travel")) {
				sql.append("AND `cate2`= 'travel'");
			}
			else if(cate2.equals("safeDeal")) {
				sql.append("AND `cate2`= 'safeDeal'");
			}
		}
		// type ????????????
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql.toString());
			faqlist = new ArrayList<>();
			
			while(rs.next()) {
				
				CsVO cvo = new CsVO();
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				
				faqlist.add(cvo);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		map.put("faqlist", faqlist);
		logger.debug(" faqlist : " + faqlist);
		logger.debug(" faq : " + map);
	}
	
	/* ???????????? ???????????? */
	public List<CsVO> selectNoticeAll() {
		List<CsVO> nlist = new ArrayList<>();
		
		try {
			logger.info("selectNoticeAll..");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_NOTICE_ALL);
			
			while(rs.next()) {
				CsVO cvo = new CsVO();
				cvo.setCsNo(rs.getString("csNo"));
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setHit(rs.getInt("hit"));
				cvo.setContent(rs.getString("content"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				
				nlist.add(cvo);
			}
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return nlist;
	}
	
	public List<CsVO> selectQnaAll() {
		List<CsVO> list1 = new ArrayList<>();
		try {
			logger.info("indexQnaArticles...");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_QNA_ALL);
			while(rs.next()) {
				CsVO cvo1 = new CsVO();
				cvo1.setCsNo(rs.getString("csNo"));
				cvo1.setUid(rs.getString("uid"));
				cvo1.setCate1(rs.getString("cate1"));
				cvo1.setCate2(rs.getString("cate2"));
				cvo1.setType(rs.getString("type"));
				cvo1.setTitle(rs.getString("title"));
				cvo1.setContent(rs.getString("content"));
				cvo1.setRegip(rs.getString("regip"));
				cvo1.setRdate(rs.getString("rdate"));
				cvo1.setComment(rs.getString("comment"));
				
				list1.add(cvo1);
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return list1;
	}
	
	public List<CsVO> selectFaqAll() {
		List<CsVO> faq = new ArrayList<>();
		try {
			logger.info("indexQnaArticles...");
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_FAQ_ALL);
			while(rs.next()) {
				CsVO cvo1 = new CsVO();
				cvo1.setCsNo(rs.getString("csNo"));
				cvo1.setUid(rs.getString("uid"));
				cvo1.setCate1(rs.getString("cate1"));
				cvo1.setCate2(rs.getString("cate2"));
				cvo1.setType(rs.getString("type"));
				cvo1.setTitle(rs.getString("title"));
				cvo1.setContent(rs.getString("content"));
				cvo1.setRegip(rs.getString("regip"));
				cvo1.setRdate(rs.getString("rdate"));
				cvo1.setHit(rs.getInt("hit"));
				
				faq.add(cvo1);
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return faq;
	}
	
	/* cs ????????? cate1, cate2??? ????????? ????????? ?????? */
	public void selectArticles(Map<String, Object> map) {
		List<CsVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		
		String sql = "SELECT *, "
				   + " ROW_NUMBER() OVER(ORDER BY `csNo` desc) rnum "
			       + " FROM `km_cs` ";
		
		if("all".equals(cate2)) {
			
			sql += " WHERE `cate1`='" + cate1 + "'";
			
		} else {
			
			sql += " WHERE `cate1`='" + cate1 + "' AND `cate2`='" + cate2 + "'";
			
		}
			       
		sql += " LIMIT ?, 10"; // ????????? ????????? ?????????????????? ??????
			  
		try {
			
			logger.info("selectArticles...");
			con = getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int)map.get("limitStart"));
			System.out.println((int)map.get("limitStart"));
			list = new ArrayList<>();
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				CsVO cvo = new CsVO();
				cvo.setCsNo(rs.getInt("csNo"));
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setContent(rs.getString("content"));
				cvo.setHit(rs.getInt("hit"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				cvo.setComment(rs.getString("comment"));
				list.add(cvo);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		map.put("articles", list);
		logger.debug(" list : " + list);
		logger.debug(" map : " + map);
	}
	
	/* admin_cs ????????? cate1, cate2??? ????????? ????????? ?????? */
	public void selectAdminArticles(Map<String, Object> map) {
		List<CsVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		String type = (String)map.get("type");
		
		String sql = "SELECT *, "
				+ " ROW_NUMBER() OVER(ORDER BY `csNo` desc) rnum "
				+ " FROM `km_cs` ";
		if(cate2 == null) {
			
			sql += " WHERE `cate1`='" + cate1 + "' ";
		
		} else {

			sql += " WHERE `cate1`='" + cate1 + "' AND `cate2` = '" + cate2 + "'";
			
		}
		
		if(type != null) {
			sql += " AND `type`='" + type + "'";
		}
		
		sql += " LIMIT ?, 10"; // ????????? ????????? ?????????????????? ??????
		
		try {
			
			logger.info("selectAdminArticles...");
			con = getConnection();
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, (int)map.get("limitStart"));
			System.out.println((int)map.get("limitStart"));
			list = new ArrayList<>();
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				CsVO cvo = new CsVO();
				cvo.setCsNo(rs.getInt("csNo"));
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setContent(rs.getString("content"));
				cvo.setHit(rs.getInt("hit"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				cvo.setComment(rs.getString("comment"));
				list.add(cvo);
			}
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		map.put("articles", list);
		logger.debug(" list : " + list);
		logger.debug(" map : " + map);
	}
	
	public void countArticles(Map<String, Object> map) {
		int totalCount = 0;
		try {
			
			logger.info("countArticles...");
			
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			
			StringBuffer sql = new StringBuffer();
			if("all".equals(cate2)) {
				sql.append("SELECT COUNT(`csNo`)FROM `km_cs` WHERE `cate1` = '" + cate1 + "'");
			} else {
				sql.append("SELECT COUNT(`csNo`)FROM `km_cs` WHERE `cate1` = '" + cate1 + "' AND `cate2`='" + cate2 + "'");
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
	
	// admin_cs
	public void countAdminArticles(Map<String, Object> map) {
		int totalCount = 0;
		try {
			
			logger.info("countAdminArticles...");
			
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			String type = (String)map.get("type");
			
			StringBuffer sql = new StringBuffer();
			if(cate2 == null) {
				sql.append("SELECT COUNT(`csNo`)FROM `km_cs` WHERE `cate1` = '" + cate1 + "'");
			} else {
				sql.append("SELECT COUNT(`csNo`)FROM `km_cs` WHERE `cate1` = '" + cate1 + "' AND cate2='" + cate2 + "'");
			}
			
			if(type != null) {
				sql.append(" AND `type`='" + type + "'");
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
	
	public void updateHit(int csNo) {
		int cnt = 0;
		int rs = 0;
		
		try {
			logger.info("updateHit...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.UPDATE_HIT);
			psmt.setInt(1, csNo);
			
			rs = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
	/* ?????? */
	public int updateArticle(String cate2, String type, String title, String content, String no) {
		int result = 0;
		try{
			logger.info("updateArticle...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.UPDATE_ARITLCE);
			psmt.setString(1, cate2);
			psmt.setString(2, type);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setString(5, no);
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	
	
	
	public int deleteArticle(String[] csNoArr) {
		String sql = "DELETE FROM `km_cs` WHERE `csNo` IN (";
		
		for(int i=0; i<csNoArr.length; i++) {
			if(i == csNoArr.length-1) {
				sql += csNoArr[i] + ")";
				break;
			}
			
			sql += csNoArr[i] + ", ";
		}
		
		int result = 0;
		try {
			con = getConnection();
			stmt = con.createStatement();
			result = stmt.executeUpdate(sql);
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("result : " + result);
		return result;
	}
	
	
	/*** admin ***/
	
	/* ????????? ????????? ????????? ?????? */
	public synchronized List<CsVO> selectLatest(String cate1){
		
		List<CsVO> latests = new ArrayList<>();
		
		try {
			logger.info("selectLatest...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_LATEST);
			psmt.setString(1, cate1);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				CsVO vo = new CsVO();
				vo.setCsNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setRdate(rs.getString(3).substring(2, 10));
				vo.setType(rs.getString(4));
				latests.add(vo);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return latests;
	}
	
	
	// cs_faq_list_sjh
	public void selectFaqArticles(Map<String, Object> map) {
		
		String cate2 = (String)map.get("cate2");
		
		String sql = "SELECT a.* FROM ( "
			       + "SELECT *, ROW_NUMBER() OVER (PARTITION BY `type` ORDER BY `rdate` desc) AS 'rank' "
				   + "FROM `km_cs`WHERE `cate1`='faq' AND	`cate2`='" + cate2 + "') a "
				   + "WHERE	a.`rank` <= 10 ";
		
		List<List<CsVO>> lists = new ArrayList<>();
		List<CsVO> list = new ArrayList<>();
		String type = null;
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				CsVO cvo = new CsVO();
				cvo.setCsNo(rs.getInt("csNo"));
				cvo.setUid(rs.getString("uid"));
				cvo.setCate1(rs.getString("cate1"));
				cvo.setCate2(rs.getString("cate2"));
				cvo.setType(rs.getString("type"));
				cvo.setTitle(rs.getString("title"));
				cvo.setContent(rs.getString("content"));
				cvo.setHit(rs.getInt("hit"));
				cvo.setRegip(rs.getString("regip"));
				cvo.setRdate(rs.getString("rdate"));
				cvo.setComment(rs.getString("comment"));
				
				if(type == null) { // type??? Null ??????

					type = cvo.getType();
					
				} else if (type.equals(cvo.getType())) { // type??? cvo.getType??? ?????????
	
					list.add(cvo);
				
				} else { // type??? Null??? ????????? cvo.getType??? ?????? ?????????
					logger.debug("list : " + list);
					type = cvo.getType();
					lists.add(list);
					list = new ArrayList<>();					
				}
			}
			close();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		map.put("faqLists", lists);
		logger.debug("map : " + map);
	}
	
	
}
