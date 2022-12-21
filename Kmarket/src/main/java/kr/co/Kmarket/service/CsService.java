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
	
	public CsVO viewArticle(String csNo) {
		return dao.viewArticle(csNo);
	}
	
	public List<CsVO> selectNoticeAll() {
		return dao.selectNoticeAll();
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
	
	public void countArticles(Map<String, Object> map) {
		dao.countArticles(map);
	}
	
	public void update() {}
	public void delete() {}
	

}
