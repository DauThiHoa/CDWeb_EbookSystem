package com.DAO;

import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	
//	PHUONG THUC THEM SACH VAO CSDL
	public boolean addBooks(BookDtls b);
//	PHUONG THUC LAY DANH SACH CAC SAN PHAM CO TRONG CSDL
	public List<BookDtls> getAllBooks ();
	
//	LAY SACH THEO MA ID 
	public BookDtls getBookById (int id);
//	CHINH SUA NOI DUNG SACH
	public boolean updateEditBooks (BookDtls b);
//	XOA QUYEN SACH THEO MA
	public boolean deleteBooks (int id);
	
//	LAY DANH SACH CAC SACH MOI 
	public List<BookDtls> getNewBook ();
//	LAY DANH SACH CAC SACH GAN DAY 
	public List<BookDtls> getRecentBooks ();
//	LAY DANH SACH CAC SACH CU
	public List<BookDtls> getOldBooks ();
}
