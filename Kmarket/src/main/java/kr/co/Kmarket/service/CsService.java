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
	
	public int insertQnaArticle(CsVO cvo) {
		return dao.insertQnaArticle(cvo);
	}
	public void select() {}
	
	
	//public List<CsVO> selectQnaArticles(int start) {
	//	return dao.selectQnaArticles(start);
	//}
	
	public void countQnaArticles(Map<String, Object> map) {
		dao.countQnaArticles(map);
	}
	
	public void update() {}
	public void delete() {}
	

}
