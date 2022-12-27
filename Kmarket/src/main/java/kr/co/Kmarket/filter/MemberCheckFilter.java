package kr.co.Kmarket.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.utils.JSFunction;
import kr.co.Kmarket.vo.MemberVO;

public class MemberCheckFilter implements Filter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.info("MemberCheck doFilter...");
		
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		
		HttpSession sess = req.getSession();
		MemberVO sessMember = (MemberVO)sess.getAttribute("sessMember");
		
		if (uri.contains("/member/logout.do")) {
			// 로그아웃 요청인 경우
		} else if (sessMember != null) {
			// 로그인을 했을 경우
			String msg = "허용되지 않은 접근입니다.";
			JSFunction.alertBack(((HttpServletResponse)response), msg);
			return;
		}
		
		chain.doFilter(request, response);
		
	}

}
