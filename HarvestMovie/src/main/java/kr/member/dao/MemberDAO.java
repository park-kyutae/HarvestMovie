package kr.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.member.vo.MemberVO;
import kr.util.DBUtil;

public class MemberDAO {
	//싱글턴 패턴
		private static MemberDAO instance = new MemberDAO();
		
		public static MemberDAO getInstance() {
			return instance;
		}
		
		private MemberDAO() {}
		
		//회원가입
		public void insertMember(MemberVO member) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			ResultSet rs = null;
			String sql = null;
			int num = 0; //시퀀스 번호 저장
			
			try {
				//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//오토 커밋 해제
				conn.setAutoCommit(false);
				
				//회원번호(mem_num) 생성
				sql = "SELECT member_seq.nextval FROM dual";
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//JDBC 수행 4단계
				rs = pstmt.executeQuery();
				if(rs.next()) {
					num = rs.getInt(1);
				}
				
				//member에 데이터 저장
				sql = "INSERT INTO member (mem_num,id) VALUES (?,?)";
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt2 = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt2.setInt(1, num);
				pstmt2.setString(2, member.getId());
				//JDBC 수행 4단계
				pstmt2.executeUpdate();
				
				//zmember_detail에 데이터 저장
				sql = "INSERT INTO member_detail (mem_num,mem_name,mem_pw,"
					+ "mem_email,mem_zipcode,mem_addr1,mem_addr2,mem_photo) VALUES "
					+ "(?,?,?,?,?,?,?,?)";
				//JDBC 수행 3단계
				pstmt3 = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt3.setInt(1, num);
				pstmt3.setString(2, member.getName());
				pstmt3.setString(3, member.getPw());
				pstmt3.setString(4, member.getEmail());
				pstmt3.setString(5, member.getZipcode());
				pstmt3.setString(6, member.getAddr1());
				pstmt3.setString(7, member.getAddr2());
				pstmt3.setString(8, member.getPhoto());
				//JDBC 수행 4단계
				pstmt3.executeUpdate();
				
				//SQL 실행시 모두 성공하면 commit
				conn.commit();
			}catch(Exception e) {
				//SQL문이 하나라도 실패하면 rollback
				conn.rollback();
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt3, null);
				DBUtil.executeClose(null, pstmt2, null);
				DBUtil.executeClose(rs, pstmt, conn);
			}
			
		}
		//로그인
		//마이페이지 - 내정보 확인
		//마이페이지 - 내정보 수정
		//마이페이지 - 내정보 삭제
		//마이페이지 - 등급 신청

}
