package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;

public interface CartDAO {

//	THEM SAN PHAM VAO GIO HANG
	public boolean addCart ( Cart c );
	
//	LAY THONG TIN SACH THEM THONG TIN => MA ID NGUOI DUNG THEM SAN PHAM
	public List<Cart> getBookByUser (int userId);
//	XOA SAN PHAM TRONG GIO HANG
	public boolean deleteBook (int bid , int uid);
}
