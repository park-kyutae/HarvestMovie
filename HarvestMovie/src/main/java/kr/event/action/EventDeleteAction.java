package kr.event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.controller.Action;
import kr.util.FileUtil;

public class EventDeleteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer user_num=(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		
		
		int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
		EventDAO dao = EventDAO.getInstance();
		EventVO db_event= dao.getEvent(event_board_num);
		/*
		 * if(user_num != db_event.getMem_num()) { //로그인한 회원번호와 작성자 회원번호가 불일치 return
		 * "/WEB-INF/views/common/notice.jsp"; }
		 */
		
		Integer user_auth=(Integer)session.getAttribute("user_auth");
		
		if(user_num == db_event.getMem_num() || user_auth == 9){
		//로그인한 회원번호와 작성자 회원번호가 일치
		dao.deleteEvent(event_board_num);
		//파일 삭제
		FileUtil.removeFile(request, db_event.getEvent_filename());
		}else if(user_num != db_event.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호가 불일치
			return "/WEB-INF/views/event/eventList.jsp";
		}
	
		return "redirect:/event/eventList.do";
	}

}
