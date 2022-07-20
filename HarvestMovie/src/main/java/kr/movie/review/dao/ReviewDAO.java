package kr.movie.review.dao;

import kr.movie.review.vo.ReviewVO;
import kr.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    //싱글턴 패턴
    private static ReviewDAO instance = new ReviewDAO();

    public static ReviewDAO getInstance() {
        return instance;
    }

    private ReviewDAO() {

    }

    //리뷰 작성
    public void writeReview(int mv_num, int mem_num, String mem_id, String review_message) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;

        try {
            conn = DBUtil.getConnection();
            sql = "insert into review_info values (review_info_seq.nextval,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            pstmt.setString(3, mem_id);
            pstmt.setString(4, review_message);
            pstmt.executeUpdate();


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }

    }


    public List<ReviewVO> getReviewList(int mv_num, int count) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        List<ReviewVO> reviewVOList = new ArrayList<>();
        ReviewVO reviewVO = null;

        try {
            conn = DBUtil.getConnection();
            sql = "select * from review_info where mv_num =? and rownum<=? order by REVIEW_NUM desc";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, count);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                reviewVO = new ReviewVO();
                reviewVO.setMv_num(rs.getInt("mv_num"));
                reviewVO.setMem_num(rs.getInt("mem_num"));
                reviewVO.setMem_id(rs.getString("mem_id"));
                reviewVO.setReview_message(rs.getString("review_message"));
                reviewVOList.add(reviewVO);
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);

        }
        return reviewVOList;
    }

    public ReviewVO getUserReview(int mv_num,int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        ReviewVO reviewVO = null;

        try {
            conn = DBUtil.getConnection();
            sql = "select * from review_info where mv_num =? and MEM_NUM=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                reviewVO = new ReviewVO();
                reviewVO.setMv_num(rs.getInt("mv_num"));
                reviewVO.setMem_num(rs.getInt("mem_num"));
                reviewVO.setMem_id(rs.getString("mem_id"));
                reviewVO.setReview_message(rs.getString("review_message"));
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);

        }
        return reviewVO;
    }
}