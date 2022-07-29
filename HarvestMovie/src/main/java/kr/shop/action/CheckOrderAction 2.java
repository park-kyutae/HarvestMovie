package kr.shop.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;

public class CheckOrderAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		//int mem_num = user_num;
		ProductDAO dao = ProductDAO.getInstance();
		
		//boolean isSuccess = dao.productOrder(pd_num, mem_num);
		boolean isSuccess = dao.checkProductOrder(pd_num);
		
		Map<String, String> mapAjax = new HashMap<>();
        mapAjax.put("isSuccess", String.valueOf(isSuccess));
		
		request.setAttribute("ajaxData", "1");
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
}
