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
import com.DAO.OrderDetailsDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import com.entity.OrderDetails;

import net.codejava.mail.RandomStringExmple;

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
			
			System.out.println("ORDER");
			System.out.println(address + ", " + landmark + ", " + city + ", " + state + ", " + pincode + ", " + paymentType); 
			String fullAdd = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;
			
			int uid = Integer.parseInt(req.getParameter("uid"));
			double total = Double.parseDouble(req.getParameter("total"));
			
			System.out.println("TONG TIEN : " + total);
			 
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn()); 
			List<Cart> blist = dao.getBookByUser(id);
			
			RandomStringExmple randomStr = new RandomStringExmple ();
			String orderId = randomStr.randomAlphaNumeric(10);
			
			if (blist.isEmpty()) {
				session.setAttribute("failedOrder", "Add Item");
				resp.sendRedirect("checkout.jsp"); 
			}else {
				 
				if ("noselect".equals(paymentType)) {
						session.setAttribute("failedOrder", "Please Choose Payment Method");
						resp.sendRedirect("checkout.jsp"); 
				}else {
					BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
					int i = dao2.getOrderNo(); 
					 
						 Book_Order o = new Book_Order();
						 
						 o.setOrderId(orderId);
						 o.setUserName(name);
						 o.setEmail(email);
						 o.setPhno(phno);
						 o.setFulladd(fullAdd); 
						 o.setPrice(total);
						 o.setPaymentType(paymentType); 
						 
					boolean f = dao2.saveOrder(o); 

					
					CartDAOImpl dao1 = new CartDAOImpl(DBConnect.getConn());
					List<Cart> cart = dao1.getBookByUser(uid);
					
					boolean addOrderDetails = false ;
					
					for (Cart c : cart) {
						 
						
//					 order_id, cid, bid, uid, bookName, image, author,quantity,price,total_price
						
					 OrderDetailsDAOImpl dao3 = new OrderDetailsDAOImpl(DBConnect.getConn());
					 OrderDetails orderDetails = new OrderDetails();
					 
					 orderDetails.setOrder_id(orderId);
					 orderDetails.setCid(c.getCid());
					 orderDetails.setBid(c.getBid());
					 orderDetails.setUid(c.getUserId());
					 orderDetails.setBookName(c.getBookName());
					 orderDetails.setImage(c.getImage());
					 orderDetails.setAuthor(c.getAuthor());
					 orderDetails.setQuantity(c.getQuantity());
					 orderDetails.setPrice(c.getPrice());
					 orderDetails.setTotal_price(c.getTotalPrice());
					 
					 addOrderDetails = dao3.addOrderDetails(orderDetails) ; 
					 
					}
					 
					if (f && addOrderDetails) {
						boolean deleteCart = dao.deleteCart();
						
						session.setAttribute("succOrder", "Add Order Success ");
						resp.sendRedirect("order_success.jsp");  
					}else {
						session.setAttribute("failedOrder", "Your Order Failed");
						resp.sendRedirect("checkout.jsp");
						  
					}
				}
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
