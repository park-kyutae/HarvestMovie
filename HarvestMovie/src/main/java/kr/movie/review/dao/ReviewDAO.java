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

    public boolean checkDuplicatedReview(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        boolean isDuplicated = true;

        try {
            conn = DBUtil.getConnection();
            sql = "select review_num from review_info where mv_num=? and mem_num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                isDuplicated = false;
            }


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);
        }

        return isDuplicated;
    }


    //리뷰 작성
    public void writeReview(int mv_num, int mem_num, String review_message) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;

        try {
            conn = DBUtil.getConnection();
            sql = "insert into review_info values (review_info_seq.nextval,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            pstmt.setString(4, review_message);
            pstmt.executeUpdate();


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }


    }

    public void modifyReview(int mv_num, int mem_num, String review_message) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;

        try {
            conn = DBUtil.getConnection();
            sql = "update REVIEW_INFO set REVIEW_MESSAGE=? where MV_NUM=? and MEM_NUM=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, review_message);
            pstmt.setInt(2, mv_num);
            pstmt.setInt(3, mem_num);
            pstmt.executeUpdate();


        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(null, pstmt, conn);
        }


    }

    public void deleteReview(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;

        try {
            conn = DBUtil.getConnection();
            sql = "delete review_info where mv_num =? and mem_num=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
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
            sql = "select r.*, d.MEM_NAME from review_info r join MEMBER_DETAIL d on r.MEM_NUM=d.MEM_NUM where mv_num =? and rownum<=? order by REVIEW_NUM desc";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, count);
            rs = pstmt.executeQuery();
            for (int i = 0; i < count; i++) {
                reviewVO = new ReviewVO();
                int mem_num = 0;
                String mem_name = "";
                String rv_message = "";
                if (rs.next()) {
                    mem_num = rs.getInt("mem_num");
                    mem_name = rs.getString("mem_name");
                    rv_message = rs.getString("review_message");
                }
                reviewVO.setMv_num(mv_num);
//                TODO 리뷰vo에서 유저넘 삭제
                reviewVO.setUser_num(mem_num);
                reviewVO.setMem_name(mem_name);
                reviewVO.setReview_message(rv_message);

                reviewVOList.add(reviewVO);
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);

        }
        return reviewVOList;
    }

    public ReviewVO getUserReview(int mv_num, int mem_num) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        ReviewVO reviewVO = null;

        try {
            conn = DBUtil.getConnection();
            sql = "select r.*, d.MEM_NAME from review_info r join MEMBER_DETAIL d on r.MEM_NUM=d.MEM_NUM where mv_num =? and d.MEM_NUM=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, mv_num);
            pstmt.setInt(2, mem_num);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                reviewVO = new ReviewVO();
                reviewVO.setMv_num(rs.getInt("mv_num"));
                reviewVO.setUser_num(rs.getInt("mem_num"));
                reviewVO.setReview_message(rs.getString("review_message"));
                reviewVO.setMem_name(rs.getString("mem_name"));
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            DBUtil.executeClose(rs, pstmt, conn);

        }
        return reviewVO;
    }
}