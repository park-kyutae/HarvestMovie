package kr.event.dao;

import java.sql.Connection;    
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.event.vo.EventFavVO;
import kr.event.vo.EventVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

public class EventDAO {
	//싱글턴 패턴
	private static EventDAO instance = new EventDAO();
	
	public static EventDAO getInstance() {
		return instance;
	}
	private EventDAO() {}
	
	//글등록
	public void insertEvent(EventVO event)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "INSERT INTO event (event_board_num,event_title,"
				+ "event_content,event_filename,event_ip,mem_num) VALUES ("
				+ "event_seq.nextval,?,?,?,?,?)";
			//JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(1, event.getEvent_title());
			pstmt.setString(2, event.getEvent_content());
			pstmt.setString(3, event.getEvent_filename());
			pstmt.setString(4, event.getEvent_ip());
			pstmt.setInt(5, event.getMem_num());
			
			//JDBC 수행 4단계 : SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e){
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//총 레코드 수(검색 레코드 수)
	public int getEventCount(String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;

		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				if (keyfield.equals("1"))
					sub_sql = "WHERE b.event_title LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE m.id LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE b.event_content LIKE ?";
			}

			sql = "SELECT COUNT(*) FROM event b JOIN member m USING(mem_num) " + sub_sql;

			//JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(1, "%" + keyword + "%");
			}

			//JDBC 수행 4단계
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}

	//글목록(검색글 목록)
	public List<EventVO> getListEvent(int start, int end, String keyfield, 
										String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<EventVO> list = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				if (keyfield.equals("1"))
					sub_sql = "WHERE b.event_title LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE m.event_id LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE b.event_content LIKE ?";
			}

			sql = "SELECT * FROM (SELECT a.*, rownum rnum " + "FROM (SELECT * FROM event b JOIN member m "
					+ "USING (mem_num) JOIN member_detail d " + "USING (mem_num) " + sub_sql
					+ " ORDER BY b.event_board_num DESC)a) " + "WHERE rnum >= ? AND rnum <= ?";

			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, "%" + keyword + "%");
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);

			// JDBC 수행 4단계
			rs = pstmt.executeQuery();
			list = new ArrayList<EventVO>();
			while (rs.next()) {
				EventVO event= new EventVO();
				event.setEvent_board_num(rs.getInt("event_board_num"));
				event.setEvent_title(StringUtil.useNoHtml(rs.getString("event_title")));
				event.setEvent_hit(rs.getInt("event_hit"));
				event.setEvent_reg_date(rs.getDate("event_reg_date"));
				event.setEvent_modify_date(rs.getDate("event_modify_date"));
				event.setEvent_filename(rs.getString("event_filename"));
				event.setMem_num(rs.getInt("mem_num"));
				event.setId(rs.getString("id")); 
				 

				list.add(event);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	//글상세
	public EventVO getEvent(int event_board_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventVO event= null;
		String sql = null;
		
		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM event b JOIN member m "
				+ "USING(mem_num) JOIN member_detail d "
				+ "USING(mem_num) WHERE b.event_board_num=?";
			
			//JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_board_num);
			//JDBC 수행 4단계
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				event = new EventVO();
				event.setEvent_board_num(rs.getInt("event_board_num"));
				event.setEvent_title(rs.getString("event_title"));
				event.setEvent_content(rs.getString("event_content"));
				event.setEvent_hit(rs.getInt("event_hit"));
				event.setEvent_reg_date(rs.getDate("event_reg_date"));
				event.setEvent_modify_date(rs.getDate("event_modify_date"));
				event.setEvent_filename(rs.getString("event_filename"));
				event.setMem_num(rs.getInt("mem_num"));
				event.setId(rs.getString("id"));
				event.setPhoto(rs.getString("mem_photo"));
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return event;
		
	}
	//조회수 증가
	public void updateReadcount(int event_board_num)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성 
			sql = "UPDATE event SET event_hit=event_hit+1 WHERE event_board_num=?";

			//JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_board_num);
			//JDBC 수행 4단계
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	//파일 삭제
	public void deleteFile(int event_board_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		String sql = null;
		
		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성 
			sql = "UPDATE event SET event_filename='' WHERE event_board_num=?";
			
			//JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_board_num);
			//JDBC 수행 4단계
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//글수정
	public void updateEvent(EventVO event)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt=null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;
		
		try {
			//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			
			if(event.getEvent_filename()!=null) {
				//업로드한 파일이 있는 경우
				sub_sql = ",event_filename=?";
			}
			
			sql = "UPDATE event SET event_title=?,event_content=?,event_modify_date=SYSDATE"+sub_sql
					+",event_ip=? WHERE event_board_num=?";
			
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setString(++cnt, event.getEvent_title());
			pstmt.setString(++cnt, event.getEvent_content());
			if(event.getEvent_filename()!=null) {
				pstmt.setString(++cnt, event.getEvent_filename());
			}
			pstmt.setString(++cnt, event.getEvent_ip());
			pstmt.setInt(++cnt, event.getEvent_board_num());
			
			//JDBC 수행 4단계
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	
	//글삭제
	public void deleteEvent(int event_board_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//오토커밋 해제
			conn.setAutoCommit(false);
			
			//좋아요 삭제
			sql = "DELETE FROM event_fav WHERE event_board_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, event_board_num);
			pstmt.executeUpdate();
			//댓글 삭제
			
			//부모글 삭제
			sql = "DELETE FROM event WHERE event_board_num=?";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, event_board_num);
			pstmt3.executeUpdate();
			
			//예외 발생이 없어 정상적으로 SQL문 실행
			conn.commit();
			
		}catch(Exception e) {
			//예외 발생
			conn.rollback();
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//좋아요 등록
	public void insertFav(int event_board_num, int mem_num)throws Exception{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "INSERT INTO event_fav (event_fav_num, event_board_num, mem_num) "
					+ "VALUES (eventfav_seq.nextval,?,?)";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_board_num);
			pstmt.setInt(2, mem_num);
			//SQL문 실행
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//좋아요 개수
	public int selectFavCount(int event_board_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT COUNT (*) FROM event_fav WHERE event_board_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_board_num);
			//SQL문 실행
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리 
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//회원번호와 게시물 번호를 이용한 좋아요 정보
	public EventFavVO selectFav(int event_board_num, int mem_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		EventFavVO fav = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT * FROM event_fav WHERE event_board_num=? AND mem_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터를 바인딩
			pstmt.setInt(1, event_board_num);
			pstmt.setInt(2, mem_num);
			//SQL문 실행
			rs=pstmt.executeQuery();
			if(rs.next()) {
				fav=new EventFavVO();
				fav.setEvent_fav_num(rs.getInt("event_fav_num"));
				fav.setEvent_board_num(rs.getInt("event_board_num"));
				fav.setMem_num(rs.getInt("mem_num"));
				
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
		return fav;
	}
	//좋아요 삭제
	public void deleteFav(int event_fav_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "DELETE FROM event_fav WHERE event_fav_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, event_fav_num);
			//SQL문 실행
			pstmt.executeUpdate();
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			//자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//내가 선택한 좋아요 목록
	
	//댓글 등록
	//댓글 개수
	//댓글 목록
	//댓글 상세
	//댓글 수정
	//댓글 삭제
	
}





