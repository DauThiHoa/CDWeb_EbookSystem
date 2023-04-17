<%@page import="com.entity.OrderDetails"%>
<%@page import="com.DAO.OrderDetailsDAOImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : All Orders</title>

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	
	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<h3 class="text-center p-3">Hello Admin</h3>


	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Order Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Ph No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		
		
				<%
			 
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getAllOrder();
				for (Book_Order b : blist) {
					 OrderDetailsDAOImpl dao1 = new OrderDetailsDAOImpl (DBConnect.getConn());
					 OrderDetails bookOrder = dao1.getOrderDetailsById(b.getOrderId());
				%>
				<tr>
				
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getEmail()%></td>
					<td><%=b.getFulladd()%></td>
					<td><%=b.getPhno()%></td>
					<td><%=bookOrder.getBookName()%></td>
					<td><%=bookOrder.getAuthor()%></td>  
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>

				</tr>
				<%
				}
				%>
				
			 
		</tbody>
	</table>


</body>
</html>