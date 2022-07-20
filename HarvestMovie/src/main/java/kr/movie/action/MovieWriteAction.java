package kr.movie.action;

import com.oreilly.servlet.MultipartRequest;
import kr.controller.Action;
import kr.movie.dao.MovieDAO;
import kr.movie.vo.MovieVO;
import kr.util.FileUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.*;

public class MovieWriteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        //추후 관리자 인증 추가
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
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
        //str형식 yyyy-mm-dd
        Date mv_launch_date = Date.valueOf(multi.getParameter("mv_launch_date"));

        String mv_main_pic = multi.getFilesystemName("mv_main_pic");
        String mv_poster = multi.getFilesystemName("mv_poster");

        List<String> mv_pic = fileNames;
        mv_pic.remove(mv_main_pic);
        mv_pic.remove(mv_poster);


        HashMap<Integer, List<String>> staffInfo = new HashMap<>();
        staffInfo.put(0, Arrays.asList(multi.getParameter("mv_director")));
        staffInfo.put(1, Arrays.asList(multi.getParameter("mv_actor")));
        staffInfo.put(3, Arrays.asList(multi.getParameter("mv_writer")));

        movieVO.setMv_title(multi.getParameter("mv_title"));
        movieVO.setMv_main_pic(mv_main_pic);
        movieVO.setMv_poster(mv_poster);
        movieVO.setMv_genre(multi.getParameter("mv_genre"));
        movieVO.setMv_runningtime(multi.getParameter("mv_runningtime"));
        movieVO.setMv_limit_age(Integer.parseInt(multi.getParameter("mv_limit_age")));
        movieVO.setMv_location(multi.getParameter("mv_location"));
        movieVO.setMv_summary(multi.getParameter("mv_summary"));
        movieVO.setMv_launch_date(mv_launch_date);
        movieVO.setStaffInfo(staffInfo);


        movieVO.setMv_pic(mv_pic);
        movieVO.setMv_trailer(trailer);

        movieDAO.writeMovie(movieVO);
        //추후 중복 같이 실패에 따라 alert창으로 알려주는 기능 추가
        return "/WEB-INF/views/movie/movieWrite.jsp";
    }
}
