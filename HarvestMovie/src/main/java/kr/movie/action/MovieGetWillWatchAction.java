package kr.movie.action;

import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

public class MovieGetWillWatchAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Integer user_num = (Integer) session.getAttribute("user_num");
        user_num=3;
        Map<String, String> mapAjax = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();

        if (user_num == null) {
            mapAjax.put("mv_will_watch_num", "0");
            String ajaxData = mapper.writeValueAsString(mapAjax);
            request.setAttribute("ajaxData", ajaxData);

            return "/WEB-INF/views/common/ajax_view.jsp";

        }
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        MovieDAO movieDAO = MovieDAO.getInstance();
        int mv_will_watch_num = movieDAO.getWillWatch(mv_num, user_num);

        mapAjax.put("mv_will_watch_num", String.valueOf(mv_will_watch_num));


        String ajaxData = mapper.writeValueAsString(mapAjax);

        request.setAttribute("ajaxData", ajaxData);

        return "/WEB-INF/views/common/ajax_view.jsp";
    }
}



