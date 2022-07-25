package kr.movie.review.action;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.review.dao.ReviewDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReviewWriteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        ;
        if (user_num == null) {
            request.setAttribute("result","try_login");
            return "/WEB-INF/views/movie/movieResult.jsp";

        }

        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        String review_message = request.getParameter("review_message");



        ReviewDAO reviewDAO = ReviewDAO.getInstance();

        if (reviewDAO.checkDuplicatedReview(mv_num, user_num)) {
            request.setAttribute("result","duplicated");

        }
        else {
            reviewDAO.writeReview(mv_num, user_num, review_message);
            request.setAttribute("result", "write");
        }
        return "/WEB-INF/views/movie/review/reviewResult.jsp?mv_num="+mv_num;
    }
}
