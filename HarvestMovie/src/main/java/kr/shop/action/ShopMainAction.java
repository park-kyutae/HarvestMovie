package kr.shop.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;

public class ShopMainAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		ProductDAO dao = ProductDAO.getInstance();
		List<ProductVO> productList = dao.getListPhotoProduct();
		
		//MemberDAO memdao = MemberDAO.getInstance();
		//List<MemberVO> memberList = memdao.
		
		request.setAttribute("productList", productList);
		
		return "/WEB-INF/views/shop/shopMain.jsp";
	}
}
