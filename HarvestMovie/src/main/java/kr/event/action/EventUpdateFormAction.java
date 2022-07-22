package kr.event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;

public class EventUpdateFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		//로그인이 된 경우
		int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
		EventDAO dao = EventDAO.getInstance();
		EventVO event = dao.getEvent(event_board_num);
		if(user_num!=event.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호 불일치
			return "/WEB-INF/views/common/notice.jsp";
		}
		//로그인이 되어 있고 로그인한 회원번호와 작성자 회원번호 일치
		request.setAttribute("event", event);
		
		return "/WEB-INF/views/event/eventUpdateForm.jsp";
	}

}
