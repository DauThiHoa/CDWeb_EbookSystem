package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

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

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
//		String hash = BCrypt.hashpw(currentPassword, BCrypt.gensalt(5));
		
//		System.out.println(email + "  -----  " + currentPassword);
//			KET NOI DU LIEU
//		$2a$05$ugAb0E9Pdy5Kk1xumjJ.dezc1jLpBY/pqszBjH/stHx6JOC9O1Weq
//		System.out.println(hash);
		
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
//		boolean checkPassEmail = dao.checkPasswordEmail(email, hash);
		boolean us = dao.checkPasswordEmail(email, currentPassword);
		
//		System.out.println(checkPassEmail + "=> checkPassEmail ");
		
		if (!us) {
			out.print("Email & Password Invalid");
		}else
		if (currentPassword.equals(newPassword)) {
			out.print("Password is same old password");
		}else
		if (!confirmPassword.equals(newPassword)) {
			out.print("Password incorrect");
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

//		doGet(request, response);

		String email = request.getParameter("email");
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		System.out.println("POST : " + email +" -- " + currentPassword  +" -- " + newPassword  +" -- " + confirmPassword);

		String hash = BCrypt.hashpw(newPassword, BCrypt.gensalt(5));
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn()); 
		
		boolean us = dao.checkPasswordEmail(email, currentPassword);
		HttpSession session = request.getSession(); 
		
		if (us == true && !(currentPassword.equals(newPassword)) && (confirmPassword.equals(newPassword)) ) {
		   boolean checkPassEmail = dao.updateChangePass (email,hash);
		
		if ( checkPassEmail ) {
			session.setAttribute("succMsg", "Change Password Successfully ... ");
			response.sendRedirect("login.jsp");
		}else {
			session.setAttribute("failedMsg", "Change Password Error ...");
			response.sendRedirect("changePassword.jsp");
		  }
		
		}else {
			session.setAttribute("failedMsg", "Please check the information again ...");
			response.sendRedirect("changePassword.jsp");
		}
	}

}
