package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.Writer;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Collections;
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
import kr.co.Kmarket.utils.JSFunction;
import kr.co.Kmarket.vo.CartVo;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/product/cart.do")
public class CartController_session extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("CartController doGet...");
		HttpSession session = req.getSession();
		MemberVO vo	= (MemberVO)session.getAttribute("sessMember");
		
		if(vo == null) {
			List<CartVo> list = (List<CartVo>)session.getAttribute("cartList");
			if(list != null) {
				Collections.sort(list);
			}
			req.setAttribute("list", list);
			
		} else {
			String uid = vo.getUid();
			List<CartVo> list = service.selectProductInCart(uid);
			req.setAttribute("list", list);
			req.setAttribute("user", vo);
		}
		
		req.setAttribute("request", req);
		req.setAttribute("session", session);
		req.getRequestDispatcher("/product/cartSess.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("CartController doPost...");
	}

}
