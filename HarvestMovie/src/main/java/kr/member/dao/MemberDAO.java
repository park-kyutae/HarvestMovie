package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	// 싱글턴 패턴
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}

	private MemberDAO() {
	}

	// 회원가입
	public void insertMember(MemberVO member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String sql = null;
		int num = 0; // 시퀀스 번호 저장

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// 오토 커밋 해제
			conn.setAutoCommit(false);

			// 회원번호(mem_num) 생성
			sql = "SELECT member_seq.nextval FROM dual";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}

			// member에 데이터 저장
			sql = "INSERT INTO member (mem_num,id) VALUES (?,?)";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt2 = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt2.setInt(1, num);
			pstmt2.setString(2, member.getId());
			// JDBC 수행 4단계
			pstmt2.executeUpdate();

			// zmember_detail에 데이터 저장
			sql = "INSERT INTO member_detail (mem_num,mem_name,mem_pw,"
					+ "mem_email,mem_zipcode,mem_addr1,mem_addr2) VALUES " + "(?,?,?,?,?,?,?)";
			// JDBC 수행 3단계
			pstmt3 = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt3.setInt(1, num);
			pstmt3.setString(2, member.getName());
			pstmt3.setString(3, member.getPw());
			pstmt3.setString(4, member.getEmail());
			pstmt3.setString(5, member.getZipcode());
			pstmt3.setString(6, member.getAddr1());
			pstmt3.setString(7, member.getAddr2());
			// JDBC 수행 4단계
			pstmt3.executeUpdate();

			// SQL 실행시 모두 성공하면 commit
			conn.commit();
		} catch (Exception e) {
			// SQL문이 하나라도 실패하면 rollback
			conn.rollback();
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(rs, pstmt, conn);
		}

	}

	// 로그인
	public MemberVO checkMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM member m LEFT OUTER JOIN " + "member_detail d ON m.mem_num=d.mem_num "
					+ "WHERE m.id=?";

			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(1, id);

			// JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setMem_num(rs.getInt("mem_num"));
				member.setId(rs.getString("id"));
				member.setAuth(rs.getInt("auth"));
				member.setPw(rs.getString("mem_pw"));
				member.setName(rs.getString("mem_name"));
				member.setEmail(rs.getString("mem_email"));
				member.setZipcode(rs.getString("mem_zipcode"));
				member.setAddr1(rs.getString("mem_addr1"));
				member.setAddr2(rs.getString("mem_addr2"));
				member.setPhoto(rs.getString("mem_photo"));
				member.setReg_date(rs.getDate("mem_reg_date"));
				member.setModify_date(rs.getDate("mem_modify_date"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return member;
	}

	// 마이페이지 - 내정보 확인
	public MemberVO getMember(int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM member m JOIN member_detail d " + "ON m.mem_num=d.mem_num WHERE m.mem_num=?";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, mem_num);

			// JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setMem_num(rs.getInt("mem_num"));
				member.setId(rs.getString("id"));
				member.setAuth(rs.getInt("auth"));
				member.setPw(rs.getString("mem_pw"));
				member.setName(rs.getString("mem_name"));
				member.setEmail(rs.getString("mem_email"));
				member.setZipcode(rs.getString("mem_zipcode"));
				member.setAddr1(rs.getString("mem_addr1"));
				member.setAddr2(rs.getString("mem_addr2"));
				member.setPhoto(rs.getString("mem_photo"));
				member.setReg_date(rs.getDate("mem_reg_date"));
				member.setModify_date(rs.getDate("mem_modify_date"));
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return member;
	}

	// 마이페이지 - 내정보 수정
	public void updateMember(MemberVO member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE member_detail SET mem_name=?," + "mem_email=?,mem_zipcode=?,mem_addr1=?,"
					+ "mem_addr2=?,mem_modify_date=SYSDATE " + "WHERE mem_num=?";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getEmail());
			pstmt.setString(3, member.getZipcode());
			pstmt.setString(4, member.getAddr1());
			pstmt.setString(5, member.getAddr2());
			pstmt.setInt(6, member.getMem_num());

			// JDBC 수행 4단계
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}

	}

	// 비밀번호 수정
	public void updatePassword(String passwd, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE member_detail SET mem_pw=? " + "WHERE mem_num=?";

			// JDBC 수행 3단계
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(1, passwd);
			pstmt.setInt(2, mem_num);

			// JDBC 수행 4단계
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 프로필 사진 수정
	public void updateMyPhoto(String photo, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE member_detail SET mem_photo=? WHERE mem_num=?";

			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터를 바인딩
			pstmt.setString(1, photo);
			pstmt.setInt(2, mem_num);

			// JDBC 수행 4단계
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 회원탈퇴(회원정보 삭제)
	public void deleteMember(int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// auto commit 해제
			conn.setAutoCommit(false);

			// member의 auth 값 변경
			sql = "UPDATE member SET auth=0 WHERE mem_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			pstmt.executeUpdate();
			// member_detail의 레코드 삭제
			sql = "DELETE FROM member_detail WHERE mem_num=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, mem_num);
			pstmt2.executeUpdate();

			// 모든 SQL문의 실행이 성공하면 커밋
			conn.commit();
		} catch (Exception e) {
			// SQL문이 하나라도 실패하면 롤백
			conn.rollback();
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	//관리자
	// 전체글 개수(검색글 개수)
	public int getMemberCountByAdmin(String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				// 검색 처리
				if (keyfield.equals("1"))
					sub_sql = "WHERE id LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE name LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE email LIKE ?";
			}

			sql = "SELECT COUNT(*) FROM member LEFT OUTER JOIN " + "member_detail USING (mem_num) " + sub_sql;

			pstmt = conn.prepareStatement(sql);
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(1, "%" + keyword + "%");
			}

			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}

	// 목록(검색글 목록)
	public List<MemberVO> getListMemberByAdmin(int start, int end, String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberVO> list = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				// 검색 처리
				if (keyfield.equals("1"))
					sub_sql = "WHERE id LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE name LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE email LIKE ?";
			}

			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM " + "(SELECT * FROM member m LEFT OUTER JOIN "
					+ "member_detail d USING (mem_num) " + sub_sql + " ORDER BY mem_num DESC NULLS LAST)a) "
					+ "WHERE rnum >= ? AND rnum <= ?";

			pstmt = conn.prepareStatement(sql);
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, "%" + keyword + "%");
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);

			rs = pstmt.executeQuery();

			list = new ArrayList<MemberVO>();
			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setMem_num(rs.getInt("mem_num"));
				member.setId(rs.getString("id"));
				member.setAuth(rs.getInt("auth"));
				member.setPw(rs.getString("mem_pw"));
				member.setName(rs.getString("mem_name"));
				member.setEmail(rs.getString("mem_email"));
				member.setZipcode(rs.getString("mem_zipcode"));
				member.setAddr1(rs.getString("mem_addr1"));
				member.setAddr2(rs.getString("mem_addr2"));
				member.setPhoto(rs.getString("mem_photo"));
				member.setReg_date(rs.getDate("mem_reg_date"));
				member.setModify_date(rs.getDate("mem_modify_date"));

				list.add(member);
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}

	// 회원정보(등급) 수정
	public void updateMemberByAdmin(int auth, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// sql문 작성
			sql = "UPDATE member SET auth=? WHERE mem_num=?";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, auth);
			pstmt.setInt(2, mem_num);

			// JDBC 수행 4단계
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}

	}

}
