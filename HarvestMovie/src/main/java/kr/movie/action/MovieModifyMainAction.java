package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieModifyMainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int mem_num = 999;
        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));

        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setMainMovie(mv_num,mem_num);

        request.setAttribute("result","modify");
        return "/WEB-INF/views/movie/movieMainResult.jsp";

    }
}
