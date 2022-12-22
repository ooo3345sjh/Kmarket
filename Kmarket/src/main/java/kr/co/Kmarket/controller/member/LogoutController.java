package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Kmarket.utils.JSFunction;
import kr.co.Kmarket.vo.MemberVO;

@WebServlet("/member/logout.do")
public class LogoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession sess = req.getSession();
		
		MemberVO sessMember = (MemberVO)sess.getAttribute("sessMember");
		String uid = sessMember.getUid();
		
		// 세션 해제
		sess.removeAttribute("sessMember");
		sess.invalidate();

		JSFunction logout = new JSFunction();
		String msg = "로그아웃 되었습니다.";
		String url = "/Kmarket/";
		logout.alertLocation(resp, msg, url);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
}
