package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

//			KET NOI DU LIEU
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			
//			LAY GIU LIEU EMAIL VA PASSWORD
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			System.out.println(email +" - " + password);
			
//			System.out.println("MA HOA MAT KHAU : ");
//			String hash = BCrypt.hashpw(password, BCrypt.gensalt(5));
//			System.out.println("BCrypt hash: " + hash);
			
//			System.out.println("GIAI MA : ");
//			boolean valuate = BCrypt.checkpw(password, hash); 
//			System.out.println(valuate);
			
			
//			NEU LA LOGIN BANG TAI KHOAN ADMIN
				if ("admin@gmail.com".equals(email) && "admin".equals(password)) { 
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			}else {
//				LOGIN PHAN NGUOI DUNG
				User us = dao.login(email, password);
				if ( us != null ) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg", "Email & Password Invalid");
					resp.sendRedirect("login.jsp");
				}
//				resp.sendRedirect("index.jsp");
			}
//			System.out.println("HEEELO");


		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
//			System.out.println("Failt");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
//		System.out.println("HHHH");
	}

}
