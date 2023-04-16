package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.DAO.BookDAOImpl;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/searchBook")
public class SearchBookServlet extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchBookServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		String search_box  = request.getParameter("search_box"); 
		System.out.println("search_box: " + search_box);
		
		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
		List<BookDtls> list2 = dao2.getBookBySearch(search_box);
		 
		out.println(list2);
//		out.print("hhhhhhhhhhhhhhh");
		
//		System.out.println("DANH SACH KET QUA : ");
//		for (BookDtls b2 : list2) {  
//			System.out.println(b2.toString());
//		}   
			
//		HttpSession session = request.getSession(); 
//		response.sendRedirect("#" + search_box); 
//		response.sendRedirect("#"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
				   doPost(request, response);
	}

	
}
