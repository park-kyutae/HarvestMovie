package kr.movie.action;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.review.dao.ReviewDAO;
import kr.movie.review.vo.ReviewVO;
import kr.movie.vo.MovieVO;
import kr.util.DBUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class MovieDetailAction implements Action {
    private static final int REVIEW_START =1;
    private static final int REVIEW_END = 3;//가져올 리뷰 개수

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");

        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        MovieDAO movieDAO = MovieDAO.getInstance();
        MovieVO movieVO = movieDAO.getMovieDetail(mv_num);

        ReviewDAO reviewDAO = ReviewDAO.getInstance();
        List<ReviewVO> reviewVOList = reviewDAO.getReviewList(mv_num, REVIEW_START, REVIEW_END);
        for (; reviewVOList.size() < 3; reviewVOList.add(new ReviewVO())) {

        }
        List<String> memNameList = new ArrayList<>();
        for (String memName : memNameList) {
            memNameList.add(memName);
        }

        MemberDAO memberDAO = MemberDAO.getInstance();
        MemberVO memberVO = new MemberVO();
        if (user_num != null) {
            memberVO = memberDAO.getMember(user_num);
        }


        request.setAttribute("memberVO", memberVO);

        request.setAttribute("movieVO", movieVO);
        request.setAttribute("reviewVOList", reviewVOList);
        return "/WEB-INF/views/movie/movieDetail.jsp";
    }
}
