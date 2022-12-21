package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.Writer;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
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

@WebServlet("/product/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ViewController doGet...");
		String prodNo = req.getParameter("no");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");

		ProductVO vo = service.selectProduct(prodNo);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("vo", vo);
		LocalDate date = LocalDate.now();
		date = date.plusDays(2);
		int week = date.getDayOfWeek().getValue();
		String yoil = null;
		
		switch(week) {
			case 1: yoil = "월"; break;	
			case 2: yoil = "화"; break;	
			case 3: yoil = "수"; break;	
			case 4: yoil = "목"; break;	
			case 5: yoil = "금"; break;	
			case 6: yoil = "토"; break;	
			default: yoil = "일"; break;	
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("M/d");
		req.setAttribute("date", sdf.format(Date.valueOf(date)));
		req.setAttribute("yoil", yoil);
		req.setAttribute("request", req);
		req.getRequestDispatcher("/product/view.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ViewController doPost...");
		String prodNo = req.getParameter("prodNo");
		String uid = req.getParameter("uid");
		String count = req.getParameter("count");
		String price = req.getParameter("price");
		String discount = req.getParameter("discount");
		String point = req.getParameter("point");
		String delivery = req.getParameter("delivery");
		String total = req.getParameter("total");
		
		CartVo vo = new CartVo();
		vo.setProdNo(prodNo);
		vo.setUid(uid);
		vo.setCount(count);
		vo.setPrice(price);
		vo.setDiscount(discount);
		vo.setPoint(point);
		vo.setDelivery(delivery);
		vo.setTotal(total);
		System.out.println(prodNo + " " + uid + " " + count + " " + price + " " + discount + " " + point + " " + delivery + " " + total);
		
		int result = service.insertProductInCart(vo); // 장바구니 테이블에 상품 추가
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		resp.setContentType("application/json;charset=UTF-8");
		Writer writer = resp.getWriter();
		writer.write(json.toString());
	}

}
