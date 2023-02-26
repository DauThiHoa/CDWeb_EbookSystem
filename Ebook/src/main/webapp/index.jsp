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

<title>Ebook: Index</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
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

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img p-5">
		<!-- text-success  -->
		<h2 class="text-center text-orange">EBook Management System</h2>
	</div>




	<div class="carousel-inner">
		<c:forEach var="item" items="4" varStatus="index">

			<c:if test="${index.first }">
				<div class="item active">
			</c:if>
			<c:if test="${not index.first }">
				<div class="item">
			</c:if>

		</c:forEach>
		<div class="item active">
			<img style="width: 100%" alt="bootstrap ecommerce templates"
				src="img/slide/backBook1.jpg">
			<div class="carousel-caption">
				<h4>Twitter Bootstrap cart</h4>
				<p>
					<span>Very easy to integrate and expand</span>
				</p>
			</div>
		</div>
	</div>



	<%-- <% Connection conn = DBConnect.getConn();
  out.println (conn );%> --%>
	<!--  Star Recent Book-->


	<div class="container">
		<h3 class="text-center">Recent Book</h3>


		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<img alt="" src="book/<%=b2.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">


						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>

							<%
							if (b2.getBookCategory().equals("Old")) {
							%>

							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?id=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Categories:
						<%=b2.getBookCategory()%></p>
						<div class="row">


							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add
								Cart</a>

							<%
							}
							%>

							<a href="view_books.jsp?id=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b2.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-3">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>

	<!--  End Recent Book-->
	<hr>


	<!--  Star New Book-->


	<div class="container">
		<h3 class="text-center">New Book</h3>

		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<!-- ml-1 -->

							<!-- NEU CHUA DANG NHAP VAO WEBSITE => KHONG CHO PHEP THEM VAO GIO HANG => DI CHUYEN VE TRANG LOGIN -->
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a>
							<%
							} else {
							%>
							<!--  NGUOC LAI NEU DA DANG NHAP VAO TAI KHOAN => DI CHUYEN DEN TRANG CARTSERVLET ( XU LY SU KIEN THEM SAN PHAM VAO GIO HANG )-->
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add
								Cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?id=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-0">View Details</a> <a href=""
								class="btn btn-danger btn-sm"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>


	</div>

	<div class="text-center mt-3">
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-while">View
			All</a>
	</div>
	</div>

	<!--  End New Book-->
	<hr>

	<!--  Star Old Book-->


	<div class="container">
		<h3 class="text-center">Old Book</h3>

		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b2 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b2.getPhotoName()%>"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthor()%></p>
						<p>
							Categories:
							<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?id=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-while">View
				All</a>
		</div>
	</div>

	<!--  End Old Book-->

	<%@include file="all_component/footer.jsp"%>


</body>
</html>