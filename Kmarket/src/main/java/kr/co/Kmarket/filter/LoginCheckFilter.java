package kr.co.Kmarket.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

public class LoginCheckFilter implements Filter {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private List<String> uriList;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		uriList = new ArrayList<>();
		uriList.add("/list.do");
		uriList.add("/register.do");
		uriList.add("/index.do");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		logger.info("LoginCheckFilter doFilter...");
		
		HttpServletRequest req = (HttpServletRequest) request;
		String uri = req.getRequestURI();
		
		HttpSession sess = req.getSession();
		MemberVO sessMember = (MemberVO)sess.getAttribute("sessMember");
		
		// 로그인을 하지 않았을 경우
		if (sessMember == null) {
			((HttpServletResponse)response).sendRedirect("/Kmarket/member/login.do");
			return;
		}
			

		
		chain.doFilter(request, response);
		
	}

}
