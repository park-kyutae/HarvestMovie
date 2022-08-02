package kr.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.news.vo.NewsFavVO;
import kr.news.vo.NewsReplyVO;
import kr.news.vo.NewsVO;
import kr.util.DBUtil;
import kr.util.DurationFromNow;
import kr.util.StringUtil;

public class NewsDAO {
	// 싱글턴 패턴
	private static NewsDAO instance = new NewsDAO();

	public static NewsDAO getInstance() {
		return instance;
	}

	private NewsDAO() {
	}

	// 글등록
	public void insertNews(NewsVO news) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "INSERT INTO news (news_num,news_title," + "news_content,news_photo,mem_num) VALUES ("
					+ "news_seq.nextval,?,?,?,?)";
			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(1, news.getNews_title());
			pstmt.setString(2, news.getNews_content());
			pstmt.setString(3, news.getNews_photo());
			pstmt.setInt(4, news.getMem_num());

			// JDBC 수행 4단계 : SQL문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 총 레코드 수(검색 레코드 수)
	public int getNewsCount(String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sub_sql = "";
		int count = 0;

		try {
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				if (keyfield.equals("1"))
					sub_sql = "WHERE n.news_title LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE m.id LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE n.news_content LIKE ?";
			}

			sql = "SELECT COUNT(*) FROM news n JOIN member m USING(mem_num) " + sub_sql;

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
			DBUtil.executeClose(rs, pstmt, conn);
		}

		return count;
	}

	// 글목록(검색글 목록)
	public List<NewsVO> getListNews(int start, int end, String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NewsVO> list = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;

		try {
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				if (keyfield.equals("1"))
					sub_sql = "WHERE n.news_title LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE m.id LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE n.news_content LIKE ?";
			}

			sql = "SELECT * FROM (SELECT a.*, rownum rnum " + "FROM (SELECT * FROM news n JOIN member m "
					+ "USING (mem_num) JOIN member_detail d " + "USING (mem_num) " + sub_sql
					+ " ORDER BY n.news_num DESC)a) " + "WHERE rnum >= ? AND rnum <= ?";

			pstmt = conn.prepareStatement(sql);

			// ?에 데이터 바인딩
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, "%" + keyword + "%");
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);

			rs = pstmt.executeQuery();
			list = new ArrayList<NewsVO>();
			while (rs.next()) {
				NewsVO news = new NewsVO();
				news.setNews_num(rs.getInt("news_num"));
				news.setNews_title(StringUtil.useNoHtml(rs.getString("news_title")));
				news.setNews_content(rs.getString("news_content"));
				news.setNews_photo(rs.getString("news_photo"));
				news.setNews_date(rs.getDate("news_date"));
				news.setNews_modifydate(rs.getDate("news_modifydate"));
				news.setNews_hit(rs.getInt("news_hit"));
				news.setMem_num(rs.getInt("mem_num"));

				list.add(news);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	// 글상세 많이본(조회순 목록)
	public List<NewsVO> getListNewsView(int start, int end, String keyfield, String keyword) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<NewsVO> viewlist = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;

		try {
			conn = DBUtil.getConnection();

			if (keyword != null && !"".equals(keyword)) {
				if (keyfield.equals("1"))
					sub_sql = "WHERE n.news_title LIKE ?";
				else if (keyfield.equals("2"))
					sub_sql = "WHERE m.id LIKE ?";
				else if (keyfield.equals("3"))
					sub_sql = "WHERE n.news_content LIKE ?";
			}

			sql = "SELECT * FROM (SELECT a.*, rownum rnum " + "FROM (SELECT * FROM news n JOIN member m "
					+ "USING (mem_num) JOIN member_detail d " + "USING (mem_num) " + sub_sql
					+ " ORDER BY n.news_hit DESC)a) " + "WHERE rnum >= ? AND rnum <= ?";

			pstmt = conn.prepareStatement(sql);

			// ?에 데이터 바인딩
			if (keyword != null && !"".equals(keyword)) {
				pstmt.setString(++cnt, "%" + keyword + "%");
			}
			pstmt.setInt(++cnt, start);
			pstmt.setInt(++cnt, end);

			rs = pstmt.executeQuery();
			viewlist = new ArrayList<NewsVO>();
			while (rs.next()) {
				NewsVO news = new NewsVO();
				news.setNews_num(rs.getInt("news_num"));
				news.setNews_title(StringUtil.useNoHtml(rs.getString("news_title")));
				news.setNews_content(rs.getString("news_content"));
				news.setNews_photo(rs.getString("news_photo"));
				news.setNews_date(rs.getDate("news_date"));
				news.setNews_modifydate(rs.getDate("news_modifydate"));
				news.setNews_hit(rs.getInt("news_hit"));
				news.setMem_num(rs.getInt("mem_num"));

				viewlist.add(news);
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return viewlist;
	}
	// 글상세
	public NewsVO getNews(int news_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsVO news = null;
		String sql = null;

		try {
			// JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM news n JOIN member m " + "USING(mem_num) JOIN member_detail d "
					+ "USING(mem_num) WHERE n.news_num=?";

			// JDBC 수행 3단계 : PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, news_num);
			// JDBC 수행 4단계
			rs = pstmt.executeQuery();

			if (rs.next()) {
				news = new NewsVO();
				news.setNews_num(rs.getInt("news_num"));
				news.setNews_title(rs.getString("news_title"));
				news.setNews_content(rs.getString("news_content"));
				news.setNews_hit(rs.getInt("news_hit"));
				news.setNews_date(rs.getDate("news_date"));
				news.setNews_modifydate(rs.getDate("news_modifydate"));
				news.setNews_photo(rs.getString("news_photo"));
				news.setMem_num(rs.getInt("mem_num"));
				news.setId(rs.getString("id"));
				news.setMem_photo(rs.getString("mem_photo"));
			}

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return news;

	}

	// 조회수 증가
	public void updateNewsReadcount(int news_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			conn = DBUtil.getConnection();

			sql = "UPDATE news SET news_hit = news_hit+1 WHERE news_num=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, news_num);

			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 뉴스 사진 삭제
	public void newsDeleteFile(int news_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "UPDATE news SET news_photo='' WHERE news_num=?";

			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, news_num);

			// SQL문 실행
			pstmt.executeUpdate();

		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 글수정
	public void updateNews(NewsVO news) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String sub_sql = "";
		int cnt = 0;

		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();

			if (news.getNews_photo() != null) {
				// 업로드한 파일이 있는 경우
				sub_sql = ",news_photo=?";
			}

			sql = "UPDATE news SET news_title=?,news_content=?," + "news_modifydate=SYSDATE" + sub_sql
					+ " WHERE news_num=?";

			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setString(++cnt, news.getNews_title());
			pstmt.setString(++cnt, news.getNews_content());
			if (news.getNews_photo() != null) {
				pstmt.setString(++cnt, news.getNews_photo());
			}
			pstmt.setInt(++cnt, news.getNews_num());

			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}

	}

	// 글삭제
	public void newsDelete(int news_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// 오토커밋 해제
			conn.setAutoCommit(false);

			// 좋아요 삭제
			sql = "DELETE FROM news_fav WHERE news_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, news_num);
			pstmt.executeUpdate();
			// 댓글 삭제
			sql = "DELETE FROM news_reply WHERE news_num=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, news_num);
			pstmt2.executeUpdate();
			// 부모글 삭제
			sql = "DELETE FROM news WHERE news_num=?";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, news_num);
			pstmt3.executeUpdate();

			// 예외 발생이 없이 정상적으로 SQL문 실행
			conn.commit();
		} catch (Exception e) {
			// 예외 발생
			conn.rollback();
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 좋아요 등록
	public void newsInsertFav(int news_num, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "INSERT INTO news_fav (news_fav_num,news_num,mem_num) VALUES (newsfav_seq.nextval,?,?)";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, news_num);
			pstmt.setInt(2, mem_num);
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}

	// 좋아요 개수
	public int newsSelectFavCount(int news_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			//커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			//SQL문 작성
			sql = "SELECT COUNT(*) FROM news_fav WHERE news_num=?";
			//PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			//?에 데이터 바인딩
			pstmt.setInt(1, news_num);
			//SQL문 실행
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

	// 회원번호와 게시물 번호를 이용한 좋아요 정보
	public NewsFavVO newsSelectFav(int news_num, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NewsFavVO fav = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션을 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "SELECT * FROM news_fav WHERE news_num=? AND mem_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터를 바인딩
			pstmt.setInt(1, news_num);
			pstmt.setInt(2, mem_num);
			// SQL문 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				fav = new NewsFavVO();
				fav.setNews_fav_num(rs.getInt("news_fav_num"));
				fav.setNews_num(rs.getInt("news_num"));
				fav.setMem_num(rs.getInt("mem_num"));
			}
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return fav;
	}

	// 좋아요 삭제
	public void newsDeleteFav(int news_fav_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			// 커넥션풀로부터 커넥션 할당
			conn = DBUtil.getConnection();
			// SQL문 작성
			sql = "DELETE FROM news_fav WHERE news_fav_num=?";
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ?에 데이터 바인딩
			pstmt.setInt(1, news_fav_num);
			// SQL문 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			throw new Exception(e);
		} finally {
			// 자원정리
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//댓글 등록
		public void insertReplyBoard(NewsReplyVO boardReply)
		                                 throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "INSERT INTO news_reply (news_re_num,"
					+ "news_re_content,mem_num,news_num) "
					+ "VALUES (nreply_seq.nextval,?,?,?)";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setString(1, boardReply.getNews_re_content());
				pstmt.setInt(2, boardReply.getMem_num());
				pstmt.setInt(3, boardReply.getNews_num());
				//SQL문 실행
				pstmt.executeUpdate();
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
		}
		//댓글 개수
		public int getReplyBoardCount(int news_num)
				                            throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int count = 0;
			
			try {
				//커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "SELECT COUNT(*) FROM news_reply n "
					+ "JOIN member m ON n.mem_num=m.mem_num "
					+ "WHERE n.news_num=?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setInt(1, news_num);
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
		//댓글 목록
		public List<NewsReplyVO> getListReplyBoard(int start,
				                int end, int news_num)
		                                    throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<NewsReplyVO> list = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "SELECT * FROM (SELECT a.*, rownum rnum "
					+ "FROM (SELECT * FROM news_reply n "
					+ "JOIN member m USING (mem_num) "
					+ "WHERE n.news_num=? ORDER BY n.news_re_num "
					+ "DESC)a) WHERE rnum >= ? AND rnum <= ?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setInt(1, news_num);
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
				//SQL문 실행
				rs = pstmt.executeQuery();
				list = new ArrayList<NewsReplyVO>();
				while(rs.next()) {
					NewsReplyVO reply = new NewsReplyVO();
					reply.setNews_re_num(rs.getInt("news_re_num"));
					//날짜 -> 1분전, 1시간전, 1일전 형식의 문자열로 변환
					reply.setNews_re_date(
						DurationFromNow.getTimeDiffLabel(
									rs.getString("news_re_date")));
					if(rs.getString("news_re_modifydate")!=null) {
						reply.setNews_re_modifydate(
						 DurationFromNow.getTimeDiffLabel(
								  rs.getString("news_re_modifydate")));
					}
					reply.setNews_re_content(
							StringUtil.useBrNoHtml(
								    rs.getString("news_re_content")));
					reply.setNews_num(rs.getInt("news_num"));
					reply.setMem_num(rs.getInt("mem_num"));
					reply.setId(rs.getString("id"));
					
					list.add(reply);
				}
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(rs, pstmt, conn);
			}
			return list;
		}
		//댓글 상세
		public NewsReplyVO getReplyBoard(int news_re_num)
		                                   throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			NewsReplyVO reply = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "SELECT * FROM news_reply WHERE news_re_num=?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터를 바인딩
				pstmt.setInt(1, news_re_num);
				//SQL문 실행
				rs = pstmt.executeQuery();
				if(rs.next()) {
					reply = new NewsReplyVO();
					reply.setNews_re_num(rs.getInt("news_re_num"));
					reply.setMem_num(rs.getInt("mem_num"));
				}
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(rs, pstmt, conn);
			}
			
			return reply;
		}
		//댓글 수정
		public void updateReplyBoard(NewsReplyVO reply)
		                                       throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "UPDATE news_reply SET news_re_content=?,"
					+ "news_re_modifydate=SYSDATE "
					+ "WHERE news_re_num=?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터를 바인딩
				pstmt.setString(1, reply.getNews_re_content());
				pstmt.setInt(2, reply.getNews_re_num());
				//SQL문 실행
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
		}
		//댓글 삭제
		public void deleteReplyBoard(int re_num)
				                    throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션을 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "DELETE FROM news_reply WHERE news_re_num=?";
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setInt(1, re_num);
				//SQL문 실행
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
		}
}
