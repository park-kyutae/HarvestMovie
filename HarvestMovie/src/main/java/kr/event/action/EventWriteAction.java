package kr.event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;


import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.FileUtil;

public class EventWriteAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//HttpSession session = request.getSession();
		//Integer user_num = 
		//		(Integer)session.getAttribute("user_num");
		//if(user_num==null) {//로그인이 되지 않은 경우
		//	return "redirect:/member/loginForm.jsp";
		//}
		int user_num= 999;
		
		
		//로그인이 된 경우
		MultipartRequest multi = 
				FileUtil.createFile(request);
		EventVO event= new EventVO();
		event.setEvent_title(multi.getParameter("event_title"));
		event.setEvent_content(multi.getParameter("event_content"));
		event.setEvent_ip(request.getRemoteAddr());
		event.setEvent_filename(
				multi.getFilesystemName("event_filename"));
		event.setMem_num(user_num);
		
		EventDAO dao = EventDAO.getInstance();
		dao.insertEvent(event);
		
		return "/WEB-INF/views/event/eventWrite.jsp";
		
	}

}
