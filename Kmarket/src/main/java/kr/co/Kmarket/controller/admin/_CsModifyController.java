package kr.co.Kmarket.controller.admin;

import java.io.IOException;

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

@WebServlet("/admin/cs/modify.do")
public class _CsModifyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int csNo = Integer.parseInt(req.getParameter("no")); 
		String cate1 = req.getParameter("cate1");
		
		CsVO cvo = service.viewArticle(csNo);
		req.setAttribute("cvo", cvo);
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/modify.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("CsModifydoPost...");
		
		String cate2	 = req.getParameter("cate2");
		String type		 = req.getParameter("type");
		String title	 = req.getParameter("title");
		String content	 = req.getParameter("content");
		String cate1	 = req.getParameter("cate1");
		String csNo		 = req.getParameter("no");
		
		int result = service.updateArticle(cate2, type, title, content, csNo);
		
		if(result > 0) {
			resp.sendRedirect("/Kmarket/admin/cs/view.do?cate1="+cate1+"&no="+csNo);
		}
	}
}