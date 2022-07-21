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
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.jsp";
		}
		
		
		//로그인이 된 경우
		MultipartRequest multi = 
				FileUtil.createFile(request);
		NewsVO news = new NewsVO();
		news.setNews_title(multi.getParameter("news_title"));
		news.setNews_content(multi.getParameter("news_content"));
		news.setNews_photo(
				multi.getFilesystemName("news_photo"));
		news.setMem_num(user_num);
		
		NewsDAO dao = NewsDAO.getInstance();
		dao.insertNews(news);
		
		return "/WEB-INF/views/board/newsWrite.jsp";
	}

}
