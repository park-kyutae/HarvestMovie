package kr.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;

public class ShopMainAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductVO> productList = dao.getListPhotoProduct();
		
		//MemberDAO memdao = MemberDAO.getInstance();
		//List<MemberVO> memberList = memdao.
		
		request.setAttribute("mem_num", user_num);
		request.setAttribute("productList", productList);
		
		return "/WEB-INF/views/shop/shopMain.jsp";
	}
}
