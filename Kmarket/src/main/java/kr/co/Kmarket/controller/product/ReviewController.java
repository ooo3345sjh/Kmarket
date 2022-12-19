package kr.co.Kmarket.controller.product;

import java.io.IOException;
import java.io.Writer;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.utils.Paging;
import kr.co.Kmarket.vo.ReviewVO;

@WebServlet("/product/review.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ReviewController doGet...");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("ReviewController doPost...");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String prodNo = req.getParameter("prodNo");
		String pg = req.getParameter("pg");
		String group = "product";
		Map<String, Object> map = new HashMap<>();
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("group", group);
		map.put("pg", pg);
		map.put("req", req);
		map.put("prodNo", prodNo);
		
		service.selectCountReviews(map);  // 조건에 해당하는 전체 상품 목록의 갯수를 가져오는 서비스
		Paging.paging(map);		     // 페이징 처리
		service.selectReviews(map); // 검색 조건에 맞는 상품 목록을 반환하는 메서드 
		Paging.getPageTags(map);  	 // 페이징 처리된 정보를 토대로 태그 생성
		
		Gson gson = new Gson();
		JsonObject json = new JsonObject();
		json.addProperty("pageTag", (String)map.get("pageTag"));
		json.addProperty("reviews", gson.toJson((List<ReviewVO>)map.get("reviews")));
		json.addProperty("pageGroupEnd", (int)map.get("pageGroupEnd"));
		
		resp.setContentType("application/json;charset=UTF-8");
		Writer writer = resp.getWriter();
		writer.write(json.toString());
	}

}
