package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/editbooks")
@MultipartConfig
public class EditBooksServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
			int id = Integer.parseInt(req.getParameter("id"));  
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));  
			String status = req.getParameter("status");
			
			System.out.println(id + " - " + bookName + " - " +  author+ " - " +  price + " - " +  status );
			BookDtls b = new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = req.getSession();
			if (f)
			{
				session.setAttribute("succMsg", "Book Update Sucessfully...");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMsg", "Something wrong on Server...");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

}
