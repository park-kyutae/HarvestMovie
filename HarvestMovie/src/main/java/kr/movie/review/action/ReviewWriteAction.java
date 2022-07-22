package kr.movie.review.action;

import kr.controller.Action;
import kr.movie.review.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWriteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int mem_num = 999;
        String mem_id = "test";
        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        String review_message = request.getParameter("review_message");



        ReviewDAO reviewDAO = ReviewDAO.getInstance();

        if (reviewDAO.checkDuplicatedReview(mv_num, mem_num)) {
            request.setAttribute("result","duplicated");

        }
        else {
            reviewDAO.writeReview(mv_num, mem_num, mem_id, review_message);
            request.setAttribute("result", "write");
        }
        return "/WEB-INF/views/movie/review/reviewResult.jsp?mv_num="+mv_num;
    }
}