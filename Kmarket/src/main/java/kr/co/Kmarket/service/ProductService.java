package kr.co.Kmarket.service;

import kr.co.Kmarket.dao.ProductDAO;
import kr.co.Kmarket.vo.ProductVO;

public enum ProductService {

	INSTANCE;
	private ProductDAO dao;
	private ProductService() {
		dao = new ProductDAO();
	}
	
	public void insertProduct (ProductVO vo) {
		dao.insertProduct(vo);
	}
	public void selectProduct () {}
	public void selectProducts () {}
	public void updateProduct () {}
	public void deleteProduct () {}
	
}
