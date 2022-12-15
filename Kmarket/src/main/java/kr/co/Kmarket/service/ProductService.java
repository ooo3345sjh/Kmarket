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
	
	//====== list ======//
	/*** 검색 조건에 해당하는 상품 목록 전체 개수 구하는 서비스 ***/ 
	public void countProducts(Map<String, Object> map) {
		dao.countProducts(map);
	}
	
	/*** 검색 조건에 맞는 상품 목록을 반환하는 메서드 ***/
	public void selectProducts(Map<String, Object> map) {
		dao.selectProducts(map);
	}
	
}
