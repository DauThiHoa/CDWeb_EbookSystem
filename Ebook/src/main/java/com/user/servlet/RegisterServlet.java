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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

//			System.out.println(name + " | " + email  + " | " + phno  + " | " + password  + " | " + check);
//			System.out.println("MA HOA MAT KHAU : ");
			String hash = BCrypt.hashpw(password, BCrypt.gensalt(5));
//			System.out.println("BCrypt hash: " + hash);
			
			System.out.println(name + " - " + email + " - " +  phno + " - " +  password + " - " + check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(hash);

			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn()); 
			
			if (check != null ) {
				
				boolean f2 = dao.checkUser(email);
				if (f2)
				{
					boolean f = dao.userRegister(us);

					if (f) {
						System.out.println("User Register Success ...");
						session.setAttribute("succMsg", "Registration Successfully ... ");
						resp.sendRedirect("login.jsp");

					} else {
//					System.out.println("Something wrong on server ..." );
						session.setAttribute("failedMsg", "Something wrong on server ...");
						resp.sendRedirect("register.jsp");

					}
				}else {
					session.setAttribute("failedMsg", "User Already Exist Try Another Email id");
					resp.sendRedirect("register.jsp");
				}
				
			} else {
//				System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("failedMsg", "Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
