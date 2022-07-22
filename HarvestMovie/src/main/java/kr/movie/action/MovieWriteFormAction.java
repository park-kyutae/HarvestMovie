package kr.movie.action;

import kr.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieWriteFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        return "/WEB-INF/views/movie/movieWriteForm.jsp";
    }
}
