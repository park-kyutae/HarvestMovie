package kr.movie.review.action;

import kr.controller.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewWriteFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return "/WEB-INF/views/movie/review/reviewWriteForm.jsp";

    }
}
