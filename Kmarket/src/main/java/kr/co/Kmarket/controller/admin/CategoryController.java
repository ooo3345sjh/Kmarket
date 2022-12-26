package kr.co.Kmarket.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/admin/category.do")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		logger.info("CategoryControllerdoGet...");
		
		String cate1 = String.valueOf(req.getParameter("cate1"));
		String cate2 = String.valueOf(req.getParameter("cate2"));
		cate2 = 1 + cate2;
		
		System.out.println("cate1 : "+cate1);
		System.out.println("cate2 : "+cate2);
		
		HttpSession sess = req.getSession();
		sess.setAttribute("cate1", cate1);
		sess.setAttribute("cate2", cate2);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

}
