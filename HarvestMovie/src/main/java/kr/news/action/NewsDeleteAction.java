package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class NewsDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		
		int news_num = Integer.parseInt(
				        request.getParameter("news_num"));
		NewsDAO dao = NewsDAO.getInstance();
		NewsVO db_news = dao.getNews(news_num);
		if(user_num != db_news.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호가 불일치
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인한 회원번호와 작성자 회원번호가 일치
		dao.newsDelete(news_num);
		//파일 삭제
		FileUtil.removeFile(request, db_news.getNews_photo());
		
		return "redirect:/news/newslist.do";
	}

}
