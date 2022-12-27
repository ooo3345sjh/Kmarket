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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/product/deleteCart.do")
public class DeleteCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("DeleteCartController doGet...");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("DeleteCartController doPost...");
		String[] cartNo = req.getParameterValues("cartNo");
		String[] prodNo = req.getParameterValues("prodNo");
		HttpSession session = req.getSession();
		MemberVO user = (MemberVO)session.getAttribute("sessMember");
		
		JsonObject json = new JsonObject();
		
		if(user == null) {
			List<CartVo> cartList = (List<CartVo>)session.getAttribute("cartList");
			for(String no : prodNo) {
				for(int i=0; i<cartList.size(); i++) {
					if(cartList.get(i).getProdNo() == Integer.parseInt(no)) {
						cartList.remove(i);
					}
				}
			}
			session.setAttribute("cartList", cartList);
		} else {
			int result = service.deleteProductInCart(cartNo);
			json.addProperty("result ", result);
		}
		
	
		
		resp.setContentType("application/json;charset=UTF-8");
		Writer writer = resp.getWriter();
		writer.write(json.toString());
	}

}
