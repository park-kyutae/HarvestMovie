package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.StringUtil;

public class NewsDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//글번호 반환
		int news_num = Integer.parseInt(
				        request.getParameter("news_num"));
		NewsDAO dao = NewsDAO.getInstance();
		//조회수 증가
		dao.updateNewsReadcount(news_num);
		//글상세 정보 반환
		NewsVO board = dao.getNews(news_num);
		
		//HTML를 허용하지 않음
		board.setNews_title(StringUtil.useNoHtml(board.getNews_title()));
		//HTML를 허용하지 않으면서 줄바꿈 처리
		board.setNews_content(StringUtil.useNoHtml(board.getNews_content()));
		
		request.setAttribute("board", board);
		
		return "/WEB-INF/views/news/newsDetail.jsp";
	}

}





