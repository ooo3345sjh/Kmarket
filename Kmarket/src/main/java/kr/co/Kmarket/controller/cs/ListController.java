package kr.co.Kmarket.controller.cs;

import java.io.IOException;
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

import kr.co.Kmarket.service.CsService;
import kr.co.Kmarket.utils.Paging;
import kr.co.Kmarket.vo.CsVO;

@WebServlet("/cs/list.do")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private CsService service = new CsService();

	@Override
	public void init() throws ServletException {}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("LIstController doGet...");
		String no = req.getParameter("no");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String pg = req.getParameter("pg");
		String group = "cs";
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		map.put("no", no);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("group", group);
		map.put("pg", pg);
		map.put("req", req);
		
		service.countArticles(map);  // 조건에 해당하는 전체 상품 목록의 갯수를 가져오는 서비스
		Paging.paging(map);		     // 페이징 처리
		service.selectArticles(map); // 
		Paging.getPageTags(map);  	 // 페이징 처리된 정보를 토대로 태그 생성
		
		List<CsVO> nlist = service.selectNoticeAll(); // 공지사항 전체목록
		
		req.setAttribute("nlist", nlist);
		req.setAttribute("map", map);
		req.getRequestDispatcher("/cs/board/list.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("LIstController doPost...");
	}

}
