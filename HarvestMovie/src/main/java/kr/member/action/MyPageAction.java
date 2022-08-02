package kr.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;
import kr.util.PagingUtil;

public class MyPageAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num == null) {//로그인이 되지 않은 경우
			return "redirect:/member/loginForm.do";
		}
		
		int mem_num = Integer.parseInt(request.getParameter("mem_num"));
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO member = dao.getMember(mem_num);
		
		request.setAttribute("member", member);
		
		//ReviewDAO dao2 = ReviewDAO.getInstance();
		//ReviewVO review = dao2.getUserReviewMyPage(mem_num);	

		//request.setAttribute("review", review);
		
		return "/WEB-INF/views/member/myPage.jsp";
	}

}
