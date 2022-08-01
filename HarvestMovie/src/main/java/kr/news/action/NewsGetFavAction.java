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

public class NewsGetFavAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		int news_num = Integer.parseInt(
				  request.getParameter("news_num"));
		
		Map<String,Object> mapAjax = 
				          new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		NewsDAO dao = NewsDAO.getInstance();
		if(user_num==null) {//로그인 되지 않은 경우
			mapAjax.put("status", "noFav");
			mapAjax.put("count", 
					dao.newsSelectFavCount(news_num));
		}else {//로그인 된 경우
			//로그인된 아이디 셋팅
			NewsFavVO newsFav = 
					dao.newsSelectFav(news_num, user_num);
			
			if(newsFav!=null) {//좋아요 클릭
				mapAjax.put("status", "yesFav");
				mapAjax.put("count", 
						dao.newsSelectFavCount(news_num));
			}else {//좋아요 미클릭
				mapAjax.put("status", "noFav");
				mapAjax.put("count", 
						dao.newsSelectFavCount(news_num));
			}
		}
		
		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
