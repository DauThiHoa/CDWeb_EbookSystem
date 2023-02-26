package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpl implements BookDAO {

	private Connection conn ;
	
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//	PHUONG THUC THEM SACH VAO CSDL
	@Override
	public boolean addBooks(BookDtls b) {
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
			
			String sql = "insert into book_dtls (bookname, author, price, bookCategory, status, photo, email) values (?,?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail()); 
			
			int i = ps.executeUpdate();
			
			if ( i == 1 ) {
				f = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	PHUONG THUC LAY DANH SACH CAC SAN PHAM CO TRONG CSDL
	@Override
	public List<BookDtls> getAllBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			
			String sql = "select * from book_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while( rs.next() ) 
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

//	LAY SACH THEO MA ID 
	@Override
	public BookDtls getBookById(int id) {
		// TODO Auto-generated method stub
		BookDtls b = null ;
		try {
			
			String sql = "select * from book_dtls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next())
			{
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				 
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return b;
	}
	
	
//  CHINH SUA NOI DUNG SACH
	@Override
	public boolean updateEditBooks(BookDtls b) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "update book_dtls set bookname=?, author=?,price=?,status=? where bookId =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i = ps.executeUpdate();
			if ( i == 1 ) {
				f = true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	XOA QUYEN SACH THEO MA
	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from book_dtls where bookId =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if ( i == 1 ) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	LAY DANH SACH CAC SACH MOI  => GIOI HAN 4 QUYEN SACH
	@Override
	public List<BookDtls> getNewBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookCategory =? and status =? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1 ;
			while (rs.next() && i <= 4 ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
//			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

//	LAY DANH SACH CAC SACH GAN DAY => GIOI HAN 4 QUYEN SACH
	@Override
	public List<BookDtls> getRecentBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
//			DESC
			String sql = "select * from book_dtls where status =? order by bookId asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
//			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1 ;
			while (rs.next() && i <= 4 ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

//	LAY DANH SACH CAC SACH CU => GIOI HAN 4 QUYEN SACH
	@Override
	public List<BookDtls> getOldBooks() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookCategory =? and status =? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i = 1 ;
			while (rs.next() && i <= 4 ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
//			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

//	LAY DANH SACH TAT CA CAC LOAI SACH GAN DAY
	@Override
	public List<BookDtls> getAllRecentBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
//			DESC
			String sql = "select * from book_dtls where status =? order by bookId asc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Active");
//			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
//			int i = 1 ;
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
//	LAY DANH SACH TAT CA CAC LOAI SACH MOI
	@Override
	public List<BookDtls> getAllNewBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookCategory =? and status =? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
//			int i = 1 ;
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}
//			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
//	LAY DANH SACH TAT CA CAC LOAI SACH CU
	@Override
	public List<BookDtls> getAllOldBook() {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookCategory =? and status =? order by bookId DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
//			int i = 1 ;
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//				i++;
			}
//			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	
//	LAY DANH SACH CAC SACH CU VOI EMAIL NGUOI DUNG
	@Override
	public List<BookDtls> getBookByOld(String email, String cate) {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookCategory =? and email =? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
//		 
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//			 
			}
			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	 public static void main(String[] args) {
//		 getBookByOld("19130075@st.hcmuaf.edu.vn", "Old");
	}

//		XOA QUYEN SACH CU VOI EMAIL NGUOI DUNG 
	@Override
	public boolean oldBookDelete(String email, String cate, int id) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "delete from book_dtls where bookCategory =? and email =? and bookId =?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, cate);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i = ps.executeUpdate();
			if ( i == 1 ) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//  TIM KIEM SAN PHAM THEO TEN 
	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		// TODO Auto-generated method stub
		List<BookDtls> list = new ArrayList<BookDtls>();
		BookDtls b = null ;
		
		try {
			String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status =? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + ch + "%");
			ps.setString(2, "%" + ch + "%");
			ps.setString(3, "%" + ch + "%");
			ps.setString(4, "Active");
			
			ResultSet rs = ps.executeQuery();
//		 
			while (rs.next() ) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
//			 
			}
//			System.out.println(list);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
