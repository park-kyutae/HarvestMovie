package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class MovieRatingAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        user_num=3;
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> mapAjax = new HashMap<>();

        if (user_num == null) {

            mapAjax.put("isSuccess","try_login" );


            String ajaxData = mapper.writeValueAsString(mapAjax);

            request.setAttribute("ajaxData", ajaxData);

            return "/WEB-INF/views/common/ajax_view.jsp";
        }
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        float mv_rating = Float.parseFloat(request.getParameter("mv_rating"));



        MovieDAO movieDAO = MovieDAO.getInstance();
        boolean isSuccess = movieDAO.setRating(mv_num,user_num,mv_rating);

        mapAjax.put("isSuccess", String.valueOf(isSuccess));


        String ajaxData = mapper.writeValueAsString(mapAjax);

        request.setAttribute("ajaxData", ajaxData);

        return "/WEB-INF/views/common/ajax_view.jsp";
    }
}


