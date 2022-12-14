package kr.co.Kmarket.service;

import java.util.Map;

import java.util.List;

import java.util.Map;


import kr.co.Kmarket.dao.ProductDAO;
import kr.co.Kmarket.vo.ProductVO;

public class ProductService {

	private ProductDAO dao;
	
	public ProductService() {
		dao = new ProductDAO();
	}
	
	public void insertProduct (ProductVO vo) {
		dao.insertProduct(vo);
	}
	public void selectProduct () {}


	public List<ProductVO> selectProducts (int start) {
		return dao.selectProducts(start);
	}




	public int selectCountTotalProduct() {
		int total = dao.selectCountTotalProduct();
		return total;
	}
	public void updateProduct () {}
	public int deleteProduct (String prodNo) {
		int result = dao.deleteProduct(prodNo);
		return result;
	}
	
	
	public Map<String, Object> selectBestProducts () {
		return dao.selectBestProducts();
	}
	
}
