package kr.main.action;

import kr.controller.Action;
import kr.member.dao.MemberDAO;
import kr.member.vo.MemberVO;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class MainAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        MemberVO memberVO = new MemberVO();
        if (user_num != null) {
            memberVO = MemberDAO.getInstance().getMember(user_num);

        }

        MovieDAO movieDAO = MovieDAO.getInstance();
        List<MovieVO> ratingVOList = movieDAO.getRatingTheme();
        List<MovieVO> genreVOList = movieDAO.getGenreTheme();
        List<MovieVO> mainVOList = movieDAO.getMainMovie();


        request.setAttribute("memberVO",memberVO);
        request.setAttribute("mainVOList", mainVOList);
        request.setAttribute("genreVOList", genreVOList);
        request.setAttribute("ratingVOList", ratingVOList);

        return "/WEB-INF/views/main/main.jsp";

    }

}
