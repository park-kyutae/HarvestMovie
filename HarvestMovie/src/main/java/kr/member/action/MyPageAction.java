package kr.member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;
import kr.movie.vo.MovieVO;
import kr.util.PagingUtil;

public class MyPageAction implements Action {
    private static final int REVIEW_COUNT = 10;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();


        Integer user_num = (Integer) session.getAttribute("user_num");
        if (user_num == null) {//로그인이 되지 않은 경우
            return "redirect:/member/loginForm.do";
        }

        //로그인 된 경우
        MemberDAO dao = MemberDAO.getInstance();
        MemberVO member = dao.getMember(user_num);

        //Review
        //ReviewDAO reviewdao = ReviewDAO.getInstance();
        //ReviewVO review = reviewdao.getUserReviewMyPage(user_num);

        //request.setAttribute("review", review);


        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        List<ReviewVO> reviewVOList = reviewDAO.getUserReviewMyPage(user_num,REVIEW_COUNT);


        request.setAttribute("reviewVOList", reviewVOList);
        request.setAttribute("member", member);


        return "/WEB-INF/views/member/myPage.jsp";
    }

}
