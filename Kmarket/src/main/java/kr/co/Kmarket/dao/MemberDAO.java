package kr.co.Kmarket.dao;

import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.concurrent.ThreadLocalRandom;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.db.DBHelper;
import kr.co.Kmarket.db.Sql;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.TermsVO;
import kr.co.Kmarket.vo.UidVO;

public class MemberDAO extends DBHelper {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 일반 회원 가입
	public void insertMember(MemberVO vo) {
		try {
			logger.info("insertMember...");
			con = getConnection();
			
			con.setAutoCommit(false);
			PreparedStatement psmt1 = con.prepareStatement(Sql.INSERT_MEMBER);
			PreparedStatement psmt2 = con.prepareStatement(Sql.INSERT_UID);
			psmt1.setString(1, vo.getUid());
			psmt1.setString(2, vo.getPass());
			psmt1.setString(3, vo.getName());
			psmt1.setInt(4, vo.getGender());
			psmt1.setString(5, vo.getHp());
			psmt1.setString(6, vo.getEmail());
			psmt1.setString(7, vo.getZip());
			psmt1.setString(8, vo.getAddr1());
			psmt1.setString(9, vo.getAddr2());
			psmt1.setString(10, vo.getRegip());
			psmt2.setString(1, vo.getUid());
			psmt2.setInt(2, 1);
			psmt1.executeUpdate();
			psmt2.executeUpdate();
			con.commit();
			
			psmt1.close();
			psmt2.close();
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	// 판매자 회원가입
	public void insertSeller(MemberVO vo) {
		try {
			logger.info("insertSeller...");
			con = getConnection();
			
			con.setAutoCommit(false);
			PreparedStatement psmt1 = con.prepareStatement(Sql.INSERT_SELLER);
			PreparedStatement psmt2 = con.prepareStatement(Sql.INSERT_UID);
			psmt1.setString(1, vo.getUid());
			psmt1.setString(2, vo.getPass());
			psmt1.setString(3, vo.getZip());
			psmt1.setString(4, vo.getAddr1());
			psmt1.setString(5, vo.getAddr2());
			psmt1.setString(6, vo.getCompany());
			psmt1.setString(7, vo.getCeo());
			psmt1.setString(8, vo.getBizRegNum());
			psmt1.setString(9, vo.getComRegNum());
			psmt1.setString(10, vo.getTel());
			psmt1.setString(11, vo.getManager());
			psmt1.setString(12, vo.getManagerHp());
			psmt1.setString(13, vo.getFax());
			psmt1.setString(14, vo.getRegip());
			psmt2.setString(1, vo.getUid());
			psmt2.setInt(2, 2);
			psmt1.executeUpdate();
			psmt2.executeUpdate();
			con.commit();
			
			psmt1.close();
			psmt2.close();
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	// 회원 타입 구분
	public UidVO selectUid(String uid) {
		
		UidVO vo = null;
		
		try {
			logger.info("selectUid...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new UidVO();
				vo.setUid(rs.getString(1));
				vo.setType(rs.getInt(2));
			}
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	// 회원 로그인
	public MemberVO selectMember(String uid, String pass) {
		MemberVO vo = null;
		
		try {
			logger.info("selectMember...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo = new MemberVO();
				vo.setUid(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setGender(rs.getInt(4));
				vo.setHp(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setType(rs.getInt(7));
				vo.setPoint(rs.getInt(8));
				vo.setLevel(rs.getInt(9));
				vo.setZip(rs.getString(10));
				vo.setAddr1(rs.getString(11));
				vo.setAddr2(rs.getString(12));
				vo.setRegip(rs.getString(13));
				vo.setRdate(rs.getString(15));
			}
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	// 판매자 회원 로그인
	public MemberVO selectSeller(String uid, String pass) {
		MemberVO vo = null;
		
		try {
			logger.info("selectSeller...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_SELLER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo = new MemberVO();
				vo.setUid(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setType(rs.getInt(3));
				vo.setPoint(rs.getInt(4));
				vo.setLevel(rs.getInt(5));
				vo.setZip(rs.getString(6));
				vo.setAddr1(rs.getString(7));
				vo.setAddr2(rs.getString(8));
				vo.setCompany(rs.getString(9));
				vo.setCeo(rs.getString(10));
				vo.setBizRegNum(rs.getString(11));
				vo.setCompany(rs.getString(12));
				vo.setTel(rs.getString(13));
				vo.setManager(rs.getString(14));
				vo.setManagerHp(rs.getString(15));
				vo.setFax(rs.getString(16));
				vo.setRegip(rs.getString(17));
				vo.setRdate(rs.getString(19));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
		return vo;
	}
	
	public void selectMembers() {}
	
	// 약관
	public TermsVO selectTerms() {
		logger.info("selectTerms...");
		TermsVO vo = null;
		
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				vo = new TermsVO();
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
				vo.setLocation(rs.getString(3));
				vo.setFinance(rs.getString(4));
				vo.setTax(rs.getString(5));
			}
			close();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		logger.debug("vo : " + vo);
		return vo;
	}
	
	// 아이디 중복 체크
	public int selectCountUid(String uid) {
		int result = 0;
		
		try {
			logger.info("selectCountUid...");
			con = getConnection();
			psmt = con.prepareStatement(Sql.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch(Exception e) {
			logger.error(e.getMessage());
		}
		
		return result;
	}
	
	public void updateMember() {}
	public void deleteMember() {}
	
	public int[] sendEmailCode(String receiver) {
		
		// 인증코드 생성
		int code = ThreadLocalRandom.current().nextInt(100000, 1000000);
		
		// 기본정보
		String sender = "jojuyeong03@gmail.com";
		String password = "imoepaupsygpyquo";
		String title = "Kmarket 인증코드 입니다.";
		String content =  "<h1>인증코드는 "+code+" 입니다.</h1>";
		
		// Gmail SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});
		
		// 메일 발송
		Message message = new MimeMessage(session);
		int status = 0;
		
		try {
			logger.debug("메일 전송 시작...");
			message.setFrom(new InternetAddress(sender, "관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(MimeUtility.encodeText(title, "utf-8", "B"));
			message.setContent(content, "text/html;charset=utf-8");
			Transport.send(message);
			
			status = 1;
			
		} catch(Exception e) {
			e.printStackTrace();
			status = 0;
			logger.error("메일 전송 실패...");
		}
		logger.debug("메일 전송 성공...");
		
		int result[] = {status, code};
		
		return result;
	}
	
	public void checkUid() {}

}
