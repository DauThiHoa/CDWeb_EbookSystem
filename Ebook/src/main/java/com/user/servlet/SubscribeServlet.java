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

import net.codejava.mail.SendMail;

@WebServlet("/subscribe")
public class SubscribeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
//			KET NOI DU LIEU
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			
//			LAY GIU LIEU EMAIL
			String email = req.getParameter("email"); 

			 System.out.println(email); 
			 SendMail send = new SendMail();
			 boolean sendMail = send.sendMail(email, "SIGN UP FOR NEWS", "You have successfully subscribed to the newsletter! Please check your email regularly to receive the latest news from our website.");
			 
			if ( sendMail ) { 
					resp.sendRedirect("index.jsp");
			}else {
					session.setAttribute("failedMsg", "Email Invalid");
					resp.sendRedirect("index.jsp");
			 }   


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
