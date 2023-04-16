package com.user.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CommentDAO;
import com.DAO.CommentDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.CommentProduct;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/commentProduct")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/* doGet(request, response); */
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			int bid = Integer.parseInt( request.getParameter("bid") );
			int uid = Integer.parseInt( request.getParameter("uid") );
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String content = request.getParameter("content"); 
		
		System.out.println(name +" - "+ email +" - "+ content); 
		
		long millis=System.currentTimeMillis();   
		java.sql.Date date=new java.sql.Date(millis);   
		java.sql.Time time=new java.sql.Time(millis);  
		
		String dateTime = date + " " + time ;
		System.out.println(date + " - " + time); 
		
//		THAY DOI GIA TRI TRONG DOI TUONG COMMENT
		CommentProduct c = new CommentProduct();
		c.setBid(bid);
		c.setUid(uid);
		c.setName(name);
		c.setEmail(email);
		c.setDate(dateTime);
		c.setContent(content);
		
		CommentDAO dao = new CommentDAOImpl(DBConnect.getConn());
		boolean check = dao.addCommentProduct(c);  
		HttpSession session = request.getSession();
		 
		 
		if (check) {
			session.setAttribute("succComment", "Comment Product Details Successfully ... ");
			response.sendRedirect("view_books.jsp?id=" + bid); 
 
		} else {
			session.setAttribute("failedComment", "Something Wrong On Server");
			response.sendRedirect("view_books.jsp?id=" + bid); 
 
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}

}
