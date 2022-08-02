package kr.movie.action;

import com.oreilly.servlet.MultipartRequest;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

public class MovieModifyAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        Integer user_auth = (Integer) session.getAttribute("user_auth");
        int mv_num = Integer.parseInt(request.getParameter("mv_num"));
        if (user_auth ==null) {
            request.setAttribute("result","try_login");
            return "/WEB-INF/views/movie/movieResult.jsp";

        } else if (user_auth != 9) {
            request.setAttribute("result","wrong_id");
            return "/WEB-INF/views/movie/movieResult.jsp";

        }


        MovieDAO movieDAO = MovieDAO.getInstance();

        MovieVO movieVO = new MovieVO();
        List<String> fileNames = new ArrayList<>();




        MultipartRequest multi =
                FileUtil.createFile(request);

        Enumeration e = multi.getFileNames();
        while (e.hasMoreElements()) {
            String eleName = (String) e.nextElement();
            String fileName = multi.getFilesystemName(eleName);
            fileNames.add(fileName);

        }


        List<String> trailer = Arrays.asList(
                multi.getParameter("mv_trailer").split(","));

        MovieVO OldMovieVO = movieDAO.getMovieDetail(mv_num);
        String mv_main_pic = OldMovieVO.getMv_main_pic();
        if (multi.getFilesystemName("mv_main_pic") !=null) {
             mv_main_pic = multi.getFilesystemName("mv_main_pic");

        }
        String mv_poster = OldMovieVO.getMv_poster();
        if (multi.getFilesystemName("mv_poster")!=null) {
            mv_poster = multi.getFilesystemName("mv_poster");
        }


        List<String> mv_pic = OldMovieVO.getMv_pic();

        for (int i = 1; i < 4; i++) {
            if (multi.getFilesystemName("mv_pic" + i) != null) {
                mv_pic.set(i, multi.getFilesystemName("mv_pic" + i));
            }
        }
        mv_pic = fileNames;
        mv_pic.remove(mv_main_pic);
        mv_pic.remove(mv_poster);


        HashMap<String, List<String>> mv_staff_info = new HashMap<>();
        mv_staff_info.put("감독", Arrays.asList(multi.getParameter("mv_director")));
        mv_staff_info.put("배우", Arrays.asList(multi.getParameter("mv_actor")));
        mv_staff_info.put("각본", Arrays.asList(multi.getParameter("mv_writer")));

        movieVO.setMv_title(multi.getParameter("mv_title"));
        movieVO.setMv_main_pic(mv_main_pic);
        movieVO.setMv_poster(mv_poster);
        movieVO.setMv_genre(multi.getParameter("mv_genre"));
        movieVO.setMv_runningtime(multi.getParameter("mv_runningtime"));
        movieVO.setMv_limit_age(Integer.parseInt(multi.getParameter("mv_limit_age")));
        movieVO.setMv_location(multi.getParameter("mv_location"));
        movieVO.setMv_summary(multi.getParameter("mv_summary"));
        movieVO.setMv_launch_date(multi.getParameter("mv_launch_date"));
        movieVO.setMv_staff_info(mv_staff_info);


        movieVO.setMv_pic(mv_pic);
        movieVO.setMv_trailer(trailer);

        movieDAO.writeMovie(movieVO);
        request.setAttribute("result","write");
        return "/WEB-INF/views/movie/movieResult.jsp";
    }
}
