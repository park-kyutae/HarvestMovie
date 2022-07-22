package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;

public class InsertFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

//		HttpSession session = request.getSession();
//		Integer mem_num = (Integer)session.getAttribute("mem_num");
//		
//		if(mem_num == null) {
//			return "/WEB-INF/views/shop/shopMain.do";
//		}
		
		return "/WEB-INF/views/shop/insertProductForm.jsp";
	}
}
