package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn ;
	
	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//  PHUONG THUC DANG KI TAI KHOAN
	@Override
	public boolean userRegister (User us) {
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
//			THEM DU LIEU VAO CO SO DU LIEU
			String sql = "insert into user ( name, email, phno, password) values (?,?,?,?)";
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1, us.getName());
		    ps.setString(2, us.getEmail());
		    ps.setString(3, us.getPhno());
		    ps.setString(4, us.getPassword());

//		    UPDATE BANG USER
            int i = ps.executeUpdate();
            if ( i == 1 ) {
            	f= true ;
            }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//  PHUONG THUC DANG NHAP TAI KHOAN
	@Override
	public User login(String email, String password) {
		// TODO Auto-generated method stub
		User us = null ;
		
		try {
			boolean valuate = false;
			String hash = null;
			
			String sql1 = "select * from user where email = ?";
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps1.setString(1, email);
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) { 
				hash = (String) rs1.getString(5);
//				System.out.println("hash : " + hash + " Pass : " + password);
				valuate = BCrypt.checkpw(password, hash); 
			}
			
			if (valuate) {
			
			String sql = "select * from user where email = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, hash);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setState(rs.getString(9));
				us.setPincode(rs.getString(10));
			}
			
			}else {
				us = null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return us;
	}

//	KIEM TRA MAT KHAU CO DUNG HAY KHONG?
	@Override
	public boolean checkPassword(int id, String ps) {
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
			
			String sql = "select * from user where id =? and password =?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f= true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	CAP NHAT THONG TIN NGUOI DUNG
	@Override
	public boolean updateProfile(User us) {
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
//			THEM DU LIEU VAO CO SO DU LIEU
			String sql = "update user set name=?, email=?, phno=? where id =?";
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1, us.getName());
		    ps.setString(2, us.getEmail());
		    ps.setString(3, us.getPhno());
		    ps.setInt(4, us.getId());

//		    UPDATE BANG USER
            int i = ps.executeUpdate();
            if ( i == 1 ) {
            	f= true ;
            }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//  KIEM TRA XEM EMAIL DANG KI TAI KHOAN DA CO TRONG CSDL HAY CHUA
	@Override
	public boolean checkUser(String em) {
		// TODO Auto-generated method stub
		boolean f = true ;
		try {
//			CAU TRUY VAN
			String sql = "select * from user where email = ?";
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1, em); 

//		    NEU CO TRONG CSDL => TRA VE FALSE
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		    	f = false;
		    }
            
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

//	THAY DOI MAT KHAU USER
	@Override
	public boolean updateChangePass (String email,String password) {
		
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
			
//			THEM DU LIEU VAO CO SO DU LIEU
			String sql = "update user set password = ? where email =?";
		    PreparedStatement ps = conn.prepareStatement(sql);
		    ps.setString(1, password);
		    ps.setString(2, email); 

//		    UPDATE BANG USER
            int i = ps.executeUpdate();
            if ( i == 1 ) {
            	f= true ;
            }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	
//	KIEM TRA XEM MAT KHAU NHAP VAO CO DUNG HAY KHONG
	@Override
	public boolean checkPasswordEmail(String email, String password) {
		// TODO Auto-generated method stub
		boolean f = false ;
		try {
			 
				String hash = null;
				
				String sql1 = "select * from user where email = ?";
				PreparedStatement ps1 = conn.prepareStatement(sql1);
				ps1.setString(1, email);
				ResultSet rs1 = ps1.executeQuery();
				while (rs1.next()) { 
					hash = (String) rs1.getString(5);
//					System.out.println("hash : " + hash + " Pass : " + password);
					f = BCrypt.checkpw(password, hash); 
				}
				 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

}
