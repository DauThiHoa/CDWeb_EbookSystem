package com.DAO;

import java.util.ArrayList;

import com.entity.OrderDetails;

public interface OrderDetailsDAO {
	
	   // ADD ORDER DETAILS VAO CSDL
		public boolean addOrderDetails (OrderDetails o);
		
//		LAY DANH SACH DON HANG CHI TIET VOI THAM SO DUA VAO LA MA DON HANG
		public ArrayList<OrderDetails> list (String order_Id);
		
		
}
