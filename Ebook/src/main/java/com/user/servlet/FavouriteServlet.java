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
import com.entity.Favourite;

@WebServlet("/favourite")
public class FavouriteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
				req.setCharacterEncoding("UTF-8");
				resp.setCharacterEncoding("UTF-8");
				
//          LAY DU LIEU TU FORM
			int uid = Integer.parseInt(req.getParameter("uid"));
			int bid = Integer.parseInt(req.getParameter("bid"));

//			LAY SACH VOI ID NHAN VAO
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bid);
 
			
//			THAY DOI GIA TRI TRONG GIO HANG
			Favourite favou = new Favourite();
			favou.setUid(uid);
			favou.setBid(bid); 
			favou.setBookName(b.getBookName());
			favou.setAuthor(b.getAuthor()); 
			favou.setPrice(b.getPrice()); 
			favou.setBookCategory(b.getBookCategory());
			favou.setStatus(b.getStatus());
			favou.setPhotoName(b.getPhotoName()); 

//			THEM 1 SAN PHAM VAO DANH SACH
			FavouriteDAOImpl dao2 = new FavouriteDAOImpl(DBConnect.getConn());
//			KIEM TRA XEM SACH DA DUOC THEM VAO CSDL HAY CHUA 
			boolean checkExist = dao2.checkFavourite(bid, uid);
			
			HttpSession session = req.getSession();
			
			if (checkExist) { // NEU TRUE => CO THEM SO LUONG SAN PHAM TRONG CSDL 
						session.setAttribute("failedMsg", "The product has been added to favorites ");
						resp.sendRedirect("index.jsp");
				 
			} else {
				boolean f = dao2.addFavourite(favou);
   
//			KIEM TRA
				if (f) {
					session.setAttribute("succMsg", "Product added to favorites");
					resp.sendRedirect("favourite.jsp"); 
				} else {
					session.setAttribute("failedMsg", "Something Wrong On Server");
					resp.sendRedirect("index.jsp"); 
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
