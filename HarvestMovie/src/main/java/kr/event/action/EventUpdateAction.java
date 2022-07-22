package kr.event.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.FileUtil;

public class EventUpdateAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		MultipartRequest multi = FileUtil.createFile(request);
		int event_board_num = Integer.parseInt(multi.getParameter("event_board_num"));
		String event_filename = multi.getFilesystemName("event_filename");
		
		EventDAO dao=EventDAO.getInstance();
		//수정전 데이터
		EventVO db_event = dao.getEvent(event_board_num);
		if(user_num != db_event.getMem_num()) {
			//로그인한 회원번호와 작성자 회원번호가 불일치
			
			//업로드된 파일이 있으면 파일 삭제
			FileUtil.removeFile(request, event_filename);
			return "/WEB-INF/views/common/notice.jsp";
		}
		
		// 로그인한 회원번호와 작성자 회원번호가 일치
		EventVO event = new EventVO();
		event.setEvent_board_num(event_board_num);
		event.setEvent_title(multi.getParameter("event_title"));
		event.setEvent_content(multi.getParameter("event_content"));
		event.setEvent_ip(request.getRemoteAddr());
		event.setEvent_filename(event_filename);

		dao.updateEvent(event);

		if (event_filename != null) {
			// 세 파일로 교체할 때 원래 파일 제거
			FileUtil.removeFile(request, db_event.getEvent_filename());
		}

		return "redirect:/event/eventDetail.do?event_board_num="+event_board_num;
	}

}
