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
import com.DAO.FavouriteDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/remove_favourite")
public class RemoveFavourite extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
//          LAY DU LIEU TU FORM
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid")); 
			
//			XOA SAN PHAM TRONG DANH SACH SAN PHAM YEU THICH
			FavouriteDAOImpl dao = new FavouriteDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteFavourite(bid, uid);

			HttpSession session = req.getSession();
			
//			KIEM TRA
			if (f) {
				session.setAttribute("succMsg" , "Favourite removed from list");
				resp.sendRedirect("favourite.jsp");
 
			} else {
				session.setAttribute("failedMsg" , "Something Wrong On Server");
				resp.sendRedirect("favourite.jsp");
 
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
}
