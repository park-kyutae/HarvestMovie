package kr.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.board.vo.BoardVO;
import kr.news.vo.NewsVO;
import kr.util.DBUtil;
import kr.util.StringUtil;

public class NewsDAO {
	//싱글턴 패턴
		private static NewsDAO instance = new NewsDAO();
		
		public static NewsDAO getInstance() {
			return instance;
		}
		private NewsDAO() {}
		
		//글등록
		public void insertNews(NewsVO news)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "INSERT INTO news (news_num,news_title,"
					+ "news_content,news_photo,mem_num) VALUES ("
					+ "news_seq.nextval,?,?,?,?)";
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setString(1, news.getNews_title());
				pstmt.setString(2, news.getNews_content());
				pstmt.setString(3, news.getNews_photo());
				pstmt.setInt(4, news.getMem_num());
				
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
		public int getNewsCount(String keyfield,String keyword)throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String sub_sql = "";
			int count = 0;
			
			try {
				conn = DBUtil.getConnection();
				
				if(keyword!=null && !"".equals(keyword)) {
					if(keyfield.equals("1")) sub_sql = "WHERE n.news_title LIKE ?";
					else if(keyfield.equals("2")) sub_sql = "WHERE m.id LIKE ?";
					else if(keyfield.equals("3")) sub_sql = "WHERE n.news_content LIKE ?";
				}
				
				sql="SELECT COUNT(*) FROM news n JOIN member m USING(mem_num) "+sub_sql;
				
				pstmt= conn.prepareStatement(sql);
				if(keyword!=null && !"".equals(keyword)) {
					pstmt.setString(1, "%"+keyword+"%");
				}
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
			}catch (Exception e) {
				throw new Exception(e);
			}finally {
				DBUtil.executeClose(rs, pstmt, conn);
			}
			
			return count;
		}
		//글목록(검색글 목록)
		public List<NewsVO> getListNews(int start, int end,
		          String keyfield,String keyword)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<NewsVO> list = null;
			String sql = null;
			String sub_sql = "";
			int cnt = 0;
			
			try {
				conn = DBUtil.getConnection();
				
				if(keyword!=null && !"".equals(keyword)) {
					if(keyfield.equals("1")) sub_sql = "WHERE n.news_title LIKE ?";
					else if(keyfield.equals("2")) sub_sql = "WHERE m.id LIKE ?";
					else if(keyfield.equals("3")) sub_sql = "WHERE n.news_content LIKE ?";
				}
				
				sql = "SELECT * FROM (SELECT a.*, rownum rnum "
						+ "FROM (SELECT * FROM news n JOIN member m "
						+ "USING (mem_num) JOIN member_detail d "
						+ "USING (mem_num) "+ sub_sql
						+ " ORDER BY n.news_num DESC)a) "
						+ "WHERE rnum >= ? AND rnum <= ?";
				
				pstmt = conn.prepareStatement(sql);
				
				//?에 데이터 바인딩
				if(keyword!=null && !"".equals(keyword)) {
					pstmt.setString(++cnt, "%"+keyword+"%");
				}
				pstmt.setInt(++cnt, start);
				pstmt.setInt(++cnt, end);
				
				rs = pstmt.executeQuery();
				list = new ArrayList<NewsVO>();
				while(rs.next()) {
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
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				DBUtil.executeClose(rs, pstmt, conn);
			}
			return list;
		}
		//글상세
		public NewsVO getNews(int news_num)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			NewsVO news = null;
			String sql = null;
			
			try {
				//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "SELECT * FROM news n JOIN member m "
					+ "USING(mem_num) JOIN member_detail d "
					+ "USING(mem_num) WHERE n.news_num=?";
				
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setInt(1, news_num);
				//JDBC 수행 4단계
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
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
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(rs, pstmt, conn);
			}
			return news;
			
		}
		//조회수 증가
		public void updateNewsReadcount(int news_num) throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				conn = DBUtil.getConnection();
				
				sql = "UPDATE news SET hit=hit+1 WHERE news_num=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, news_num);
				
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
		}
		//뉴스 사진 삭제
		public void newsDeleteFile(int news_num)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			
			try {
				//커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				//SQL문 작성
				sql = "UPDATE news SET news_photo='' WHERE news_num=?";
				
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, news_num);
				
				//SQL문 실행
				pstmt.executeUpdate();
				
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
		}
		//글수정
		public void updateNews(NewsVO news)throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			String sql = null;
			String sub_sql = "";
			int cnt = 0;
			
			try {
				//커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				
				if(news.getNews_photo()!=null) {
					//업로드한 파일이 있는 경우
					sub_sql = ",news_photo=?";
				}
				
				sql = "UPDATE news SET news_title=?,news_content=?,"
					+ "news_modifydate=SYSDATE" + sub_sql 
					+ " WHERE news_num=?";
				
				//PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setString(++cnt, news.getNews_title());
				pstmt.setString(++cnt, news.getNews_content());
				if(news.getNews_photo()!=null) {
					pstmt.setString(++cnt, news.getNews_photo());
				}
				pstmt.setInt(++cnt, news.getNews_num());
				
				//SQL문 실행
				pstmt.executeUpdate();
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
				DBUtil.executeClose(null, pstmt, conn);
			}
			
		}
		//글삭제
		public void newsDelete(int news_num)throws Exception{
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
				//댓글 삭제
				
				//부모글 삭제
				sql = "DELETE FROM news WHERE news_num=?";
				pstmt3 = conn.prepareStatement(sql);
				pstmt3.setInt(1, news_num);
				pstmt3.executeUpdate();
				
				//예외 발생이 없이 정상적으로 SQL문 실행
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
	//좋아요 개수
	//회원번호와 게시물 번호를 이용한 좋아요 정보
	//좋아요 삭제
	
	//댓글 등록
	//댓글 개수
	//댓글 목록
	//댓글 상세
	//댓글 수정
	//댓글 삭제
}
