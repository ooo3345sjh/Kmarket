package kr.co.Kmarket.service;

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
	public void selects() {}
	public void update() {}
	public void delete() {}
	

}
