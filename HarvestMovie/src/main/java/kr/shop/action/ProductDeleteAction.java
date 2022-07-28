package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;
import kr.util.FileUtil;

public class ProductDeleteAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginUserForm.do";
		}
		int pd_num = Integer.parseInt(request.getParameter("pd_num"));
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = dao.productDetail(pd_num);
		
		dao.productDelete(pd_num);
		
		//파일삭제
		FileUtil.removeFile(request, product.getPd_photo());
		
		return "redirect:/shop/shopMain.do";
	}
}
