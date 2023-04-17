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
import com.mysql.cj.x.protobuf.MysqlxExpr.Object.ObjectFieldOrBuilder;

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
		
		super.doGet (request, response);
		
//		 TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();
//
//		String search_box  = request.getParameter("search_box"); 
//		
//		System.out.println("search_box: " + search_box);
//		
//		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
//		
//		List<BookDtls> list2 = dao2.getBookBySearch(search_box);
//		 
//		out.println(list2);
//		System.out.println("====================");
//		for (BookDtls bookDtls : list2) {
//			System.out.println(bookDtls);
//		} 
//		System.out.println("====================");
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("listBook", list2);
//		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub 

					// TODO Auto-generated method stub
//					response.getWriter().append("Served at: ").append(request.getContextPath());
					request.setCharacterEncoding("UTF-8");
					response.setCharacterEncoding("UTF-8");
					
//					response.setContentType("text/plain");
//					PrintWriter out = response.getWriter();

					String search_box  = request.getParameter("text"); 
					
					System.out.println("search_box 2 : " + search_box);
					
					BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
					
					List<BookDtls> list2 = dao2.getBookBySearch(search_box);
					 
//					out.println(list2);
//					System.out.println("====================");
//					for (BookDtls bookDtls : list2) {
//						System.out.println(bookDtls);
//					} 
//					System.out.println("====================");
					 
				    HttpSession session = request.getSession();
					session.setAttribute("listBook", list2);
//					response.sendRedirect("#");
					
//					==================== CHUYEN VE TRANG TRUOC DO ==================================
					response.sendRedirect(request.getHeader("referer"));
	}

	
}
