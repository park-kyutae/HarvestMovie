package kr.event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.event.vo.EventVO;
import kr.util.StringUtil;
import kr.controller.Action;
import kr.event.dao.EventDAO;

public class EventDetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//글 번호 반환
		int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
		EventDAO dao = EventDAO.getInstance();
		//조회수 증가
		dao.updateReadcount(event_board_num);
		
		//글상세 정보 반환
		EventVO event = dao.getEvent(event_board_num);
		
		//HTML 를 허용하지 않음
		event.setEvent_title(StringUtil.useNoHtml(event.getEvent_title()));
		
		//HTML를 허용하지 않으면서 줄바꿈 처리
		event.setEvent_content(StringUtil.useBrNoHtml(event.getEvent_content()));
		
		request.setAttribute("event", event);
		
		return "/WEB-INF/views/event/eventDetail.jsp";
	}

}
