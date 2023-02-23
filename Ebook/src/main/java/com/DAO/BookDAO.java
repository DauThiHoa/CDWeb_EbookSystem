package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	
//	PHUONG THUC THEM SACH VAO CSDL
	public boolean addBooks(BookDtls b);
//	PHUONG THUC LAY DANH SACH CAC SAN PHAM CO TRONG CSDL
	public List<BookDtls> getAllBooks ();
}
