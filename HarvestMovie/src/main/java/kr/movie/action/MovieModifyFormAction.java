package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class MovieModifyFormAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_auth = (Integer) session.getAttribute("user_auth");
        ;
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
        HashMap<String, List<String>> mv_staff_info = movieVO.getMv_staff_info();
        HashMap<String, List<String>> temp = new HashMap<>();

        Iterator<String> iterKey = mv_staff_info.keySet().iterator(); // 키값 오름차순
        while (iterKey.hasNext()) {

            String key = iterKey.next();
            if (key == "감독") {
                temp.put("director", mv_staff_info.get(key));

            }else if (key == "배우") {
                temp.put("actor", mv_staff_info.get(key));

            }else if (key == "각본") {
                temp.put("writer", mv_staff_info.get(key));

            }

        }
        movieVO.setMv_staff_info(temp);


        request.setAttribute("movieVO",movieVO);
        return "/WEB-INF/views/movie/movieModifyForm.jsp";
    }
}
