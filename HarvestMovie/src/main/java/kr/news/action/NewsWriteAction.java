package kr.news.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class NewsWriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인이 된 경우
		MultipartRequest multi = 
				FileUtil.createFile(request);
		NewsVO news = new NewsVO();
		news.setNews_title(multi.getParameter("news_title"));
		news.setNews_content(multi.getParameter("news_content"));
		news.setNews_photo(
				multi.getFilesystemName("news_photo"));
		
		NewsDAO dao = NewsDAO.getInstance();
		dao.insertNews(news);
		
		return "/WEB-INF/views/news/newsWrite.jsp";
	}

}
