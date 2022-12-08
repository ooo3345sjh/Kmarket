package kr.co.Kmarket.service;

import kr.co.Kmarket.dao.ProductDAO;

public enum ProductService {

	INSTANCE;
	private ProductDAO dao;
	private ProductService() {
		dao = new ProductDAO();
	}
	
	
}
