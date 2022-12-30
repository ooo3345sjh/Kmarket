package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.CsService;
import kr.co.Kmarket.vo.CsVO;

@WebServlet("/admin/cs/reply.do")
public class _CsReplyController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("replyGetController...");
		
	}	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("replyGetController doPost...");
		String no	 	 = req.getParameter("no");
		String comment	 = req.getParameter("comment");
		
		CsVO csVo = new CsVO();
		csVo.setCsNo(no);
		csVo.setComment(comment);
		
		int result = service.updateComment(csVo);
		
		JsonObject json = new JsonObject();
		resp.setContentType("application/json;charset=UTF-8");
		json.addProperty("result", result);
		Writer writer = resp.getWriter();
		writer.write(json.toString());
	}
	
}
