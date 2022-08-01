package kr.event.action;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.event.dao.EventDAO;
import kr.event.vo.EventReplyVO;
import kr.util.PagingUtil;

public class EventListReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int event_board_num = Integer.parseInt(request.getParameter("event_board_num"));
		
		EventDAO dao = EventDAO.getInstance();
		int count = dao.getReplyEventCount(event_board_num);
		
		int rowCount = 10;
		PagingUtil page= new PagingUtil(Integer.parseInt(pageNum),count,rowCount,1,null);
		
		List<EventReplyVO> list = null;
		if(count > 0 ) {
			list=dao.getListReplyEvent(page.getStartRow(),page.getEndRow() , event_board_num);
		}else {
			list = Collections.emptyList();
		}
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		Map<String,Object> mapAjax = new HashMap<String,Object>();
		mapAjax.put("count", count);
		mapAjax.put("rowCount",	 rowCount);
		mapAjax.put("list", list);
		//로그인한 회원번호와 작성자 회원번호 일치 여부를 체크하기 위해
		mapAjax.put("user_num", user_num);
		
		//JSON 데이터로 변환
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
