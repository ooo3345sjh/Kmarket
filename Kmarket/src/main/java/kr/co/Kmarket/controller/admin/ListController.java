package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.ProductVO;


@WebServlet("/admin/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = new ProductService();

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		
		int start = 0;
		int currentPage = 1;
		int lastPageNum = 0;
		int pageStartNum = 0;
		
		// 현재 페이지 상품 limit 시작값 계산
		if (pg != null) {
			currentPage = Integer.parseInt(pg);
		}
			
		// 전체 상품 갯수 구하기
		int total = service.selectCountTotalProduct();
		
		// 페이지 마지막 번호 계산
		if (total % 1 == 0) {
			lastPageNum = (total/10);
		} else {
			lastPageNum = (total/10) + 1;
		}
		
		// 페이지 그룹 계산
		int pageGroupCurrent = (int) Math.ceil(currentPage / 10.0);
		int pageGroupStart = (pageGroupCurrent - 1) * 10 + 1;
		int pageGroupEnd = pageGroupCurrent * 10;
		
		if (pageGroupEnd > lastPageNum) {
			pageGroupEnd = lastPageNum;
		}
		
		// 페이지 시작 번호 계산
		start = (currentPage - 1) * 10;
		pageStartNum = total - start;
		start = (currentPage - 1) * 10;
		
		// 현재 페이지 게시물 가져오기
		List<ProductVO> vo = null;
		
		vo = service.selectProducts(start);
		
		req.setAttribute("vo", vo);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageGroupStart", pageGroupStart);
		req.setAttribute("pageGroupEnd", pageGroupEnd);
		req.setAttribute("pageStartNum", pageStartNum);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}

}
