package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/updateQuantity")
public class UpdateQuantityCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));
		
		System.out.println("quantity : " + quantity + " - " + bid  + " - " +uid + " - " +cid);
		
//		CAP NHAT SO LUONG CUA SAN PHAM TRONG GIO HANG
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		boolean f = dao.updateQuantityCart(quantity, bid , uid);

		HttpSession session = req.getSession();
		
//		KIEM TRA
		if (f) {
			session.setAttribute("succMsg" , "Book Update from Cart");
			resp.sendRedirect("checkout.jsp");

		} else {
			session.setAttribute("failedMsg" , "Something Wrong On Server");
			resp.sendRedirect("checkout.jsp");

		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

	
}
