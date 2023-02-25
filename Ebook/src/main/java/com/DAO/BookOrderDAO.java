package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {

//	LAY SO DON HANG
	public int getOrderNo ();
//	LUU DON HANG 
	public boolean saveOrder (List<Book_Order> bList);
	
}
