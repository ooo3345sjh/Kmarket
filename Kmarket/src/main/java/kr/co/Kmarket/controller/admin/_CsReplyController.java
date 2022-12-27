package kr.co.Kmarket.controller.admin;

import java.io.IOException;

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
		logger.info("replyPostController...");
		
		String parent	 = req.getParameter("no");
		String content	 = req.getParameter("content");
		String regip	 = req.getRemoteAddr();
		
		CsVO comment = new CsVO();
		comment.setParent(parent);
		comment.setContent(content);
		comment.setRegip(regip);
		
		int result = service.insertComment(comment);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		json.addProperty("", comment.getParent());
		json.addProperty(regip, comment.getContent());
		json.addProperty(regip, comment.getRegip());
	}
}
