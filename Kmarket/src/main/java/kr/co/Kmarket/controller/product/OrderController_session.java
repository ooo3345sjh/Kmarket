package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.utils.JSFunction;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.OrderItemVO;
import kr.co.Kmarket.vo.OrderVO;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/product/order.do")
public class OrderController_session extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("OrderController doGet...");
		
		MemberVO vo = (MemberVO)req.getSession().getAttribute("sessMember");
		
		req.setAttribute("vo", vo);
		req.getRequestDispatcher("/product/orderSess.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("OrderController doPost...");
		
		// 회원 정보 가져오기
		MemberVO user = (MemberVO)req.getSession().getAttribute("sessMember");
		if(user == null) {
			JSFunction.alertBack(resp, "로그인이 필요합니다.");
		} 
		
		// 주문 일련번호 생성
		Date date = new Date();
		Random random = new Random();
		SimpleDateFormat sdf = new SimpleDateFormat("yyHHmmss");
		
		// 최종 결제 정보
		String ordNo = random.nextInt(22) + sdf.format(date);  // 주문 번호
		System.out.println(ordNo);
		String uid = user.getUid(); 	   					   // 회원 아이디
		String ordCount = req.getParameter("ordCount"); 	   // 전체 상품 수량
		String ordPrice = req.getParameter("ordPrice"); 	   // 전체 상품 가격 
		String ordDisCount = req.getParameter("ordDisCount");  // 전체 상품 할인가격
		String ordDelivery = req.getParameter("ordDelivery");  // 전체 상품 배송비
		String savePoint = req.getParameter("savePoint"); 	   // 적립 포인트
		String usedPoint = req.getParameter("usedPoint");      // 사용 포인트
		String ordTotPrice = req.getParameter("ordTotPrice");  // 전체 상품 결제 금액
		String recipName = req.getParameter("orderer");        // 주문자 
		String recipHp = req.getParameter("hp");               // 주문자 번호 
		String recipZip = req.getParameter("zip");             // 배송지 우편번호
		String recipAddr1 = req.getParameter("addr1");		   // 배송지 주소
		String recipAddr2 = req.getParameter("addr2");         // 배송지 상세주소
		String ordPayment = req.getParameter("payment");	   // 결제 수단
		String ordComplete = "1";	  					       // 결제 완료 여부 성공 : 1 / 실패 : 0
		String ordState = "배송준비";	   						   // 주문 상태
		
		
		// 주문 테이블에 추가할 데이터
		OrderVO orderVo = new OrderVO();
		orderVo.setOrdNo(ordNo);
		orderVo.setUid(uid);
		orderVo.setOrdCount(ordCount);
		orderVo.setOrdPrice(ordPrice);
		orderVo.setOrdDiscount(ordDisCount);
		orderVo.setOrdDelivery(ordDelivery);
		orderVo.setSavePoint(savePoint);
		orderVo.setUsedPoint(usedPoint);
		orderVo.setOrdTotPrice(ordTotPrice);
		orderVo.setRecipName(recipName);
		orderVo.setRecipHp(recipHp);
		orderVo.setRecipZip(recipZip);
		orderVo.setRecipAddr1(recipAddr1);
		orderVo.setRecipAddr2(recipAddr2);
		orderVo.setOrdPayment(ordPayment);
		orderVo.setOrdComplete(ordComplete);
		orderVo.setOrdState(ordState);
		
		String[] prodNoArr = req.getParameterValues("prodNo"); // 각 상품 번호
		String[] cartNoArr = req.getParameterValues("cartNo"); // 장바구니에 담겨진 상품일시 장바구니 상품 번호
		String[] countArr = req.getParameterValues("count");   // 각 상품 갯수
		String[] priceArr = req.getParameterValues("price");   // 각 상품 갯수
		String[] discountArr = req.getParameterValues("discount");   // 각 상품 갯수
		String[] pointArr = req.getParameterValues("ProPoint");   // 각 상품 갯수
		String[] deliveryArr = req.getParameterValues("delivery");   // 각 상품 갯수
		
		// 주문 상품 아이템 테이블에 추가할 데이터
		List<OrderItemVO> list = new ArrayList<>();
		for(int i=0; i<prodNoArr.length; i++) {
			OrderItemVO orderItemVo = new OrderItemVO();
			orderItemVo.setProdNo(ordNo);
			orderItemVo.setProdNo(prodNoArr[i]);
			orderItemVo.setCount(countArr[i]);
			orderItemVo.setPrice(priceArr[i]);
			orderItemVo.setDiscount(discountArr[i]);
			orderItemVo.setPoint(pointArr[i]);
			orderItemVo.setDelivery(deliveryArr[i]);
			orderItemVo.setTotal((Integer.parseInt(priceArr[i])
					             - (int)Math.floor(Integer.parseInt(priceArr[i]) * (Integer.parseInt(discountArr[i]) * 0.01)))
								 * Integer.parseInt(countArr[i])
								 + Integer.parseInt(deliveryArr[i]));
			
			list.add(orderItemVo);
		}

		// 바로 구매일 경우
		if(cartNoArr[0].equals("undefined")) {
			service.insertOrder(orderVo, list);
		} 
		
		// 장바구니를 통한 구매일 경우
		else {
			
		}
		
		
		
		System.out.println("ordCount : " + ordCount);
		System.out.println("ordPrice : " + ordPrice);
		System.out.println("ordDisCount : " + ordDisCount);
		System.out.println("ordDelivery : " + ordDelivery);
		System.out.println("savePoint : " + savePoint);
		System.out.println("usedPoint : " + usedPoint);
		System.out.println("ordTotPrice : " + ordTotPrice);
		System.out.println("recipName : " + recipName);
		System.out.println("recipHp : " + recipHp);
		System.out.println("recipZip : " + recipZip);
		System.out.println("recipAddr1 : " + recipAddr1);
		System.out.println("recipAddr2 : " + recipAddr2);
		System.out.println("ordPayment : " + ordPayment);
		
		
		
		for(String prodNo : prodNoArr) {
			System.out.println("prodNo : " + prodNo);
			
		}
		for(String cartNo : cartNoArr) {
			System.out.println("cartNo : " + cartNo);
		}
		for(String count : countArr) {
			System.out.println("count : " + count);
		}
		for(String price : priceArr) {
			System.out.println("price : " + price);
		}
		for(String discount : discountArr) {
			System.out.println("discount : " + discount);
		}
		for(String point : pointArr) {
			System.out.println("point : " + point);
		}
		for(String delivery : deliveryArr) {
			System.out.println("delivery : " + delivery);
		}
	}

}
