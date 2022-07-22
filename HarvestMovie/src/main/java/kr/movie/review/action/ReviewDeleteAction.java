package kr.movie.review.action;

import kr.controller.Action;
import kr.movie.review.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewDeleteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        int mem_num = 999;
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        reviewDAO.deleteReview(mv_num,mem_num);

        request.setAttribute("result","delete");

        return "/WEB-INF/views/movie/review/reviewResult.jsp?mv_num="+mv_num;

    }
}
