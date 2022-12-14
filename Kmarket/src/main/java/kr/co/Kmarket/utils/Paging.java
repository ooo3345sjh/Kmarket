package kr.co.Kmarket.utils;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Paging {
	
	/*** 페이징 처리 ***/
	public static Map<String, Object> paging(Map<String, Object> map){
		
		HttpServletRequest req = (HttpServletRequest)map.get("request");
		String searchField = (String)map.get("searchField"); // 검색 필드
		String searchWord = (String)map.get("searchWord");   // 검색 단어
		
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		
		int totalCount  = (int)map.get("totalCount"); // 전체 게시물 개수 
		int pageSize    = 10; // 페이지당 출력할 페이지 개수
		int lastPageNum = (int)Math.ceil(totalCount / 10.0); // 마지막 페이지 번호 계산
		int currentPage = 1;  // 기본값
		int limitStart  = 0;  // 현재 페이지에서 시작하는 게시물 시작값
		
		int pageGroupCurrent = 1; // 그룹 번호
		int pageGroupStart   = 1; // 그룹에서 첫 페이지
		int pageGroupEnd     = 0; // 그룹에서 마지막 페이지
		int pageStartNum     = 0; // 게시물의 번호 정렬
		
		if(req.getParameter("pageNum") != null && !req.getParameter("pageNum").equals("")) {
			currentPage = Integer.parseInt(req.getParameter("pageNum"));
		}
		
		// 현재 페이지 기준 DB상의 첫번째 게시물의 번호 - limit 시작값 계산
		limitStart = (currentPage - 1) * pageSize;
		map.put("limitStart", limitStart);
		
		// 페이지 그룹 계산
		pageGroupCurrent = (int)Math.ceil(currentPage / 10.0);
		pageGroupStart = (pageGroupCurrent - 1) * pageSize + 1;
		pageGroupEnd = pageGroupCurrent * pageSize;
		
		// 마지막 페이지보다 그룹 마지막 페이지가 클 경우
		if(pageGroupEnd > lastPageNum) pageGroupEnd = lastPageNum;
		
		// 게시판에 표시할 시작 번호 계산
		pageStartNum = totalCount - limitStart;
		
		map.put("pageGroupStart", pageGroupStart);
		map.put("pageGroupEnd", pageGroupEnd);
		map.put("pageGroupCurrent", pageGroupCurrent);
		map.put("currentPage", currentPage);
		map.put("lastPageNum", lastPageNum);
		map.put("pageStartNum", pageStartNum);
		
		return map;
	}
	
	/*** 페이지 태그 문자열을 반환하는 서비스  ***/
	public static String getPageTags(Map<String, Object> map) {
		
		String searchField   = (String)map.get("searchField");
		String searchWord   = (String)map.get("searchWord");
		int pageGroupStart   = (int)map.get("pageGroupStart");
		int pageGroupEnd     = (int)map.get("pageGroupEnd");
		int pageGroupCurrent = (int)map.get("pageGroupCurrent");
		int currentPage      = (int)map.get("currentPage");
		int lastPageNum      = (int)map.get("lastPageNum");
		

		StringBuffer pageTags = new StringBuffer(); // 페이지 태그 모음
		int prevPage = pageGroupStart - 1;    // 이전 페이지
		int nextPage = pageGroupEnd + 1;      // 다음 페이지
		String contextPath = ((HttpServletRequest)map.get("request")).getContextPath();
		
		String group = (String)map.get("group");
		String cate1 = (String)map.get("cate1");
		String cate2 = (String)map.get("cate2");
		
		// 그룹이 admin인 경우 첫페이지 tag 삽입
		if(group.equals("admin")) {
			String uri = "<a href=\"" + contextPath + "/" + group + "/list.do?pg=1";
			
			if(searchWord != null) {
				uri += "&searchField=" + searchField + "&searchWord=" + searchWord; 
			}
			
			uri += "\" class=\"first\">이전</a>";
			
			pageTags.append(uri);
		}
		
		// 이전 페이지 tag 
		if(pageGroupCurrent > 1) {
			
			String uri = "<a href=\"" + contextPath + "/" + group + "/list.do?pg=" + prevPage;
			
			if(!group.equals("admin")) {
				uri += "&cate1=" + cate1 + "&cate2=" + cate2;
			}
			
			if(searchWord != null) {
				uri += "&searchField=" + searchField + "&searchWord=" + searchWord; 
			}
			
			uri += "\" class=\"prev\"><&nbsp;이전</a>";

			pageTags.append(uri);
		}
		
		for(int i=pageGroupStart; i<=pageGroupEnd; i++) {
			if(currentPage == i) { // 현재 페이지와 값이 같다면 링크X
				pageTags.append("<a href=\"#\" class=\"pageNum on\">" + String.valueOf(i) + "</a>");
			} else {
				String uri = "<a href=\"" + contextPath + "/board/list.do?pg=" + i;
				
				if(!group.equals("admin")) {
					uri += "&cate1=" + cate1 + "&cate2=" + cate2;
				}
				
				if(searchWord != null) {
					uri += "&searchField=" + searchField + "&searchWord=" + searchWord; 
				}
						
				uri += "\" class=\"pageNum\">" + String.valueOf(i) + "</a>";
				
				pageTags.append(uri);
			}
		}
		
		// 다음 페이지 tag 
		if(pageGroupEnd < lastPageNum) { // 반복문의 마지막이며 마지막 페이지 번호보다 작을 경우
			String uri = "<a href=\"" + contextPath + "/board/list.do?pageNum=" + nextPage;
			
			if(!group.equals("admin")) {
				uri += "&cate1=" + cate1 + "&cate2=" + cate2;
			}
					   
			
			if(searchWord != null) {
				uri += "&searchField=" + searchField + "&searchWord=" + searchWord;
			}
			
			uri += "\" class=\"next\">다음&nbsp;></a>";
			
			pageTags.append(uri);
		}
		
		// 그룹이 admin인 경우 마지막페이지 tag 삽입
		if(group.equals("admin")) {
			String uri = "<a href=\"" + contextPath + "/" + group + "/list.do?pg=" + lastPageNum;
			
			if(searchWord != null) {
				uri += "&searchField=" + searchField + "&searchWord=" + searchWord; 
			}
			
			uri += "\" class=\"first\">이전</a>";
			
			pageTags.append(uri);
		}
		
		return pageTags.toString();
	}
}
