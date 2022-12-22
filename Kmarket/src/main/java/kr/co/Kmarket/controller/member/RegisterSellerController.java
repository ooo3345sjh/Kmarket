package kr.co.Kmarket.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.Kmarket.service.MemberService;
import kr.co.Kmarket.vo.MemberVO;

@WebServlet("/member/registerSeller.do")
public class RegisterSellerController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/member/registerSeller.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid = req.getParameter("km_uid");
		String pass = req.getParameter("km_pass1");
		String company = req.getParameter("km_company");
		String ceo = req.getParameter("km_ceo");
		String bizRegNum = req.getParameter("km_corp_reg");
		String comRegNum = req.getParameter("km_online_reg");
		String tel = req.getParameter("km_tel");
		String fax = req.getParameter("km_fax");
		String zip = req.getParameter("zip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String manager = req.getParameter("km_name");
		String managerHp = req.getParameter("km_hp");
		String regip = req.getRemoteAddr();
		
		MemberVO vo = new MemberVO();
		vo.setUid(uid);
		vo.setPass(pass);
		vo.setCompany(company);
		vo.setCeo(ceo);
		vo.setBizRegNum(bizRegNum);
		vo.setComRegNum(comRegNum);
		vo.setTel(tel);
		vo.setFax(fax);
		vo.setZip(zip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setManager(manager);
		vo.setManagerHp(managerHp);
		vo.setRegip(regip);
		
		service.insertSeller(vo);
		
		resp.sendRedirect("/Kmarket/member/login.do");
	
	}

}
