package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieModifyFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        MovieDAO movieDAO = MovieDAO.getInstance();
        MovieVO movieVO = movieDAO.getMovieDetail(mv_num);

        request.setAttribute("movieVO",movieVO);
        return "/WEB-INF/views/movie/movieModifyForm.jsp";
    }
}
