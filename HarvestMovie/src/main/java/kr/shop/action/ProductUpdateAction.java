package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;
import kr.util.FileUtil;

public class ProductUpdateAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		HttpSession session = request.getSession();
//		Integer user_num = (Integer)session.getAttribute("user_num");
//		
//		if(user_num==null) {
//			return "redirect:/member/loginForm.jsp";
//		}
		
		request.setCharacterEncoding("utf-8");
		
		MultipartRequest multi = 
				FileUtil.createFile(request);
		int pd_num = Integer.parseInt(multi.getParameter("pd_num"));
		String pd_photo = multi.getFilesystemName("pd_photo");
		
		ProductDAO dao = ProductDAO.getInstance();
		ProductVO product = new ProductVO();
		
		product.setPd_num(pd_num);
		product.setPd_name(multi.getParameter("pd_name"));
		product.setPd_price(Integer.parseInt(multi.getParameter("pd_price")));
		product.setPd_quantity(Integer.parseInt(multi.getParameter("pd_quantity")));
		product.setPd_content(multi.getParameter("pd_content"));
		product.setPd_photo(pd_photo);
		
		dao.productUpdate(product);

		
		return "redirect:/shop/productDetail.do?pd_num="+pd_num;
	}
}
