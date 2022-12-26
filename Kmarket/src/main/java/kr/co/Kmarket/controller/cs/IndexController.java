package kr.co.Kmarket.controller.cs;

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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.CsService;
import kr.co.Kmarket.service.MemberService;
import kr.co.Kmarket.utils.Paging;
import kr.co.Kmarket.vo.CsVO;
import kr.co.Kmarket.vo.MemberVO;

@WebServlet("/cs/index.do")
public class IndexController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("IndexController doGet...");
		
		String uid = req.getParameter("uid");
		// 메인 인덱스 공지사항, 문의하기 최신 글 출력
		List<CsVO> list = service.selectNoticeAll();
		List<CsVO> list1 = service.selectQnaAll();
		
		// 세션 부분
		HttpSession session = req.getSession();
		session.setAttribute("uid", uid);
		
				
		req.setAttribute("noticList", list);
		req.setAttribute("qnaList", list1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/cs/index.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("IndexController doPost...");
	}
}
