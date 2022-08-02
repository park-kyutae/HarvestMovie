package kr.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.OrdersVO;
import kr.shop.vo.ProductDTO;
import kr.shop.vo.ProductVO;

public class ProductMyPageAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductDTO> list = dao.getOrderList(user_num);
		
		request.setAttribute("list", list);
		request.setAttribute("mem_num", user_num);
		
		return "/WEB-INF/views/shop/productMyPage.jsp";
	}
}
