package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;

public class NewsUpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않는 경우
			return "redirect:/member/loginUserForm.do";
		}
		
		//로그인이 된 경우
		int news_num = Integer.parseInt(
				        request.getParameter("news_num"));
		NewsDAO dao = NewsDAO.getInstance();
		NewsVO news = dao.getNews(news_num);
		if(user_num != news.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호 불일치
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인이 되어 있고 로그인한 회원번호와 작성자 회원번호 일치
		request.setAttribute("news", news);
		
		return "/WEB-INF/views/news/newsUpdateForm.jsp";
	}

}





