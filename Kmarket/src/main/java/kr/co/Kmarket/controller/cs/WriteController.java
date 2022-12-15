package kr.co.Kmarket.controller.cs;

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

@WebServlet("/cs/board/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid	 = req.getParameter("uid");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String type	 = req.getParameter("type");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		String rdate = req.getParameter("rdate");
		
		CsVO cvo = new CsVO();
		cvo.setUid(uid);
		cvo.setCate1(cate1);
		cvo.setCate2(cate2);
		cvo.setType(type);
		cvo.setTitle(title);
		cvo.setContent(content);
		cvo.setRegip(regip);
		cvo.setRdate(rdate);
		
		int result = service.insertQnaArticle(cvo);
		if(result > 0) {
			resp.sendRedirect("/Kmarket/cs/board/list.do?cate1="+cate1+"&cate2="+cate2);
		}
	}
}
