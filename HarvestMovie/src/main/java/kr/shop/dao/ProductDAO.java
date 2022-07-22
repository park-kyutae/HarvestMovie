package kr.shop.dao;

import java.awt.dnd.DropTargetContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.shop.vo.ProductVO;
import kr.util.DBUtil;

public class ProductDAO {
	//싱글턴 패턴
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return instance;
	}
	private ProductDAO() {}
	
	//상품등록
	public void insertProduct(ProductVO product)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO product (pd_num,pd_name,pd_price,pd_quantity,pd_content,pd_photo) VALUES (product_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product.getPd_name());
			pstmt.setInt(2, product.getPd_price());
			pstmt.setInt(3, product.getPd_quantity());
			pstmt.setString(4, product.getPd_content());
			pstmt.setString(5, product.getPd_photo());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
		
		
	}
	//상품 총 레코드 수
	public int getProductCount(String keyfield,String keyword)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		try {
			conn = DBUtil.getConnection();
			sql="SELECT COUNT(*) FROM product";
			
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1); //갯수를 센담에 옮겨담기
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return count;
	}
	//상품 표 목록
	public List<ProductVO> getListProduct(int start,int end)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ProductVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM product ORDER BY num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			list = new ArrayList<ProductVO>();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPd_name(rs.getString("pd_name"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_price(rs.getInt("pd_price"));
				product.setPd_photo(rs.getString("pd_photo"));
				product.setPd_quantity(rs.getInt("pd_quantity"));
				product.setPd_regdate(rs.getDate("pd_regdate"));
				
				list.add(product);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	//메인 상품 나열 목록
	public List<ProductVO> getListPhotoProduct()throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<ProductVO> list = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM product ORDER BY pd_num DESC";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			list = new ArrayList<ProductVO>();
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPd_name(rs.getString("pd_name"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_price(rs.getInt("pd_price"));
				product.setPd_photo(rs.getString("pd_photo"));
				product.setPd_quantity(rs.getInt("pd_quantity"));
				product.setPd_regdate(rs.getDate("pd_regdate"));
				
				list.add(product);
			}
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return list;
	}
	//상품상세
	//상품수정
	
	
}
