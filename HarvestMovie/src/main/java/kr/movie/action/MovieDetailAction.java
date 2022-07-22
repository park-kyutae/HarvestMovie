package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MovieDetailAction implements Action {
    private static final int REVIEW_COUNT=4;//가져올 리뷰 개수
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        MovieDAO movieDAO = MovieDAO.getInstance();
        MovieVO movieVO = movieDAO.getMovieDetail(mv_num);

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        List<ReviewVO> reviewVOList = reviewDAO.getReviewList(mv_num,REVIEW_COUNT);

        request.setAttribute("movieVO",movieVO);
        request.setAttribute("reviewVOList",reviewVOList);

        return "/WEB-INF/views/movie/movieDetail.jsp";
    }
}
