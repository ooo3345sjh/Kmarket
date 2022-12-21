package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.Kmarket.vo.SellerVO;

@WebServlet("/member/logoutSeller.do")
public class LogoutSellerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession sess = req.getSession();
		
		SellerVO sessSeller = (SellerVO)sess.getAttribute("sessSeller");
		String uid = sessSeller.getUid();
		
		// 세션 해제
		sess.removeAttribute("sessSeller");
		sess.invalidate();
		
		resp.sendRedirect("/Kmarket/");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
	
}