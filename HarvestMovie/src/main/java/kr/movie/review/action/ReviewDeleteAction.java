package kr.movie.review.action;

import kr.controller.Action;
import kr.movie.review.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewDeleteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        Integer user_auth = (Integer) session.getAttribute("user_auth");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        user_auth=2;
        user_num=3;
        int rv_user_num = Integer.parseInt(request.getParameter("rv_user_num"));

        if (user_auth ==null) {
            request.setAttribute("result","try_login");
            return "/WEB-INF/views/movie/movieResult.jsp";

        } else if (user_auth == 9) {


            ReviewDAO reviewDAO = ReviewDAO.getInstance();
            reviewDAO.deleteReview(mv_num,rv_user_num);

            request.setAttribute("result","delete");

            return "/WEB-INF/views/movie/review/reviewResult.jsp?mv_num="+mv_num;
        } else if (user_num != rv_user_num) {
            request.setAttribute("result","wrong_id");
            return "/WEB-INF/views/movie/movieResult.jsp";

        }

            ReviewDAO reviewDAO = ReviewDAO.getInstance();
            reviewDAO.deleteReview(mv_num,user_num);

            request.setAttribute("result","delete");

        return "/WEB-INF/views/movie/review/reviewResult.jsp?mv_num="+mv_num;

    }
}
