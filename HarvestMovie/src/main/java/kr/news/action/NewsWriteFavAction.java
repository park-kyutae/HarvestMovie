package kr.news.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.news.dao.NewsDAO;
import kr.news.vo.NewsFavVO;

public class NewsWriteFavAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,Object> mapAjax = 
				            new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else {//로그인이 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			
			int news_num = Integer.parseInt(
					   request.getParameter("news_num"));
			
			NewsDAO dao = NewsDAO.getInstance();
			NewsFavVO boardFav = 
					   dao.newsSelectFav(news_num, user_num);
			if(boardFav!=null) {//좋아요 등록된 상태
				dao.newsDeleteFav(boardFav.getNews_fav_num());
				
				mapAjax.put("result", "success");
				mapAjax.put("status", "noFav");
				mapAjax.put("count", dao.newsSelectFavCount(news_num));
			}else {//좋아요 등록되지 않은 상태
				dao.newsInsertFav(news_num, user_num);
				
				mapAjax.put("result", "success");
				mapAjax.put("status", "yesFav");
				mapAjax.put("count",dao.newsSelectFavCount(news_num));
			}
		}
		
		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}






