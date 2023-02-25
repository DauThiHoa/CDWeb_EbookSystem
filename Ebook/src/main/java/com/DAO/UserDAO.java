package com.DAO;

import com.entity.User;

public interface UserDAO {

//	DANG KI TAI KHOAN NGUOI DUNG
	public boolean userRegister (User us);
//	LOGIN 
	public User login (String email, String password);
	
//	KIEM TRA MAT KHAU CO DUNG HAY KHONG?
	public boolean checkPassword (int id , String ps);
//	CAP NHAT THONG TIN NGUOI DUNG
	public boolean updateProfile (User us);
}
