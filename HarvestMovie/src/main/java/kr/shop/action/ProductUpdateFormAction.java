package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;

public class ProductUpdateFormAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num == null) {
			return "redirect:/shop/shopMain.do";
		}
		
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = dao.productDetail(pd_num);
		
		request.setAttribute("product", product);
		
		
		return "/WEB-INF/views/shop/productUpdateForm.jsp";
	}
}
