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
 
<title>Ebook: Setting - OldBook</title>
<%@include file="all_component/allCss.jsp"%>

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

	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->


	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>


	<c:if test="${ not empty succMsg }">
		<div class="alert alert-success textcenter">${succMsg }</div>
		<%-- <p class="text-center text-success">${succMsg }</p> --%>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${ not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg }</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>



	<%-- <div class="container p-5" style="margin-top: 8%">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col"><h3>Book Name</h3> </th>
					<th scope="col"><h3>Author</h3> </th>
					<th scope="col"><h3>Price</h3>   </th>
					<th scope="col"><h3>Category</h3> </th>
					<th scope="col"><h3>Action</h3> </th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getBookByOld(email, "Old");
				for (BookDtls b : list) {
				%>
				<tr>
					<th><h4><%=b.getBookName()%></h4> </th>
					<td><h4><%=b.getAuthor()%></h4> </td>
					<td><h4><%=b.getPrice()%></h4> </td>
					<td><h4><%=b.getBookCategory()%></h4> </td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div> --%>



 

	<div class="container " style="margin-top: 8%">
		<!-- <div class="row"> -->
			<div class=""> 
				<div class="card bg-white"  >
					<div class="card-body">
					
					<h1 class="text-center text-success" style="font-weight: bold;">Your Selected Item</h1>
					 
					<c:if test="${not empty succMsg }">
						<div class="text-center alert alert-success" role="alert">${succMsg }</div>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty failedMsg }">
						<div class="text-center alert alert-danger text-center" role="alert">${failedMsg }</div>
						<c:remove var="failedMsg" scope="session" />
					</c:if>

<br><br>
					<table class="table table-striped">
					
							<thead>
								<tr>
									<th scope="col"><h2>Image</h2></th>
									<th scope="col"><h2>Book Name</h2> </th>
									<th scope="col"><h2>Author</h2> </th> 
									<th scope="col"><h2>Price</h2> </th>
									<th scope="col"><h2>Category</h2> </th>
									<th scope="col"><h2>Action</h2> </th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								String email = u.getEmail();
								BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
								List<BookDtls> list = dao.getBookByOld(email, "Old");
								for (BookDtls b : list) {
								%>

								<tr  >
									<th  scope="row"><img alt="" src="book/<%=b.getPhotoName()%>"
										style="width: 100px; height: 120px"></th>
									<th scope="row"><h3 style="margin-top: 16%"><%=b.getBookName()%></h3></th>
									<td><h3 style="margin-top: 25%"><%=b.getAuthor()%></h3></td> 

									<td><h3 style="margin-top: 53%"><%=b.getPrice()%></h3></td>
									<td><h3 style="margin-top: 29%"><%=b.getBookCategory()%></h3></td>
									<td> 
										<a style="margin-top: 25%; background: red"
						 				href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>"
										class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i></a>
										
										</td>
								</tr>

								<%
								}
								%> 

							</tbody>
						</table>
					</div>
				</div>
			</div>
			</div>
			 
			
	<%@include file="all_component/footer.jsp"%>
</body>
</html>