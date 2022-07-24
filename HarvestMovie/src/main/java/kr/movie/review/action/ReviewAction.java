package kr.movie.review.action;

import kr.controller.Action;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class ReviewAction implements Action {
    private static final int REVIEW_COUNT = 10;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        user_num = 3;

        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        List<ReviewVO> reviewVOList = reviewDAO.getReviewList(mv_num, REVIEW_COUNT);
        ReviewVO myReviewVO = null;
        if (user_num != null) {
             myReviewVO = reviewDAO.getUserReview(mv_num, user_num);
        }

        request.setAttribute("myReviewVO", myReviewVO);
        request.setAttribute("reviewVOList", reviewVOList);

        return "/WEB-INF/views/movie/review/review.jsp?mv_num=" + request.getParameter("mv_num");
    }
}
