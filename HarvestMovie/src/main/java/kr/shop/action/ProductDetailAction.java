package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;

public class ProductDetailAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = dao.productDetail(pd_num);
		request.setAttribute("product", product);
		
		return "/WEB-INF/views/shop/productDetail.jsp";
	}
}
