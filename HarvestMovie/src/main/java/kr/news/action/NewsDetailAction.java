package kr.news.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.PagingUtil;
import kr.util.StringUtil;

public class NewsDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//글번호 반환
		int news_num = Integer.parseInt(
				        request.getParameter("news_num"));
		NewsDAO dao = NewsDAO.getInstance();
		NewsDAO dao_view = NewsDAO.getInstance();
		//조회수 증가
		dao.updateNewsReadcount(news_num);
		//글상세 정보 반환
		NewsVO board = dao.getNews(news_num);
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) pageNum = "1";
		
		String keyfield = request.getParameter("keyfield");
		String keyword = request.getParameter("keyword");
		
		int count = dao_view.getNewsCount(keyfield, keyword);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(keyfield,keyword,
				Integer.parseInt(pageNum),count,10,10,"newslistview.do");
		
		List<NewsVO> viewlist = null;
		if(count > 0) {
			viewlist = dao_view.getListNewsView(page.getStartRow(),
					       page.getEndRow(), keyfield, keyword);
		}
		
		//HTML를 허용하지 않음
		board.setNews_title(StringUtil.useNoHtml(board.getNews_title()));
		//HTML를 허용하지 않으면서 줄바꿈 처리
		board.setNews_content(StringUtil.useBrNoHtml(board.getNews_content()));
		
		request.setAttribute("viewlist", viewlist);
		request.setAttribute("page", page.getPage());
		request.setAttribute("news", board);
		
		return "/WEB-INF/views/news/newsDetail.jsp";
	}

}





