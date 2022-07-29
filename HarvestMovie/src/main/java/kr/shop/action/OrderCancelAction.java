package kr.shop.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;

public class OrderCancelAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num==null) {
			return "redirect:/member/loginForm.jsp";
		}
		request.setCharacterEncoding("utf-8");
		
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		int ord_num = Integer.parseInt(request.getParameter("ord_num"));
		
		ObjectMapper mapper = new ObjectMapper();
		ProductDAO dao = ProductDAO.getInstance();
		
		boolean isSuccess = dao.productDeleteOrder(pd_num, ord_num);
		Map<String, String> mapAjax = new HashMap<>();
		
		mapAjax.put("isSuccess", String.valueOf(isSuccess));
		request.setAttribute("ajaxData", mapper.writeValueAsString(mapAjax));
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
}
