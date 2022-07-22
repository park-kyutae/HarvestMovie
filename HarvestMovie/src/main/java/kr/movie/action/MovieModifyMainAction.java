package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieModifyMainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        int mv_main_list_num = Integer.parseInt(request.getParameter("mv_main_list_num"));

        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.setMainMovie(mv_num,mv_main_list_num);

        request.setAttribute("result","modify_main");
        return "/WEB-INF/views/movie/movieResult.jsp";

    }
}
