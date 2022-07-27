package kr.event.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.event.dao.EventDAO;
import kr.event.vo.EventFavVO;
import kr.controller.Action;

public class EventWriteFavAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num == null) {//로그인이 되지 않은 경우
			mapAjax.put("result","logout");
		}else {//로그인이 된 경우
			//전송된 데이터 인코딩 처리
			request.setCharacterEncoding("utf-8");
			
			int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
			
			EventDAO dao = EventDAO.getInstance();
			EventFavVO eventFav = dao.selectFav(event_board_num, user_num);
			if(eventFav!=null) {//좋아요 등록된 상태
				dao.deleteFav(eventFav.getEvent_fav_num());
				
				mapAjax.put("result", "success");
				mapAjax.put("status", "noFav");
				mapAjax.put("count", dao.selectFavCount(event_board_num));
			}else {//좋아요 등록되지 않은 상태
				dao.insertFav(event_board_num, user_num);
				
				mapAjax.put("result", "success");
				mapAjax.put("status", "yesFav");
				mapAjax.put("count", dao.selectFavCount(event_board_num));
			}
		}
		//JSON 데이터 생성
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData= mapper.writeValueAsString(mapAjax);
				
		request.setAttribute("ajaxData", ajaxData);
				
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
