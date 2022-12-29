package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
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
		logger.info("replyPostController...");
		
		String no	 	 = req.getParameter("no");
		String type		 = req.getParameter("type");
		String title	 = req.getParameter("title");
		String content	 = req.getParameter("content");
		String reply	 = req.getParameter("reply");
		String uid		 = req.getParameter("uid");
		
		CsVO comment = new CsVO();
		comment.setCsNo(no);
		comment.setType(type);
		comment.setTitle(title);
		comment.setContent(content);
		comment.setComment(reply);
		comment.setUid(uid);
		
		
		int result = service.updateComment(comment);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", 1);
		json.addProperty("uid", comment.getUid());
		json.addProperty("type", comment.getType());
		json.addProperty("title", comment.getTitle());
		json.addProperty("content", comment.getContent());
		json.addProperty("reply", comment.getComment());
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
}
