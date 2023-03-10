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

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon2.png" type="image/png" class="icon">
 
<title>Ebook: Setting - OrderBook</title>

<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.back-img {
	background: url("img/bak.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>

</head>
<body style="background-color: #f7f7f7;">

	<%@include file="all_component/navbar.jsp"%>

	<%
	User u1 = (User) session.getAttribute("userobj");
	%>
	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="container p-1" style="margin-top: 10%">
		<h1 class="text-center text-primary">Your Order</h1>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col"><h3>Order Id</h3></th>
					<th scope="col"><h3>Name</h3>  </th>
					<th scope="col"><h3>Book Name</h3> </th>
					<th scope="col"><h3>Author</h3> </th>
					<th scope="col"><h3>Price</h3> </th>
					<th scope="col"><h3>Payment Type</h3> </th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
				List<Book_Order> blist = dao.getBook(u.getEmail());
				for (Book_Order b : blist) {
				%>
				<tr>
					<th scope="row"><h4><%=b.getOrderId()%></h4> </th>
					<td><h4><%=b.getOrderId()%></h4> </td>
					<td><h4><%=b.getBookName()%></h4> </td>
					<td><h4><%=b.getAuthor()%></h4> </td>
					<td><h4><%=b.getPrice()%></h4> </td>
					<td><h4><%=b.getPaymentType()%></h4> </td>

				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>