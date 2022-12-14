package kr.co.Kmarket.service;

import kr.co.Kmarket.dao.CsDAO;
<<<<<<< HEAD
=======
import kr.co.Kmarket.vo.CsVO;
>>>>>>> 5761965c04c3cb5e695714adf2ef4ecb5f245dbf

public class CsService {
	
	private CsDAO dao;
	
	public CsService() {
		dao = new CsDAO();
	}
	
<<<<<<< HEAD
	public void insertArticle() {
		
=======
	public int insertQnaArticle(CsVO cvo) {
		return dao.insertQnaArticle(cvo);
>>>>>>> 5761965c04c3cb5e695714adf2ef4ecb5f245dbf
	}
	public void select() {}
	public void selects() {}
	public void update() {}
	public void delete() {}
	

}
