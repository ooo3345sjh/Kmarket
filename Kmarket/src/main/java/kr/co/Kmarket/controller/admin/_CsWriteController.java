package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.co.Kmarket.service.CsService;
import kr.co.Kmarket.vo.CsVO;

@WebServlet("/admin/cs/write.do")
public class _CsWriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cate1 = req.getParameter("cate1");
		
		req.setAttribute("cate1", cate1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/cs/write.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid	 = req.getParameter("uid");
		String cate1 = req.getParameter("cate1");
		String cate2 = req.getParameter("cate2");
		String type = req.getParameter("type");
		
		if(cate1.equals("notice")) {
			type.equals("고객서비스");
			cate2 = "service";
			
			type.equals("안전거래");
			cate2 = "safeDeal";
			
			type.equals("위해상품");
			cate2 = "xproduct";
			
			type.equals("이벤트당첨");
			cate2 = "great";
		}
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String regip = req.getRemoteAddr();
		
		CsVO cvo = new CsVO();
		cvo.setUid(uid);
		cvo.setCate2(cate2);
		cvo.setType(type);
		cvo.setTitle(title);
		cvo.setContent(content);
		cvo.setRegip(regip);
		
		int result = 0;
		
		if(cate1.equals("notice")) {
			result = service.insertAdminNoticeArticle(cvo);
		} else if(cate1.equals("faq")) {
			result = service.insertAdminFaqArticle(cvo);
		}
		
		if(result > 0) {
			resp.sendRedirect("/Kmarket/admin/cs/list.do?cate1="+cate1);
		}
		
		
	}
}
