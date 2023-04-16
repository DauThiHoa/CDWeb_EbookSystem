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

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

/**
 * Servlet implementation class ArrangeServlet
 */
@WebServlet("/arrangeServlet")
public class ArrangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArrangeServlet() {
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

//		PRODUCT LIST getAllBooksDescPrice - getAllBooksAscPrice - getAllBooksDescName - getAllBooksAscName

//		String descPrice = request.getParameter("descPrice");
		String ascPrice = request.getParameter("ascPrice");
//		String descName = request.getParameter("descName");
//		String ascName = request.getParameter("ascName");

		System.out.println("ascPrice : - " + ascPrice);
//		if (ascPrice.equals("ascPrice")) {
		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
		/* List<BookDtls> list2 = dao2.getAllBooksAscName(); */
		List<BookDtls> list2 = dao2.getAllBooksAscName();

		out.print("none");
//			out.printf("succMsg", "none");
//			out.format("succMsg", "none");
//		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.setContentType("text/plain");
//		PrintWriter out = response.getWriter();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String descPrice = request.getParameter("descPrice");
		String ascPrice = request.getParameter("ascPrice");
		String descName = request.getParameter("descName");
		String ascName = request.getParameter("ascName");
		
//		categoryLanguage categoryLiterature categorySkills categoryArt categorySport
		String categoryLanguage = request.getParameter("categoryLanguage");
		String categoryLiterature = request.getParameter("categoryLiterature");
		String categorySkills = request.getParameter("categorySkills");
		String categoryArt = request.getParameter("categoryArt");
		String categorySport = request.getParameter("categorySport"); 
		
		System.out.println(descPrice +" - " + ascPrice +" - " +  descName +" - " +  ascName);
		System.out.println(categoryLanguage +" - " + categoryLiterature +" - " +  categorySkills +" - " +  categoryArt + " - " + categorySport);
//		session.setAttribute("category", "Foreign language books");
		
//		BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
//		List<BookDtls> list2;
		
		if (descPrice != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "block");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (ascPrice != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "block");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (descName != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "block");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (ascName != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "block");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (categoryLanguage != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "block");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (categoryLiterature != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "block");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (categorySkills != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "block");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (categoryArt != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "block");
			session.setAttribute("categorySport", "none");
			response.sendRedirect("shop.jsp");
		}
		else if (categorySport != null) {

//			list2 = dao2.getAllBooksDescPrice();
			HttpSession session = request.getSession();
			session.setAttribute("descPrice", "none");
			session.setAttribute("ascPrice", "none");
			session.setAttribute("descName", "none");
			session.setAttribute("ascName", "none");
			
			session.setAttribute("categoryLanguage", "none");
			session.setAttribute("categoryLiterature", "none");
			session.setAttribute("categorySkills", "none");
			session.setAttribute("categoryArt", "none");
			session.setAttribute("categorySport", "block");
			response.sendRedirect("shop.jsp");
		}

//			session.putValue("succMsg", list2);
//			response.sendRedirect("shop.jsp");
//		}
	}

}
