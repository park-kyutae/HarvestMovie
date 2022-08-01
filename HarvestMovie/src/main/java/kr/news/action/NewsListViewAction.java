//1번
package kr.news.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.PagingUtil;

public class NewsListViewAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		NewsDAO dao = NewsDAO.getInstance();
		int count = dao.getNewsCount(keyfield, keyword);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,
				Integer.parseInt(pageNum),count,6,10,"newslistview.do");
		
		List<NewsVO> viewlist = null;
		if(count > 0) {
			viewlist = dao.getListNewsView(page.getStartRow(),
					       page.getEndRow(), keyfield, keyword);
		}
		
		request.setAttribute("count", count);
		request.setAttribute("viewlist", viewlist);
		request.setAttribute("page", page.getPage());
		
		return "/WEB-INF/views/news/newslistview.jsp";
	}

}
