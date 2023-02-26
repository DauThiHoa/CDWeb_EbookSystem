package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book_Order;

public class BookOrderImpl implements BookOrderDAO {

	private Connection conn;

	public BookOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//	LAY SO DON HANG
	@Override
	public int getOrderNo() {
		// TODO Auto-generated method stub
		int i = 1;
		try {

			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				i++;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

//	LUU DON HANG 
	@Override
	public boolean saveOrder(List<Book_Order> bList) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			
			String sql = "insert into book_order (order_id,user_name,email,address,phone,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?) ";
		
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for (Book_Order b : bList) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthor());
				ps.setDouble(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
			}
		
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG THEO EMAIL NGUOI DUNG
	@Override
	public List<Book_Order> getBook(String email) {
		// TODO Auto-generated method stub
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			String sql = "select * from book_order where email = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getDouble(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	
//	LAY DANH SACH CAC SAN PHAM TRONG DON HANG => admin
	@Override
	public List<Book_Order> getAllOrder() {
		// TODO Auto-generated method stub
		List<Book_Order> list = new ArrayList<Book_Order>();
		Book_Order o = null;
		try {
			String sql = "select * from book_order";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				o = new Book_Order();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookName(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getDouble(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

}
