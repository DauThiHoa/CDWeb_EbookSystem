<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img p-5">
	<!-- text-success  -->
		<h2 class="text-center text-orange">EBook Management System</h2>
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
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>

						<%
						} else {
						%>
						Categories:
						<%=b2.getBookCategory()%></p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a> <a href=""
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
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-while">View All</a>
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
							<a href="" class="btn btn-danger btn-sm"><i
								class="fas fa-cart-plus"></i>Add Cart</a> <a href=""
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
		<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-while">View All</a>
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
							<a href="" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b2.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
 
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>

	<!--  End Old Book-->

	<%@include file="all_component/footer.jsp"%>


</body>
</html>