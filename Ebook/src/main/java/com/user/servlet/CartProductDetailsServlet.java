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

@WebServlet("/addProductDetails")
public class CartProductDetailsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		try {
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
			
//          LAY DU LIEU TU FORM
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			int quantity = Integer.parseInt(req.getParameter("quantity"));
			
			System.out.println(bid +" " + uid +" " + quantity);
//			LAY SACH VOI ID NHAN VAO
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid);

//			THAY DOI GIA TRI TRONG GIO HANG
			Cart c = new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setImage(b.getPhotoName());
			c.setAuthor(b.getAuthor()); 
			c.setQuantity(quantity); 
			c.setPrice(b.getPrice()); 
			c.setTotalPrice(b.getPrice() * quantity);

//			THEM 1 SAN PHAM VAO DANH SACH
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
//			KIEM TRA XEM SACH DA DUOC THEM VAO CSDL HAY CHUA 
			boolean checkIdBook = dao2.checkBookCart(bid, uid);
			
			HttpSession session = req.getSession();
			
			if (checkIdBook) { // NEU TRUE => CO THEM SO LUONG SAN PHAM TRONG CSDL 
				 
				boolean success = dao2.updateQuantityProductDetails (quantity, bid , uid );
//				KIEM TRA
					if (success) {
						session.setAttribute("addCart", "Book Update To Cart");
						resp.sendRedirect("checkout.jsp");
//					System.out.println("Add Cart Sucess");
					} else {
						session.setAttribute("failed", "Something Wrong On Server");
						resp.sendRedirect("view_books.jsp");
//					System.out.println("Not Added To Cart");
					}
				 
			} else {
				boolean f = dao2.addCart(c);

//			KIEM TRA
				if (f) {
					session.setAttribute("addCart", "Book Added To Cart");
					resp.sendRedirect("checkout.jsp");
//				System.out.println("Add Cart Sucess");
				} else {
					session.setAttribute("failed", "Something Wrong On Server");
					resp.sendRedirect("view_books.jsp");
//				System.out.println("Not Added To Cart");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
