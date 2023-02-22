package com.DAO;

import com.entity.User;

public interface UserDAO {

//	DANG KI TAI KHOAN NGUOI DUNG
	public boolean userRegister (User us);
//	LOGIN 
	public User login (String email, String password);
}
