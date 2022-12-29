package kr.co.Kmarket.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.Kmarket.service.CsService;

@WebServlet("/admin/cs/delete.do")
public class _CsDeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private CsService service = new CsService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("deletedo....");
		String[] no = req.getParameterValues("valueArr");
		String csNo = req.getParameter("no");

		JsonObject json = new JsonObject();
		
		if(csNo == null) {
			
			int result[] = new int [no.length];
			
			for(int i=0; i < no.length; i++) {
				
				result[i] = service.deleteArticle(no[i]);
				json.addProperty("result["+i+"]", result[i]);
				
			}
			
		} else {
			
			int rs = service.deleteArticle(csNo);
			json.addProperty("rs", rs);
		}
		
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
