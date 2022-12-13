package kr.co.Kmarket.service;

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

	public int selectCountTotalProduct() {
		int total = dao.selectCountTotalProduct();
		return total;
	}
	public void updateProduct () {}
	public void deleteProduct () {}
	
	
	public Map<String, Object> selectBestProducts () {
		return dao.selectBestProducts();
	}
	
}
