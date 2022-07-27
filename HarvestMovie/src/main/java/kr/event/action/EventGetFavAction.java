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

public class EventGetFavAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		//전송된 데이터 반환
		int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		EventDAO dao = EventDAO.getInstance();
		
		if(user_num == null) {//로그인 되지 않은 경우
			mapAjax.put("status", "naFav");
			mapAjax.put("count", dao.selectFavCount(event_board_num));
		}else {//로그인 된 경우
			//로그인된 아이디 셋팅
			EventFavVO eventFav= dao.selectFav(event_board_num, user_num);
			
			if(eventFav!=null) {//좋아요 클릭
				mapAjax.put("status","yesFav");
				mapAjax.put("count",dao.selectFavCount(event_board_num));
			}else {//좋아요 미클릭
				mapAjax.put("status","noFav");
				mapAjax.put("count",dao.selectFavCount(event_board_num));
			}
		}
		
		//JSON 데이터 생성
				ObjectMapper mapper = new ObjectMapper();
				String ajaxData = mapper.writeValueAsString(mapAjax);
				
				request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
