package kr.event.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventVO;
import kr.util.FileUtil;

public class EventDeleteFileAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String,String> mapAjax = new HashMap<String,String>();
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num == null) {//로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else {//로그인 된 경우
			int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
			EventDAO dao = EventDAO.getInstance();
			EventVO db_event = dao.getEvent(event_board_num);
			if(user_num!=db_event.getMem_num()) {
				mapAjax.put("result","wrongAccess");
			}else {
				dao.deleteFile(event_board_num);
				
				//파일 삭제 
				FileUtil.removeFile(request,db_event.getEvent_filename());
				
				mapAjax.put("result", "success");
			}
		}
		
		//JSON 데이터 생성
				ObjectMapper mapper = new ObjectMapper();
				String ajaxData = mapper.writeValueAsString(mapAjax);
				
				request.setAttribute("ajaxData", ajaxData);
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
















