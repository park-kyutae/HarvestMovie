package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class MovieRatingAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        int mem_num = 3;
        //로그인 기능 추가전 임시 값 추후 삭제  세션으로 처ㅡㅍ_

        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        float mv_rating = Float.parseFloat(request.getParameter("mv_rating"));



        MovieDAO movieDAO = MovieDAO.getInstance();
        boolean isSuccess = movieDAO.setRating(mv_num,mem_num,mv_rating);

        Map<String, String> mapAjax = new HashMap<>();
        mapAjax.put("isSuccess", String.valueOf(isSuccess));


        ObjectMapper mapper = new ObjectMapper();
        String ajaxData = mapper.writeValueAsString(mapAjax);

        request.setAttribute("ajaxData", ajaxData);

        return "/WEB-INF/views/common/ajax_view.jsp";
    }
}


