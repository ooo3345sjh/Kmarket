package kr.co.Kmarket.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.Kmarket.service.ProductService;
import kr.co.Kmarket.vo.MemberVO;
import kr.co.Kmarket.vo.ProductVO;

@WebServlet("/admin/product/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = new ProductService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("RegisterController doGet...");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/product/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("RegisterController doPost...");
		
		HttpSession sess = req.getSession();
		MemberVO sessMember = (MemberVO)sess.getAttribute("sessMember");
		String uid = sessMember.getUid();
		int type = sessMember.getType();
		String cate1 = String.valueOf(sess.getAttribute("cate1"));
		String cate2 = String.valueOf(sess.getAttribute("cate2"));
		
		System.out.println("cate1 : "+cate1);
		System.out.println("cate2 : "+cate2);
		
		ServletContext ctx = req.getServletContext();
		String path = ctx.getRealPath("/file");

		String newPath = path + "/" + cate1 + "/" + cate2;
		
		File newFile = new File(newPath);
		if(!newFile.exists()) newFile.mkdirs();
		
		int maxSize = 1024 * 1024 * 10;
		MultipartRequest mr = new MultipartRequest(req, newPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String prodName = mr.getParameter("productName");
		String descript = mr.getParameter("description");
		String company = mr.getParameter("productCompany");
		String price = mr.getParameter("sellPrice");
		String discount = mr.getParameter("discountRate");
		String point = mr.getParameter("point");
		String stock = mr.getParameter("stock");
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

		
		int i1 = thumb1.lastIndexOf(".");
		String ext1 = thumb1.substring(i1);
		String newName1 = UUID.randomUUID()+ext1;
		
		File f1 = new File(newPath+"/"+thumb1);
		File f2 = new File(newPath+"/"+newName1);
		f1.renameTo(f2);
		
		int i2 = thumb2.lastIndexOf(".");
		String ext2 = thumb2.substring(i2);
		String newName2 = UUID.randomUUID()+ext2;
		
		File f3 = new File(newPath+"/"+thumb2);
		File f4 = new File(newPath+"/"+newName2);
		f3.renameTo(f4);
		
		int i3 = thumb3.lastIndexOf(".");
		String ext3 = thumb3.substring(i3);
		String newName3 = UUID.randomUUID()+ext3;
		
		File f5 = new File(newPath+"/"+thumb3);
		File f6 = new File(newPath+"/"+newName3);
		f5.renameTo(f6);
		
		int i4 = detail.lastIndexOf(".");
		String ext4 = detail.substring(i4);
		String newName4 = UUID.randomUUID()+ext4;
		
		File f7 = new File(newPath+"/"+detail);
		File f8 = new File(newPath+"/"+newName4);
		f7.renameTo(f8);
		
		ProductVO pv = new ProductVO();
		pv.setCate1(cate1);
		pv.setCate2(cate2);
		pv.setSeller(uid);
		pv.setProdName(prodName);
		pv.setDescript(descript);
		pv.setCompany(company);
		pv.setPrice(price);
		pv.setDiscount(discount);
		pv.setPoint(point);
		pv.setStock(stock);
		pv.setDelivery(delivery);
		pv.setThumb1(newName1);
		pv.setThumb2(newName2);
		pv.setThumb3(newName3);
		pv.setDetail(newName4);
		pv.setStatus(status);
		pv.setDuty(duty);
		pv.setReceipt(receipt);
		pv.setBizType(bizType);
		pv.setOrigin(origin);
		pv.setIp(ip);
		
		service.insertProduct(pv);
		resp.sendRedirect("/Kmarket/admin/product/list.do");
	}

}
