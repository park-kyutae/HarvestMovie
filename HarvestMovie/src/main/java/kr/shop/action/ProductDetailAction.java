package kr.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;
import kr.util.PagingUtil;

public class ProductDetailAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) pageNum ="1";
		
		
		ProductDAO dao = ProductDAO.getInstance();
		int count = dao.getProductCount();
		PagingUtil util = new PagingUtil(Integer.parseInt(pageNum),count,20,10,"productManagement.do");
		
		List<ProductVO> list = null;
		if(count > 0) {
			list = dao.getListProduct(util.getStartRow(), util.getEndRow());
		}
		
		request.setAttribute("list", list);
		ProductVO product = dao.productDetail(pd_num);
		request.setAttribute("product", product);
		
		return "/WEB-INF/views/shop/productDetail.jsp";
	}
}
