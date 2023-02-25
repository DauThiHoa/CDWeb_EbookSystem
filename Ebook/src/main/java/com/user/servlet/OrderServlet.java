package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAO;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;
			
//			System.out.println(name + " - " + email + " - " + phno + " - " + fullAdd  + " - " + paymentType);
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> blist = dao.getBookByUser(id);
			BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
			int i = dao2.getOrderNo();

			
			ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
			for(Cart c : blist) {
				 Book_Order o = new Book_Order();
				 
				 o.setOrderId("BOOK-ORD-00" + i);
				 o.setUserName(name);
				 o.setEmail(email);
				 o.setPhno(phno);
				 o.setFulladd(fullAdd);
				 o.setBookName(c.getBookName());
				 o.setAuthor(c.getAuthor());
				 o.setPrice(c.getPrice());
				 o.setPaymentType(paymentType);
				 orderList.add(o);
				 i++;
//				 System.out.println(orderList);
			}
			
			if ("noselect".equals(paymentType)) {
				session.setAttribute("failedMsg", "Please Choose Payment Method");
				resp.sendRedirect("checkout.jsp");
			}else {
				boolean f = dao2.saveOrder(orderList);
				
				if (f) {
					session.setAttribute("succMsg", "Add Order Success ");
					resp.sendRedirect("order_success.jsp");
					
					System.out.println("order_success.jsp");
					
				}else {
					session.setAttribute("failedMsg", "Your Order Failed");
					resp.sendRedirect("checkout.jsp");
					
					System.out.println("Order Failed");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
