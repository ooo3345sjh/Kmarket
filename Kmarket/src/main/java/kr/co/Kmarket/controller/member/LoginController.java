package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Kmarket.service.MemberService;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.SellerVO;
import kr.co.Kmarket.vo.UidVO;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		
		// uid를 통해 member type을 검색
		UidVO member = service.selectUid(uid);
		int type = member.getType();
		

		if (type == 5) {
			// 판매자 회원인 경우
			SellerVO vo = service.selectSeller(uid, pass);
			if (vo != null) {
				HttpSession sess = req.getSession();
				sess.setAttribute("sessUser", vo);
				resp.sendRedirect("/Kmarket/");
			} else {
				resp.sendRedirect("/Kmarket/member/login.do");
			}
		} else {
			// 일반 회원인 경우
			MemberVO vo = service.selectMember(uid, pass);
			if (vo != null) {
				HttpSession sess = req.getSession();
				sess.setAttribute("sessUser", vo);
				resp.sendRedirect("/Kmarket/");
			} else {
				resp.sendRedirect("/Kmarket/member/login.do");
			}	
		}
		
	}

}
