package kr.shop.dao;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.awt.dnd.DropTargetContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import kr.shop.vo.OrdersVO;
import kr.shop.vo.ProductDTO;
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
		DecimalFormat df = new DecimalFormat("###,###원");
		
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
	public int getProductCount()throws Exception{
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
			sql = "SELECT * FROM (SELECT a.*, rownum rnum FROM (SELECT * FROM product ORDER BY pd_num DESC)a) WHERE rnum >= ? AND rnum <= ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs=pstmt.executeQuery();
			list = new ArrayList<ProductVO>();
			
			while(rs.next()) {
				ProductVO product = new ProductVO();
				product.setPd_num(rs.getInt("pd_num"));
				product.setPd_name(rs.getString("pd_name"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_price(rs.getInt("pd_price"));
				product.setPd_photo( URLEncoder.encode(rs.getString("pd_photo"), "UTF-8"));
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
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
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
				product.setPd_num(rs.getInt("pd_num"));
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
	public ProductVO productDetail(int pd_num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =null;
		ProductVO product = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM product WHERE pd_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pd_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = new ProductVO();
				product.setPd_num(rs.getInt("pd_num"));
				product.setPd_name(rs.getString("pd_name"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_price(rs.getInt("pd_price"));
				product.setPd_photo(rs.getString("pd_photo"));
				product.setPd_quantity(rs.getInt("pd_quantity"));
				product.setPd_regdate(rs.getDate("pd_regdate"));
				
			}
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		return product;
	}
	//상품수정
	public void productUpdate(ProductVO product)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "UPDATE product set pd_name=?,pd_price=?,pd_quantity=?,pd_content=?,pd_photo=? WHERE pd_num=?"; 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product.getPd_name());
			pstmt.setInt(2, product.getPd_price());
			pstmt.setInt(3, product.getPd_quantity());
			pstmt.setString(4, product.getPd_content());
			pstmt.setString(5, product.getPd_photo());
			pstmt.setInt(6, product.getPd_num());
			
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//상품삭제
	public void productDelete(int pd_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String sql = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			
			sql = "DELETE FROM orders WHERE pd_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pd_num);
			pstmt.executeUpdate();
			
			sql = "DELETE FROM product WHERE pd_num=?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, pd_num);
			pstmt2.executeUpdate();
			
			conn.commit();
		}catch(Exception e) {
			conn.rollback();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(null, pstmt, conn);
		}
	}
	//구매하기
	public boolean productOrder(int pd_num, int mem_num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "INSERT INTO ORDERS(ORD_NUM, MEM_NUM, PD_NUM, ORD_REGDATE, ORD_QUANTITY) VALUES(OREDERS_SEQ.nextval, ?, ?, sysdate, 1)";
			pstmt1 = conn.prepareStatement(sql);
			pstmt1.setInt(1, mem_num);
			pstmt1.setInt(2, pd_num);
			int success = pstmt1.executeUpdate();
			
			sql = "SELECT * FROM PRODUCT WHERE PD_NUM = ?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, pd_num);
			rs = pstmt2.executeQuery();
			int pd_quantity = 0;
			
			if(rs.next()) {
				pd_quantity = rs.getInt("pd_quantity");
				pd_quantity -= 1;
			}
			sql = "UPDATE PRODUCT SET pd_quantity = ? WHERE pd_num = ?";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, pd_quantity);
			pstmt3.setInt(2, pd_num);
			int success2 = pstmt3.executeUpdate();
			if(success != 0 && success2 != 0) {
				return true;
			} else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
			
		}finally {
			pstmt1.close();
			pstmt2.close();
			DBUtil.executeClose(rs, pstmt3, conn);
		}
	}
	//1회이상 구매했는지? 체크
	public boolean checkProductOrder(int pd_num,int mem_num)throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM orders WHERE pd_num=? AND mem_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pd_num);
			pstmt.setInt(2,  mem_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return false;
			}
			return true;
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}	
	}
	
	//회원별 구매목록
	public List<ProductDTO> getOrderList(int mem_num)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ProductDTO> list= null;
		
		
		try {
			conn = DBUtil.getConnection();
			sql = "SELECT * FROM orders o JOIN product p ON (o.pd_num=p.pd_num) WHERE mem_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_num);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ProductDTO>();
			while(rs.next()) {
				OrdersVO orders = new OrdersVO();
				orders.setMem_num(mem_num);
				orders.setOrd_num(rs.getInt("ord_num"));
				orders.setOrd_quantity(rs.getInt("ord_quantity"));
				orders.setOrd_regdate(rs.getDate("ord_regdate"));
				orders.setPd_num(rs.getInt("pd_num"));
				ProductVO product = new ProductVO();
				product.setPd_name(rs.getString("pd_name"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_price(rs.getInt("pd_price"));
				product.setPd_photo(rs.getString("pd_photo"));
				ProductDTO dto = new ProductDTO();
				dto.setOrdersVO(orders);
				dto.setProductVO(product);
				
				list.add(dto);
			}
			return list;
		}catch(Exception e) {
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(rs, pstmt, conn);
		}
		
	}
	
	//주문취소
	public boolean productDeleteOrder(int pd_num,int ord_num)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBUtil.getConnection();
			sql = "DELETE FROM orders WHERE ord_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ord_num);
			int success = pstmt.executeUpdate();
			
			sql = "SELECT * FROM PRODUCT WHERE PD_NUM = ?";
			pstmt2 = conn.prepareStatement(sql);
			pstmt2.setInt(1, pd_num);
			rs = pstmt2.executeQuery();
			int pd_quantity = 0;
			
			if(rs.next()) {
				pd_quantity = rs.getInt("pd_quantity");
				pd_quantity += 1;
			}
			
			sql = "UPDATE PRODUCT SET pd_quantity = ? WHERE pd_num = ?";
			pstmt3 = conn.prepareStatement(sql);
			pstmt3.setInt(1, pd_quantity);
			pstmt3.setInt(2, pd_num);
			int success2 = pstmt3.executeUpdate();
			if(success != 0 && success2 != 0) {
				return true;
			} else {
				return false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception(e);
		}finally {
			DBUtil.executeClose(null, pstmt3, null);
			DBUtil.executeClose(null, pstmt2, null);
			DBUtil.executeClose(rs, pstmt, conn);
		}
	}
	
	
	
}
