package kr.co.Kmarket.controller.admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.ArticleVO;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/admin/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/file");
		
		File targetDir = new File(path);
		if(!targetDir.exists()) {
			targetDir.mkdirs();
		}
		
		int maxSize = 1024 * 1024 * 30;
		MultipartRequest mr = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String cate1 = mr.getParameter("category1");
		String cate2 = mr.getParameter("category2");
		String prodName = mr.getParameter("productName");
		String descript = mr.getParameter("description");
		String company = mr.getParameter("productCompany");
		String price = mr.getParameter("sellPrice");
		String discount = mr.getParameter("discountRate");
		String point = mr.getParameter("point");
		String delivery = mr.getParameter("deliveryCharge");
		String thumb1 = mr.getFilesystemName("ThumbnailList");
		String thumb2 = mr.getFilesystemName("ThumbnailMain");
		String thumb3 = mr.getFilesystemName("ThumbnailDetail");
		String detail = mr.getFilesystemName("detailInfo");
		String status = mr.getParameter("condition");
		String duty = mr.getParameter("taxExemption");
		String receipt = mr.getParameter("receipt");
		String bizType = mr.getParameter("separation");
		String origin = mr.getParameter("origin");
		String ip = req.getRemoteAddr();
		
		ProductVO pv = new ProductVO();

	
	}

}
