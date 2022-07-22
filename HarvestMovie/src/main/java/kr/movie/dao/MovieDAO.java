package kr.movie.dao;

import kr.movie.vo.MovieVO;
import kr.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class MovieDAO {

    public static final int DIRECTOR = 0;
    public static final int ACTOR = 1;
    public static final int  WRITER = 2;

    //싱글턴 패턴
    private static MovieDAO instance = new MovieDAO();

    public static MovieDAO getInstance() {
        return instance;
    }

    private MovieDAO() {

    }

    //영화 정보 가져오기
//    public MovieVO getMovie(int mv_num) throws Exception {
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        MovieVO movieVO = null;
//        String sql = null;
//
//        try {
//            conn = DBUtil.getConnection();
//            sql = "select * from movie_info where MV_NUM = ? ";
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setInt(1, mv_num);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                movieVO = new MovieVO();
//                movieVO.setMv_num(rs.getInt("mv_num"));
//                movieVO.setMv_title(rs.getString("mv_title"));
//                movieVO.setMv_main_pic(rs.getString("mv_main_pic"));
//                movieVO.setMv_poster(rs.getString("mv_poster"));
//                movieVO.setMv_launch_date(rs.getDate("mv_launch_date"));
//                movieVO.setMv_location(rs.getString("mv_location"));
//
//            }
//
//
//        } catch (Exception e) {
//            throw new Exception(e);
//        } finally {
//            DBUtil.executeClose(rs, pstmt, conn);
//        }
//
//        return movieVO;
//    }

    public MovieVO getMovieDetail(int mv_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        PreparedStatement pstmt4 = null;
        ResultSet rs = null;
        MovieVO movieVO = null;
        String sql = null;


        try {
            conn = DBUtil.getConnection();
            sql = "select * " +
                    "from movie_info info " +
                    "         join movie_detail detail on info.MV_NUM = detail.MV_NUM " +
                    "         left join (select MV_NUM, avg(MV_RATING) avg_rating from MOVIE_RATINGS group by MV_NUM) a " +
                    "              on info.MV_NUM = a.MV_NUM " +
                    "where info.MV_NUM = ?";
            pstmt1 = conn.prepareStatement(sql);
            pstmt1.setInt(1, mv_num);
            rs = pstmt1.executeQuery();
            if (rs.next()) {
                movieVO = new MovieVO();

                movieVO.setMv_num(rs.getInt("mv_num"));
                movieVO.setMv_title(rs.getString("mv_title"));
                movieVO.setMv_main_pic(rs.getString("mv_main_pic"));
                movieVO.setMv_poster(rs.getString("mv_poster"));
                movieVO.setMv_genre(rs.getString("mv_genre"));
                movieVO.setMv_location(rs.getString("mv_location"));
                movieVO.setMv_launch_date(rs.getDate("mv_launch_date"));
                movieVO.setMv_runningtime(rs.getString("mv_runningtime"));
                movieVO.setMv_limit_age(rs.getInt("mv_limit_age"));
                movieVO.setMv_summary(rs.getString("mv_summary"));
                movieVO.setAvg_rating(rs.getFloat("avg_rating"));
            }
            sql = "select * from movie_pic where mv_num =?";
            pstmt2 = conn.prepareStatement(sql);
            pstmt2.setInt(1, mv_num);
            rs = pstmt2.executeQuery();

            List<String> mv_pic = new ArrayList<>();
            while (rs.next()) {
                mv_pic.add(rs.getString("mv_pic"));
            }
            movieVO.setMv_pic(mv_pic);

            sql = "select * from movie_trailer where mv_num =?";
            pstmt3 = conn.prepareStatement(sql);
            pstmt3.setInt(1, mv_num);
            rs = pstmt3.executeQuery();
            List<String> mv_trailer = new ArrayList<>();
            while (rs.next()) {
                mv_trailer.add(rs.getString("mv_trailer"));
            }
            movieVO.setMv_trailer(mv_trailer);

            sql = "select MV_STAFF_JOB,MV_STAFF_NAME from MOVIE_STAFF_LIST where MV_NUM=?";
            pstmt4 = conn.prepareStatement(sql);
            pstmt4.setInt(1, mv_num);
            rs = pstmt4.executeQuery();
            HashMap<String, List<String>> mv_staff_info = new HashMap<>();
            List<String> director = new ArrayList<>();
            List<String> actor = new ArrayList<>();
            List<String> writer = new ArrayList<>();


            while (rs.next()) {
                int staffJob = rs.getInt("mv_staff_job");
                String staffName = rs.getString("mv_staff_name");
                if (staffJob == DIRECTOR) {
                    director.add(staffName);
                } else if (staffJob == ACTOR) {
                    actor.add(staffName);
                }
                if (staffJob == WRITER) {
                    writer.add(staffName);
                }
            }
            mv_staff_info.put("감독", director);
            mv_staff_info.put("배우", actor);
            mv_staff_info.put("각본", writer);

            movieVO.setMv_staff_info(mv_staff_info);

        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt4, null);
            DBUtil.executeClose(null, pstmt3, null);
            DBUtil.executeClose(null, pstmt2, null);
            DBUtil.executeClose(rs, pstmt1, conn);
        }

        return movieVO;
    }
    //메인페이지


    //메인페이지 랭킹 구하기
    public List<MovieVO> getRanking() {

        return null;
    }

    public float getRating(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        float mv_rating = 0;
        try {
            conn = DBUtil.getConnection();
            sql = "select MV_RATING from MOVIE_RATINGS where MV_NUM=?and MEM_NUM=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                mv_rating = rs.getFloat(1);
            }

        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return mv_rating;
    }

    public boolean setRating(int mv_num, int mem_num, float rating) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean isSuccess = false;

        try {
            conn = DBUtil.getConnection();
            sql = "MERGE INTO MOVIE_RATINGS s " +
                    "USING DUAL" +
                    "   ON (s.MV_NUM = ? and s.MEM_NUM=?)" +
                    "WHEN MATCHED THEN" +
                    "    UPDATE SET s.MV_RATING = ?" +
                    "WHEN NOT MATCHED THEN" +
                    "    INSERT (mv_rating_num, mv_num, mem_num, mv_rating)" +
                    "    VALUES (MOVIE_RATINGS_SEQ.nextval,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            pstmt.setFloat(3, rating);
            pstmt.setFloat(4, mv_num);
            pstmt.setFloat(5, mem_num);
            pstmt.setFloat(6, rating);
            pstmt.executeUpdate();


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }

        return isSuccess;
    }

    //보고싶어요
    public boolean setWillWatch(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        boolean isSuccess = false;

        try {
            conn = DBUtil.getConnection();

            sql = "MERGE INTO MOVIE_WILL_WATCH s " +
                    "USING DUAL" +
                    "   ON (s.MV_NUM = ? and s.MEM_NUM=?)" +
                    "WHEN MATCHED THEN" +
                    "    update set s.mv_will_delete = 1" +
                    "    delete where (s.mv_num=? and s.mem_num=?)" +
                    "WHEN NOT MATCHED THEN" +
                    "    INSERT (mv_will_watch_num, mv_num, mem_num)" +
                    "    VALUES (MOVIE_RATINGS_SEQ.nextval,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            pstmt.setInt(3, mv_num);
            pstmt.setInt(4, mem_num);
            pstmt.setInt(5, mv_num);
            pstmt.setInt(6, mem_num);
            pstmt.executeUpdate();


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }

        return isSuccess;
    }

    //보고 싶어요 구하기
    public int getWillWatch(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        int mv_will_watch_num = 0;
        try {
            conn = DBUtil.getConnection();
            sql = "select MV_WILL_WATCH_NUM from MOVIE_WILL_WATCH where MV_NUM=?and MEM_NUM=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                mv_will_watch_num = rs.getInt(1);
            }

        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return mv_will_watch_num;
    }

    //장르별
    public List<MovieVO> getGenreTheme() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        List<MovieVO> movieVOList = new ArrayList<>();
        MovieVO movieVO = null;
        try {
            conn = DBUtil.getConnection();
            sql = "select * " +
                    "from MOVIE_INFO s " +
                    "         join (select i.MV_NUM, avg(MV_RATING) avg_rating " +
                    "               from MOVIE_INFO i " +
                    "                        left join MOVIE_RATINGS r on i.MV_NUM = r.MV_NUM " +
                    "               group by i.MV_NUM) e on s.MV_NUM = e.MV_NUM " +
                    "         join (select MV_NUM,MV_GENRE from MOVIE_DETAIL) a on s.MV_NUM = a.MV_NUM " +
                    "where rownum <=10 and MV_GENRE =?";
            pstmt = conn.prepareStatement(sql);
            //추후 장르 선택 추가
            pstmt.setString(1, "west");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                movieVO = new MovieVO();
                movieVO.setMv_num(rs.getInt("mv_num"));
                movieVO.setMv_title(rs.getString("mv_title"));
                movieVO.setMv_main_pic(rs.getString("mv_main_pic"));
                movieVO.setMv_poster(rs.getString("mv_poster"));
                movieVO.setMv_launch_date(rs.getDate("mv_launch_date"));
                movieVO.setMv_location(rs.getString("mv_location"));
                movieVO.setAvg_rating(rs.getFloat("avg_rating"));
                movieVOList.add(movieVO);
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return movieVOList;


    }

    public List<MovieVO> getRatingTheme() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = null;
        List<MovieVO> ratingVO = new ArrayList<>();
        MovieVO movieVO = null;
        try {
            conn = DBUtil.getConnection();
            sql = "select * from MOVIE_INFO s " +
                    "left join (select i.MV_NUM,avg(MV_RATING) avg_rating from MOVIE_INFO i " +
                    "join MOVIE_RATINGS r on i.MV_NUM=r.MV_NUM " +
                    "group by i.MV_NUM) e " +
                    "on s.MV_NUM = e.MV_NUM where rownum <=10 ";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                movieVO = new MovieVO();
                movieVO.setMv_num(rs.getInt("mv_num"));
                movieVO.setMv_title(rs.getString("mv_title"));
                movieVO.setMv_main_pic(rs.getString("mv_main_pic"));
                movieVO.setMv_poster(rs.getString("mv_poster"));
                movieVO.setMv_launch_date(rs.getDate("mv_launch_date"));
                movieVO.setMv_location(rs.getString("mv_location"));
                movieVO.setAvg_rating(rs.getFloat("avg_rating"));
                ratingVO.add(movieVO);
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return ratingVO;


    }


    //관리자 영화 작성
    public void writeMovie(MovieVO movieVO) throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
        PreparedStatement pstmt3 = null;
        PreparedStatement pstmt4 = null;
        PreparedStatement pstmt5 = null;
        PreparedStatement pstmt6 = null;
        String sql = null;
        int movieNUM = 0;


        try {
            conn = DBUtil.getConnection();
            conn.setAutoCommit(false);


            sql = "select MOVIE_SEQ.nextval from dual";
            pstmt1 = conn.prepareStatement(sql);
            rs = pstmt1.executeQuery();

            if (rs.next()) {
                movieNUM = rs.getInt(1);
            }


            sql = "INSERT into MOVIE_INFO values (?,?,?,?,?,?)";
            pstmt2 = conn.prepareStatement(sql);
            pstmt2.setInt(1, movieNUM);
            pstmt2.setString(2, movieVO.getMv_title());
            pstmt2.setString(3, movieVO.getMv_main_pic());
            pstmt2.setString(4, movieVO.getMv_poster());
            pstmt2.setDate(5, movieVO.getMv_launch_date());
            pstmt2.setString(6, movieVO.getMv_location());

            pstmt2.executeUpdate();

            sql = "INSERT  into MOVIE_DETAIL values (?,?,?,?,?)";
            pstmt3 = conn.prepareStatement(sql);
            pstmt3.setInt(1, movieNUM);
            pstmt3.setString(2, movieVO.getMv_genre());
            pstmt3.setString(3, movieVO.getMv_runningtime());
            pstmt3.setInt(4, movieVO.getMv_limit_age());
            pstmt3.setString(5, movieVO.getMv_summary());
            pstmt3.executeUpdate();


            sql = "INSERT Into MOVIE_PIC values (MOVIE_PIC_SEQ.nextval,?,?)";
            pstmt4 = conn.prepareStatement(sql);
            for (String pic : movieVO.getMv_pic()) {
                pstmt4.setInt(1, movieNUM);
                pstmt4.setString(2, pic);
                pstmt4.addBatch();
                pstmt4.clearParameters();
            }
            pstmt4.executeBatch();
            pstmt4.clearParameters();


            sql = "INSERT Into MOVIE_TRAILER values (MOVIE_TRAILER_SEQ.nextval,?,?)";
            pstmt5 = conn.prepareStatement(sql);
            for (String trailer : movieVO.getMv_trailer()) {
                pstmt5.setInt(1, movieNUM);
                pstmt5.setString(2, trailer);
                pstmt5.addBatch();
                pstmt5.clearParameters();
            }
            pstmt5.executeBatch();
            pstmt5.clearParameters();


            sql = "insert into  MOVIE_STAFF_LIST values (movie_staff_seq.nextval,?,?,?)";
            pstmt6 = conn.prepareStatement(sql);
            for (String keys : movieVO.getMv_staff_info().keySet()) {
                List<String> staffList = movieVO.getMv_staff_info().get(keys);
                for (String staffName : staffList) {
                    pstmt6.setInt(1, movieNUM);
                    pstmt6.setString(2, staffName);
                    if (keys.equals("감독")) {
                        pstmt6.setInt(3, DIRECTOR);
                    } else if (keys.equals("배우")) {
                        pstmt6.setInt(3, ACTOR);
                    } else {
                        pstmt6.setInt(3,WRITER);
                    }
                    pstmt6.addBatch();
                    pstmt6.clearParameters();

                }
            }
            pstmt6.executeBatch();
            pstmt6.clearParameters();

            conn.commit();

        } catch (Exception e) {
            conn.rollback();
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt6, null);
            DBUtil.executeClose(null, pstmt5, null);
            DBUtil.executeClose(null, pstmt4, null);
            DBUtil.executeClose(null, pstmt3, null);
            DBUtil.executeClose(null, pstmt2, null);
            DBUtil.executeClose(rs, pstmt1, conn);
        }

    }

    public void setMainMovie(int mv_num, int mv_main_list_num) throws Exception{

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;

        try {
            if (mv_main_list_num <= 0 && mv_main_list_num > 4) {
                throw new Exception();
//                TODO 사용자 예외 만들기
            }
            conn = DBUtil.getConnection();
            sql = "MERGE INTO movie_main_list s " +
                    "USING DUAL" +
                    " ON (s.mv_main_list_num=?)" +
                    "WHEN MATCHED THEN" +
                    "    UPDATE SET s.mv_num = ?" +
                    "WHEN NOT MATCHED THEN" +
                    "    INSERT (mv_main_list_num, mv_num)" +
                    "    VALUES (?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,mv_main_list_num);
            pstmt.setInt(2,mv_num);
            pstmt.setInt(3,mv_main_list_num);
            pstmt.setInt(4,mv_num);
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }

    }

    public List<MovieVO> getMainMovie() throws Exception {

        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        String sql = null;
        List<MovieVO> movieVOList = new ArrayList<>();
        MovieVO movieVO = null;
        try {
            conn = DBUtil.getConnection();


            sql = "select * from MOVIE_INFO join MOVIE_DETAIL on  MOVIE_INFO.MV_NUM = MOVIE_DETAIL.MV_NUM join MOVIE_MAIN_LIST MML on MOVIE_DETAIL.MV_NUM = MML.MV_NUM";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                movieVO = new MovieVO();
                movieVO.setMv_main_pic(rs.getString("mv_main_pic"));
                movieVOList.add(movieVO);

            }

        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }
        return movieVOList;
    }

}
