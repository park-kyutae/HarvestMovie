package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MovieModifyFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_auth = (Integer) session.getAttribute("user_auth");
        user_auth=2;
        if (user_auth ==null) {
            request.setAttribute("result","try_login");
            return "/WEB-INF/views/movie/movieResult.jsp";

        } else if (user_auth != 9) {
            request.setAttribute("result","wrong_id");
            return "/WEB-INF/views/movie/movieResult.jsp";

        }


        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        MovieDAO movieDAO = MovieDAO.getInstance();
        MovieVO movieVO = movieDAO.getMovieDetail(mv_num);

        request.setAttribute("movieVO",movieVO);
        return "/WEB-INF/views/movie/movieModifyForm.jsp";
    }
}
