package kr.news.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsVO;
import kr.util.FileUtil;

public class NewsUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		
		MultipartRequest multi = 
				FileUtil.createFile(request);
		int news_num = Integer.parseInt(
				multi.getParameter("news_num"));
		String news_photo = multi.getFilesystemName("news_photo");
		
		NewsDAO dao = NewsDAO.getInstance();
		//수정전 데이터
		NewsVO db_news = dao.getNews(news_num);
		if(user_num != db_news.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호가 불일치
			
			//업로드된 파일이 있으면 파일 삭제
			FileUtil.removeFile(request, news_photo);
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		//로그인한 회원번호와 작성자 회원번호가 일치
		NewsVO news = new NewsVO();
		news.setNews_num(news_num);
		news.setNews_title(multi.getParameter("news_title"));
		news.setNews_content(multi.getParameter("news_content"));
		news.setNews_photo(news_photo);
		
		dao.updateNews(news);
		
		if(news_photo!=null) {
			//새 파일로 교체할 때 원래 파일 제거
			FileUtil.removeFile(request, 
					        db_news.getNews_photo());
		}
		
		return "redirect:/news/newsDetail.do?news_num="+news_num;
	}

}




