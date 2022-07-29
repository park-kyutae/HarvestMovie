package kr.shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.controller.Action;
import kr.shop.dao.ProductDAO;
import kr.shop.vo.ProductVO;
import kr.util.FileUtil;

public class InsertProductAction implements Action{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		
		if(user_num==null) {
			return "redirect:/member/loginForm.jsp";
		}
		
		request.setCharacterEncoding("utf-8");
		
		//로그인이 된경우
		MultipartRequest multi = FileUtil.createFile(request);
		
		ProductVO product = new ProductVO();
		product.setPd_name(multi.getParameter("pd_name"));
		product.setPd_price(Integer.parseInt(multi.getParameter("pd_price")));
		product.setPd_quantity(Integer.parseInt(multi.getParameter("pd_quantity")));
		product.setPd_content(multi.getParameter("pd_content"));
		product.setPd_photo(multi.getFilesystemName("pd_photo"));
		//product.setMem_num(user_num);
		
		ProductDAO dao = ProductDAO.getInstance();
		dao.insertProduct(product);
		
		return "/WEB-INF/views/shop/insertProduct.jsp";
	}
}
