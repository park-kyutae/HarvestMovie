package kr.shop.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;

public class ProductOrderAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		int mem_num = 3; //test user
		ProductDAO dao = ProductDAO.getInstance();
		
		boolean isSuccess = dao.productOrder(pd_num, mem_num);
		
		Map<String, String> mapAjax = new HashMap<>();
        mapAjax.put("isSuccess", String.valueOf(isSuccess));
		
		request.setAttribute("ajaxData", "1");
		return "/WEB-INF/views/common/ajax_view.jsp";
	}
}
