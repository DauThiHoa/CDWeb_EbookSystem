<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Edit Books</title>


<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Edit Books</h4>


						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b = dao.getBookById(id);
						%>

						<form action="../editbooks" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
						
						
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label><input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label><input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label><input
									name="price" type="double" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<%
									if ("Active".equals(b.getStatus())){
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<%
									}
									%>
									 
								</select>
							</div>

							<!-- <div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label><input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div> -->

							<button type="submit" class="btn btn-primary">Update</button>

							<!-- <div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>-- select --</option>
									<option value="New">New Book</option>
								</select>
							</div> -->

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  End Old Book-->
	<div style="margin-top: 150px">
		<%@include file="footer.jsp"%></div>

</body>
</html>