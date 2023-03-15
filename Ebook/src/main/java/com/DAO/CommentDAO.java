package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.CommentProduct;

public interface CommentDAO {

	// ADD COMMENT PRODUCT DETAILS
	public boolean addCommentProduct (CommentProduct c); 
	// LIST COMMENT PRODUCT DETAILS
	public List<CommentProduct> listCommentProduct (int bid);
	 
}
