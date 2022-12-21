package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.Writer;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.ProductVO;

//@WebServlet("/product/order.do")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("OrderController doGet...");
		
		// 장바구니를 통한 주문 페이지 이동시
		String cartNo = req.getParameter("cartNo");
		
		// 상세뷰에서 바로 주문을 통한 페이지 이동시
		String prodNo = req.getParameter("prodNo");
		String count = req.getParameter("count");
		
		if(cartNo != null) {
			String[] arrCartNo = cartNo.split(","); 
			List<CartVo> list = service.selectProductInCart(arrCartNo);
			req.setAttribute("list", list);
			req.setAttribute("type", "cart");
		} else if(prodNo != null) {
			ProductVO vo = service.selectProduct(prodNo);
			req.setAttribute("count", count);
			req.setAttribute("vo", vo);
			req.setAttribute("type", "buyNow");
		}
		
		req.getRequestDispatcher("/product/order.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("OrderController doPost...");
	}

}
