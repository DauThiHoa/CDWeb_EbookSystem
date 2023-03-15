package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.CommentProduct;

public class CommentDAOImpl implements CommentDAO {

private Connection conn ;
	 
	public CommentDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	// ADD COMMENT PRODUCT DETAILS
	@Override
	public boolean addCommentProduct(CommentProduct c) {
		// TODO Auto-generated method stub
				boolean f = false ;
				try {
					
					String sql = "insert into commentproduct (name, email, date, content ) values (?,?,?,?) ";
					PreparedStatement ps = conn.prepareStatement(sql);
					ps.setString(1, c.getName() );
					ps.setString(2, c.getEmail() ); 
					ps.setString(3, c.getDate() );
					ps.setString(4, c.getContent() ); 
					
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

	
}
