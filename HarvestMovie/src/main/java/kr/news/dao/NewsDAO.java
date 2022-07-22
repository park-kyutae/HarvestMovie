package kr.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
					+ "news_content,news_photo) VALUES ("
					+ "news_seq.nextval,?,?,?)";
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				pstmt.setString(1, news.getNews_title());
				pstmt.setString(2, news.getNews_content());
				pstmt.setString(3, news.getNews_photo());
				
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
		
		//글목록(검색글 목록)
		public List<NewsVO> getListNews(int start, int end,
		          String keyfield,String keyword)
                                 throws Exception{
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<NewsVO> list = null;
			String sql = null;
			String sub_sql = "";
			int cnt = 0;
			
			try {
				//JDBC 수행 1,2단계 : 커넥션풀로부터 커넥션 할당
				conn = DBUtil.getConnection();
				
				if(keyword!=null && !"".equals(keyword)) {
					if(keyfield.equals("1")) sub_sql = "WHERE n.news_title LIKE ?";
					else if(keyfield.equals("2")) sub_sql = "WHERE n.id LIKE ?";
					else if(keyfield.equals("3")) sub_sql = "WHERE n.news_content LIKE ?";
					}
				
				sql = "SELECT * FROM (SELECT a.*, rownum rnum "
					+ "FROM (SELECT * FROM news n JOIN member m "
					+ "USING (mem_num) JOIN member_detail d "
					+ "USING (mem_num) "+ sub_sql
					+ " ORDER BY n.news_num DESC)a) "
					+ "WHERE rnum >= ? AND rnum <= ?";
				
				//JDBC 수행 3단계 : PreparedStatement 객체 생성
				pstmt = conn.prepareStatement(sql);
				//?에 데이터 바인딩
				if(keyword!=null && !"".equals(keyword)) {
					pstmt.setString(++cnt, "%"+keyword+"%");
				}
				pstmt.setInt(++cnt, start);
				pstmt.setInt(++cnt, end);
				
				//JDBC 수행 4단계
				rs = pstmt.executeQuery();
				list = new ArrayList<NewsVO>();
				while(rs.next()) {
					NewsVO news = new NewsVO();
					news.setNews_num(rs.getInt("news_num"));
					news.setNews_title(rs.getString("news_title"));
					news.setNews_hit(rs.getInt("news_hit"));
					news.setNews_date(rs.getDate("news_date"));
					news.setNews_modifydate(rs.getDate("news_modifydate"));
					news.setNews_photo(rs.getString("news_photo"));
					news.setMem_num(rs.getInt("mem_num"));
					news.setId(rs.getString("id"));
					news.setMem_photo(rs.getString("mem_photo"));
					
					list.add(news);				
				}
			}catch(Exception e) {
				throw new Exception(e);
			}finally {
				//자원정리
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

		//파일 삭제
		//글수정
	
	
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