package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MovieMainAction implements Action{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");



        MovieDAO movieDAO = MovieDAO.getInstance();
        List<MovieVO> ratingVOList = movieDAO.getRatingTheme();
        List<MovieVO> genreVOList = movieDAO.getGenreTheme();
        List<MovieVO> mainVOList = movieDAO.getMainMovie();

        request.setAttribute("mainVOList",mainVOList);
        request.setAttribute("genreVOList",genreVOList);
        request.setAttribute("ratingVOList",ratingVOList);

        return "/WEB-INF/views/movie/movieMain.jsp";

    }

}
