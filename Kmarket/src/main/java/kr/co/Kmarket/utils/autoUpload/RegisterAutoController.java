package kr.co.Kmarket.utils.autoUpload;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.Kmarket.service.ProductService;

@WebServlet("/admin/registerAuto.do")
public class RegisterAutoController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ProductService service = new ProductService();
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("RegisterAutoController doGet...");
		RequestDispatcher dispatcher = req.getRequestDispatcher("/admin/registerAuto.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		logger.info("RegisterAutoController doPost...");
		ServletContext ctx = req.getServletContext();
		String cate1 = req.getParameter("category1");
		String cate2 = "1" + req.getParameter("category2");
		System.out.println("cate1 : " + cate1);
		System.out.println("cate2 : " + cate2);
		cate1 = "18";
		for(int k=10; k<=14; k++) {
			cate2 = k + "";
			
			List<XmlVO> list = new ArrayList<>();
			
			String cate1Path = ctx.getRealPath("/file/" + cate1 + "/");
			String cate2Path = cate1Path + cate2;
			
			File cate1Dir = new File(cate1Path);
			File cate2Dir = new File(cate2Path);
			
			if(!cate1Dir.exists()) cate1Dir.mkdirs();
			if(!cate2Dir.exists()) cate2Dir.mkdirs();
			
			String path = "C:/Users/java2/Desktop/workspace/Kmarket/product_image/product_image/" 
						+ cate1 + "/" + cate2 + "/";
			String fileNm = cate1 + "-" + cate2 + ".xlsx";
			
			/*** 엑셀 파일 읽어오기 START ***/
			try {
				FileInputStream file = new FileInputStream(new File(path + fileNm));
				
				System.out.println((new File(path + fileNm)).exists());
	            // 엑셀 파일로 Workbook instance를 생성한다.
	            XSSFWorkbook workbook = new XSSFWorkbook(file);

	            // workbook의 첫번째 sheet를 가저온다.
	            XSSFSheet sheet = workbook.getSheetAt(0);

	            // 만약 특정 이름의 시트를 찾는다면 workbook.getSheet("찾는 시트의 이름");
	            // 만약 모든 시트를 순회하고 싶으면
	            // for(Integer sheetNum : workbook.getNumberOfSheets()) {
	            //      XSSFSheet sheet = workbook.getSheetAt(i);
	            // }
	            // 아니면 Iterator<Sheet> s = workbook.iterator() 를 사용해서 조회해도 좋다.

	            // 모든 행(row)들을 조회한다.
	            int i = 0;
	            XmlVO xv = null;
	            
	            A: for (Row row : sheet) {
	                // 각각의 행에 존재하는 모든 열(cell)을 순회한다.
	                Iterator<Cell> cellIterator = row.cellIterator();
	                if(i++ == 0) continue;
	                
	                xv = new XmlVO();
	                while (cellIterator.hasNext()) {
	                    Cell cell = cellIterator.next();
	                    
	                    // cell의 타입을 하고, 값을 가져온다.
	                    switch (cell.getCellType()) {

	                        case NUMERIC:
	                            //getNumericCellValue 메서드는 기본으로 double형 반환
	                        	if(cell.getColumnIndex() == 0 && ((int)cell.getNumericCellValue()) == 99999999) {
	                        		break A;
	                        	} else if(cell.getColumnIndex() == 0) {
	                            	xv.setNO((int) cell.getNumericCellValue());
	                            	System.out.println("no : " + xv.getNO());
	                            } else {
	                            	xv.setPrice((int) cell.getNumericCellValue());
	                            	System.out.println("price : " + xv.getPrice());
	                            }
	                            break;

	                        case STRING:
	                        	if(cell.getColumnIndex() == 1) {
	                        		xv.setCompany(cell.getStringCellValue());
	                        		System.out.println("company : " + xv.getCompany());
	                        	} else {
	                        		xv.setTitle(cell.getStringCellValue());
	                        		System.out.println("title : " + xv.getTitle());
	                        	}
	                            break;
	                    }
	                }
	                
	                list.add(xv);
	            }
	            
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
			/*** 엑셀 파일 읽어오기 END ***/
			
			String[] thumb1FileNames = new File(path + "120/").list();
			String[] thumb2FileNames = new File(path + "460/").list();
			String[] thumb3FileNames = new File(path + "860").list();
			String[] detailFileNames = new File(path + "940/").list();
			
			thumb1FileNames = sorting(thumb1FileNames);
			thumb2FileNames = sorting(thumb2FileNames);
			thumb3FileNames = sorting(thumb3FileNames);
			detailFileNames = sorting(detailFileNames);
			
			int count = 0;
			for(XmlVO xv : list) {
				
				String thumbnail1Name = UUID.randomUUID().toString() + ".jpg";
				String thumbnail2Name = UUID.randomUUID().toString() + ".jpg";
				String thumbnail3Name = UUID.randomUUID().toString() + ".jpg";
				String detailName = UUID.randomUUID().toString() + ".jpg";
				xv.setThumb1(thumbnail1Name);
				xv.setThumb2(thumbnail2Name);
				xv.setThumb3(thumbnail3Name);
				xv.setDetail(detailName);
				// 목록 섬네일
				File thumbnail1 = new File(path + "120/" + thumb1FileNames[count]);
				File newThumbnail1 = new File(cate2Dir + "/" + thumbnail1Name);
				Files.copy(thumbnail1.toPath(), newThumbnail1.toPath(), StandardCopyOption.REPLACE_EXISTING);
				
				// 메인 섬네일
				File thumbnail2 = new File(path + "460/" + thumb2FileNames[count]);
				File newThumbnail2 = new File(cate2Dir + "/" + thumbnail2Name);
				Files.copy(thumbnail2.toPath(), newThumbnail2.toPath(), StandardCopyOption.REPLACE_EXISTING);
				
				// 상세 섬네일
				File thumbnail3 = new File(path + "860/" + thumb3FileNames[count]);
				File newThumbnail3 = new File(cate2Dir + "/" + thumbnail3Name);
				Files.copy(thumbnail3.toPath(), newThumbnail3.toPath(), StandardCopyOption.REPLACE_EXISTING);
				
				// 상세정보
				File detail = new File(path + "940/" + detailFileNames[count]);
				File newDetail = new File(cate2Dir + "/" + detailName);
				Files.copy(detail.toPath(), newDetail.toPath(), StandardCopyOption.REPLACE_EXISTING);
				count++;
				
			}
			
			AutoUploadDAO dao = new AutoUploadDAO();
			int result = dao.insertAutoUpload(list, cate1, cate2);
			System.out.println("result : " + result);
		}
		
		
		
		
		resp.sendRedirect("/Kmarket/admin/registerAuto.do");
	}
	
	public String[] sorting(String[] fileNames) {
		
		int[] val1 = new int[fileNames.length];
		int i = 0;
		for(String str : fileNames) {
			int index = str.lastIndexOf(".");
			String numberStr = str.substring(0, index);
			val1[i] = Integer.parseInt(numberStr);
			i++;
		}
		
		Arrays.sort(val1);
		for(int j=0; j<val1.length; j++) {
			int indexJ = fileNames[j].lastIndexOf(".");
			int numStrJ = Integer.parseInt(fileNames[j].substring(0, indexJ));
			if(val1[j] != numStrJ) {
				
				for(int k=0; k<val1.length; k++) {
					int indexK = fileNames[k].lastIndexOf(".");
					int numStrK = Integer.parseInt(fileNames[k].substring(0, indexK));
					if(val1[j] == numStrK) {
						String temp = fileNames[j];
						fileNames[j] = fileNames[k];
						fileNames[k] = temp;
					}
				}
			}
		}
		
		for(String str : fileNames) {
			System.out.println(str);
		}
		System.out.println();
		return fileNames;
	}

}
