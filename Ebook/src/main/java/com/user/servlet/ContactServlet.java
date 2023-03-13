package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ContactDAOImpl;
import com.DB.DBConnect;
import com.entity.Contact;

import net.codejava.mail.SendMail;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		super.doGet(request, response);
		 
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		try {
		
//		LAY GIU LIEU NAME VA EMAIL, NUMBER, SUBJECT, MESSAGE
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		int number = Integer.parseInt( request.getParameter("number") );
		String subject = request.getParameter("subject");
		String message = request.getParameter("message"); 
		
		System.out.println(name + " - " + email + " - " + number + " - " + subject + " - " + message);
	
		Contact contact = new Contact();
		contact.setName(name);
		contact.setEmail(email);
		contact.setNumber(number);
		contact.setSubject(subject);
		contact.setMessage(message);
		ContactDAOImpl dao = new ContactDAOImpl(DBConnect.getConn());
		boolean f = dao.addContact(contact);
				
		SendMail send = new SendMail() ;
		boolean sendMail = send.sendMail("webfurniture7@gmail.com",subject, message);
         
		HttpSession session = request.getSession(); 
		
		if (sendMail && f ) {
			session.setAttribute("succMsg", "Add Contact Successfully ... ");
			response.sendRedirect("contact.jsp");
		}else {
			session.setAttribute("failedMsg", "Add Contact Error ...");
			response.sendRedirect("contact.jsp");
		}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
