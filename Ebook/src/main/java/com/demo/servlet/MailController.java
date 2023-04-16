package com.demo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

import net.codejava.mail.RandomStringExmple;
import net.codejava.mail.SendMail;

/**
 * Servlet implementation class MailController
 */
@WebServlet("/sendMail")
public class MailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	private ServletContext context;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MailController() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public void init(ServletConfig config) throws ServletException {
//		this.context = config.getServletContext();
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();
		super.doGet(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();

		String email = request.getParameter("email");
		System.out.println("email: " + email);

//		LAY CHUOI KI TU NGAU NHIEN
		RandomStringExmple random = new RandomStringExmple();
		String passwordNew = random.randomAlphaNumeric(8);
//		MA HOA KI TU
		String hash = BCrypt.hashpw(passwordNew, BCrypt.gensalt(5));
		
		
//		KIEM TRA MAIL CO TRONG CSDL HAY KO
		UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
		boolean f2 = dao.checkUser(email);
		
		if (!f2)
		{
			boolean f = dao.updateChangePass(email, hash);
			SendMail sendmail = new SendMail();
			
			boolean result = sendmail.sendMail(email, "Change Password Account",
					"Your new password is : "+ passwordNew + "\n\n" +
			        "Please login the site with the new password \n\n http://localhost:8080/Ebook/login.jsp" +"\n\n"+
			        "Or you can change your password" +"\n\n"+
					"http://localhost:8080/Ebook/changePassword.jsp");
			
			if (f && result) {
				System.out.println("Send Email And Update Password Success ...");
				session.setAttribute("succMsg", "Send Mail Successfully");
				response.sendRedirect("login.jsp");

			} else {
				session.setAttribute("failedMsg", "Send Mail Error");
				response.sendRedirect("reset.jsp");

			}
		}else {
			session.setAttribute("failedMsg", "User Already Exist Try Another Email id");
			response.sendRedirect("register.jsp");
		}
		 
	}

}
