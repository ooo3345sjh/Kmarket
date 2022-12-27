package kr.co.Kmarket.service;

import java.util.Map;

import javax.servlet.ServletContext;

import java.util.List;

import java.util.Map;


import kr.co.Kmarket.dao.ProductDAO;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.OrderItemVO;
import kr.co.Kmarket.vo.OrderVO;
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
	public int updateProduct (ProductVO vo) {
		return dao.updateProduct(vo);
	}
	public int deleteProduct (String prodNo) {
		return dao.deleteProduct(prodNo);
	}
	
	
	public Map<String, Object> selectBestProducts () {
		return dao.selectBestProducts();
	}
	
	/*** product ***/

	/** list **/
	/* 검색 조건에 해당하는 상품 목록 전체 개수 구하는 서비스 */ 
	public void countProducts(Map<String, Object> map) {
		dao.countProducts(map);
	}
	
	/* 검색 조건에 맞는 상품 목록을 반환하는 메서드 */
	public void selectProducts(Map<String, Object> map) {
		dao.selectProducts(map);
	}

	/** view **/
	/* 조건에 해당하는 한개의 상품 데이터 조회 */
	public ProductVO selectProduct(String prodNo) {
		return dao.selectProduct(prodNo);
	}
	
	/* 해당 상품에 등록된 리뷰 총 리뷰 갯수를 조회 */
	public void selectCountReviews(Map<String, Object> map) {
		dao.selectCountReviews(map);
	}
	
	/* 해당 상품에 등록된 모든 리뷰를 조회 */
	public void selectReviews(Map<String, Object> map) {
		dao.selectReviews(map);
	}
	
	/** cart **/
	/* 상품을 장바구니 담기 버튼 클릭시 추가하는 서비스 */
	public int insertProductInCart(CartVo vo) {
		return dao.insertProductInCart(vo);
	}

	/* 비로그인 상태에서 장바구니에 등록한 상품을 로그인시 product_cart테이블에 넣기위한 서비스 */
	public int insertProductsInCart(List<CartVo> cartList, String userID) {
		return dao.insertProductsInCart(cartList, userID);
	}
	
	/* 장바구니 담긴 상품을 조회하는 서비스 */
	public List<CartVo> selectProductInCart(String uid) {
		return dao.selectProductInCart(uid);
	}
	
	/* 장바구니 담긴 상품 중 체크된 상품으로 선택삭제 버튼 클릭시 삭제하는 서비스 */
	public int deleteProductInCart(String[] cartNo) {
		return dao.deleteProductInCart(cartNo);
	}
	
	/** order **/
	/* 장바구니로부터 체크한 상품 목록을 가져오는 서비스 */
	/*public List<CartVo> selectProductInCart(String[] cartNo) {
		return dao.selectProductInCart(cartNo);
	}*/
	
	/* 주문한 상품 DB에 저장하는 서비스 */
	public int insertOrder(OrderVO vo, List<OrderItemVO> list, MemberVO user) {
		return dao.insertOrder(vo, list, user);
	}
	
	/* 장바구니로부터 주문페이지로 온 경우 주문한 상품을 장바구니 테이블에서 삭제하는 서비스 */
	public int deleteProdcuctInCart(String[] cartNo) {
		return dao.deleteProdcuctInCart(cartNo);
	}
}
