package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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

@WebServlet("/admin/cs/list.do")
public class _CsListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private CsService service = new CsService();
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("CsListController doGet...");
		String cate1	 = req.getParameter("cate1");
		String cate2	 = req.getParameter("cate2");
		String type	 = req.getParameter("type");
		String pg		 = req.getParameter("pg");
		String group	 = "admin/cs";
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		Map<String, Object> map = new HashMap<>();
		
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		map.put("cate1", cate1);
		map.put("cate2", cate2);
		map.put("type", type);
		map.put("group", group);
		map.put("pg", pg);
		map.put("req", req);
		
		service.countAdminArticles(map);  // 조건에 해당하는 전체 상품 목록의 갯수를 가져오는 서비스
		Paging.paging(map);		     // 페이징 처리
		service.selectAdminArticles(map);
		Paging.getPageTags(map);  	 // 페이징 처리된 정보를 토대로 태그 생성
		service.selectFaqArticle(map); // cs 페이지전용 FAQ 글 목록 
		
		//List<CsVO> noticelist = service.selectNoticeAll();
		//List<CsVO> faq = service.selectFaqAll();
		//List<CsVO> qnalist = service.selectQnaAll();
		
		//req.setAttribute("noticelist", noticelist); // admin-cs notice 목록
		//req.setAttribute("faq", faq);	// admin-cs faq 목록
		//req.setAttribute("qnalist", qnalist); // admin-cs qna 목록
		
		req.setAttribute("map", map);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("request", req);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/list.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}
