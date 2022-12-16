package kr.co.Kmarket.service;

import kr.co.Kmarket.dao.MemberDAO;
import kr.co.Kmarket.vo.TermsVO;

public class MemberService {
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public void insertMember() {}
	public void selectMember() {}
	public void selectMembers() {}
	public TermsVO selectTemrs() {
		return dao.selectTerms();
	}
	public void updateMember() {}
	public void deleteMember() {}

}
