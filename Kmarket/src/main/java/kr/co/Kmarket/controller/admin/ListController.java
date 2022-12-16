package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.utils.Paging;

@WebServlet("/admin/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("LIstController doGet...");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		String group = "admin";
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("group", group);
		map.put("pg", pg);
		map.put("req", req);
		
		service.countProducts(map);  // 조건에 해당하는 전체 상품 목록의 갯수를 가져오는 서비스
		Paging.paging(map);		     // 페이징 처리
		service.selectProducts(map); // 검색 조건에 맞는 상품 목록을 반환하는 메서드 
		Paging.getPageTags(map);  	 // 페이징 처리된 정보를 토대로 태그 생성
		
		req.setAttribute("map", map);
		req.getRequestDispatcher("/admin/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("LIstController doPost...");
	}

}
