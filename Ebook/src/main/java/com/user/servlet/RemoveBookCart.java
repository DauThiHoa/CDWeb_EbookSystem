package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
//          LAY DU LIEU TU FORM
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			int cid = Integer.parseInt(req.getParameter("cid"));
			
//			XOA SAN PHAM TRONG GIO HANG
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBook(bid, uid, cid);

			HttpSession session = req.getSession();
			
//			KIEM TRA
			if (f) {
				session.setAttribute("succMsg" , "Book Removed from Cart");
				resp.sendRedirect("checkout.jsp");
 
			} else {
				session.setAttribute("failedMsg" , "Something Wrong On Server");
				resp.sendRedirect("checkout.jsp");
 
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
}
