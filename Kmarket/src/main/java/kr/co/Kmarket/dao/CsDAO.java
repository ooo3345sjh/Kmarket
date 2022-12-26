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
			psmt.setString(2, cvo.getCate1());
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
	
	public CsVO viewArticle(String csNo) {
		CsVO cvo = null;
		
		try {
			
			logger.info("viewArticles...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_CS_ARTICLE);
			psmt.setString(1, csNo);
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
			}
			
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return cvo;
	}
	
	
	/* 자주묻는 질문 목록 */
	public void selectFaqArticle(Map<String, Object> map) {
		List<CsVO> faqlist = null;
		
		String cate2 = (String)map.get("cate2");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append("SELECT DISTINCT `cate1`, `cate2`, `type`, `title` FROM `km_cs` WHERE `cate1` = 'faq'");
		
		// type 불러오기
		if(cate2.equals("user")) { // cate2가 'user' 라면 중복되지 않은 type들 나옴
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
	
	/* 공지사항 전체보기 */
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
				
				list1.add(cvo1);
			}
			close();
			
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return list1;
	}
	
	public void selectArticles(Map<String, Object> map) {
		List<CsVO> list = null;
		
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		
		String sql = "SELECT *, "
				   + " ROW_NUMBER() OVER(ORDER BY `csNo` desc) rnum "
			       + " FROM `km_cs` "
			       + " WHERE `cate1`='" + cate1 + "' AND `cate2`='" + cate2 + "'"
			       + " LIMIT ?, 10"; // 게시물 구간을 인파라미터로 받기
			  
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
			
			logger.info("selectCountTotal...");
			
			String cate1 = (String)map.get("cate1");
			String cate2 = (String)map.get("cate2");
			
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(`csNo`)FROM `km_cs` WHERE `cate1` = '" + cate1 + "' AND `cate2`='" + cate2 + "'");
			
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
	
	public void updateHit(String csNo) {
		try {
			logger.info("updateHit...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.UPDATE_HIT);
			psmt.setString(1, csNo);
			psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public int updateArticle(String type, String title, String content, String no) {
		int result = 0;
		try{
			logger.info("updateArticle...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.UPDATE_ARITLCE);
			psmt.setString(1, type);
			psmt.setString(2, title);
			psmt.setString(3, content);
			psmt.setString(4, no);
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	
	public int deleteArticle(String csNo) {
		int result = 0;
		try {
			con = getConnection();
			psmt = con.prepareStatement(Sql.DELECT_ARTICLE);
			psmt.setString(1, csNo);
			result = psmt.executeUpdate();
			
			close();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}
		return result;
	}
	
	
	/*** admin ***/
	
	/* 관리자 페이지 최신글 보기 */
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
				latests.add(vo);
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return latests;
	}
	
	
}
