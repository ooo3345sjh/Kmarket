package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/admin/product/productModify.do")
public class ProductModifyController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = new ProductService();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String prodNo = req.getParameter("prodNo");
		String prodName = req.getParameter("prodName");
		String price = req.getParameter("price");
		String discount = req.getParameter("discount");
		String point = req.getParameter("point");
		String stock = req.getParameter("stock");
		
		ProductVO vo = new ProductVO();
		vo.setProdNo(prodNo);
		vo.setProdName(prodName);
		vo.setPrice(price);
		vo.setDiscount(discount);
		vo.setPoint(point);
		vo.setStock(stock);
		
		int result = service.updateProduct(vo);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}

}
