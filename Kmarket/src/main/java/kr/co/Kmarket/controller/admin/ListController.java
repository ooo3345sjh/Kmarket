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
import kr.co.Kmarket.vo.ArticleVO;

@WebServlet("/admin/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pg = req.getParameter("pg");
		
		int start = 0;
		int currentPage = 1;
		int lastPageNum = 0;
		int PageStartNum = 0;
		
		// 현재 페이지 게시물 limit 시작값 계산
			if (pg != null) {
				currentPage = Integer.parseInt(pg);
			}
			
		// 전체 게시물 갯수 구하기
				
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/file");
	
	}

}
