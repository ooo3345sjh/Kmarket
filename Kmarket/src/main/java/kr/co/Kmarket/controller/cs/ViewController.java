package kr.co.Kmarket.controller.cs;

import java.io.IOException;
import java.util.HashMap;
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
import kr.co.Kmarket.vo.CsVO;

@WebServlet("/cs/view.do")
public class ViewController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("viewController...");
		String csNo	 = req.getParameter("no");
		String pg	 = req.getParameter("pg");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		
		CsVO cvo = service.viewArticle(csNo);
		
		req.setAttribute("cvo", cvo);
		req.setAttribute("pg", pg);
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/view.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
