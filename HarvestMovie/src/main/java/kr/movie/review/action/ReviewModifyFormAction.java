package kr.movie.review.action;

import kr.controller.Action;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewModifyFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        ;
        if (user_num == null) {
            request.setAttribute("result","try_login");
            return "/WEB-INF/views/movie/movieResult.jsp";

        }
        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        ReviewVO reviewVO = reviewDAO.getUserReview(mv_num,user_num);

        request.setAttribute("result","modify");
        request.setAttribute("reviewVO",reviewVO);
        return "/WEB-INF/views/movie/review/reviewModifyForm.jsp";
    }
}
