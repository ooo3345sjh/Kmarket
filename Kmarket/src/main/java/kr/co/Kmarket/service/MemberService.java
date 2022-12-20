package kr.co.Kmarket.service;

import kr.co.Kmarket.dao.MemberDAO;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.SellerVO;
import kr.co.Kmarket.vo.TermsVO;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public void insertMember(MemberVO vo) {
		dao.insertMember(vo);
	}
	
	public void insertSeller(SellerVO vo) {
		dao.insertSeller(vo);
	}
	
	public MemberVO selectMember(String uid, String pass) {
		return dao.selectMember(uid, pass);
	}
	public void selectMembers() {}
	public TermsVO selectTemrs() {
		return dao.selectTerms();
	}
	public int selectCountUid(String uid) {
		return dao.selectCountUid(uid);
	}
	public void updateMember() {}
	public void deleteMember() {}
	public int[] sendEmailCode(String receiver) {
		return dao.sendEmailCode(receiver);
	}

}
