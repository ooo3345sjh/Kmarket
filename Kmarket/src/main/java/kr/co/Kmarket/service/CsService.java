package kr.co.Kmarket.service;

import java.util.List;
import java.util.Map;

import kr.co.Kmarket.dao.CsDAO;
import kr.co.Kmarket.vo.CsVO;

public class CsService {
	
	private CsDAO dao;
	
	public CsService() {
		dao = new CsDAO();
	}
	
	public int insertArticle(CsVO cvo) {
		return dao.insertArticle(cvo);
	}
	public int insertAdminNoticeArticle(CsVO cvo) {
		return dao.insertAdminNoticeArticle(cvo);
	}
	
	public int insertAdminFaqArticle(CsVO cvo) {
		return dao.insertAdminFaqArticle(cvo);
	}
	
	public int updateComment(CsVO comment) {
		return dao.updateComment(comment);
	}
	
	public CsVO viewArticle(int csNo) {
		return dao.viewArticle(csNo);
	}
	
	public List<CsVO> selectNoticeAll() {
		return dao.selectNoticeAll();
	}
	
	public List<CsVO> selectFaqAll() {
		return dao.selectFaqAll();
	}
	
	public List<CsVO> selectQnaAll() {
		return dao.selectQnaAll();
	}

	public void selectFaqArticle(Map<String, Object> map) {
		dao.selectFaqArticle(map);
	}
	
	public void selectArticles(Map<String, Object> map) {
		 dao.selectArticles(map);
	}
	
	// cs_faq list를 가져오는 서비스 
	public void selectFaqArticles(Map<String, Object> map) {
		dao.selectFaqArticles(map);
	}
	
	public void countArticles(Map<String, Object> map) {
		dao.countArticles(map);
	}
	
	/*** admin_cs start ***/
	public void countAdminArticles(Map<String, Object> map) {
		dao.countAdminArticles(map);
	}
	
	public void selectAdminArticles(Map<String, Object> map) {
		dao.selectAdminArticles(map);
	}
	/*** admin_cs end ***/
	
	public int updateArticle(String cate2, String type, String title, String content, String no) {
		return dao.updateArticle(cate2, type, title, content, no);
	}
	public int deleteArticle(String csNo) {
		return dao.deleteArticle(csNo);
	}
	
	
	/*** admin index ***/
	// 관리자 페이지 최신글 보기
	public synchronized List<CsVO> selectLatest(String cate1) {
		return dao.selectLatest(cate1);
	}
	

}
