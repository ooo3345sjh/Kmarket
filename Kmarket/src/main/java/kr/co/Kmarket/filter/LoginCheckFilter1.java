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

public class LoginCheckFilter1 implements Filter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.info("LoginCheckFilter doFilter...");
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpSession sess = req.getSession();
		MemberVO sessMember = (MemberVO)sess.getAttribute("sessMember");
		
		
		// 로그인을 하지 않았을 경우
		if (sessMember == null) {
			
			((HttpServletResponse)response).setContentType("text/html; charset=utf-8");
			PrintWriter writer = ((HttpServletResponse)response).getWriter();
			
			String script = ""
					+ "<script>"
					+ " alert('로그인 후 이용해주세요.'); "
					+ " location.href='/Kmarket/member/login.do'; "
					+ "</script>";
			writer.print(script);
			return;
			
			/*
			((HttpServletResponse)response).sendRedirect("/Kmarket/member/login.do");
			return;
			*/
		}
		
		chain.doFilter(request, response);
		
	}

}
