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
import kr.co.Kmarket.utils.JSFunction;
import kr.co.Kmarket.vo.MemberVO;
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
		
		String msg1 = "존재하지 않는 아이디입니다.";
		String msg2 = "비밀번호를 확인해주세요.";
		String url = "/Kmarket/member/login.do";
		
		// uid를 통해 member type을 검색
		UidVO member = service.selectUid(uid);
		
		if (member == null) {
			// 아이디 조회가 되지 않는 경우
			JSFunction.alertBack(resp, msg1);
		} else {
			int type = member.getType();
			
			if (type == 2) {
				// 판매자 회원인 경우
				MemberVO vo = service.selectSeller(uid, pass);
				if (vo != null) {
					// 로그인 성공
					HttpSession sess = req.getSession();
					sess.setAttribute("sessMember", vo);
					resp.sendRedirect("/Kmarket/");
				} else {
					// 로그인 실패
					JSFunction.alertLocation(resp, msg2, url);
				}
			} else {
				// 일반 회원인 경우
				MemberVO vo = service.selectMember(uid, pass);
				if (vo != null) {
					// 로그인 성공
					HttpSession sess = req.getSession();
					sess.setAttribute("sessMember", vo);
					resp.sendRedirect("/Kmarket/");
				} else {
					// 로그인 실패
					JSFunction.alertLocation(resp, msg2, url);
				}	
			}
		}
		
	}

}
