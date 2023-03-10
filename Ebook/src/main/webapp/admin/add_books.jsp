<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : Add Books</title>


<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/favicon.png" type="image/png" class="icon">
 
 
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="text-center">Add Books</h4>
						
						
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label><input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label><input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label><input
									name="price" type="double" class="form-control"
									id="exampleInputPassword1">
							</div>


							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>-- select --</option>
									<option value="New">New Book</option>
									
									<option value="Foreign language books">Foreign language books</option>
									<option value="Literature">Literature</option>
									<option value="Life skills book">Life skills book</option>
									<option value="Book of art - architecture">Book of art - architecture</option>
									<option value="Medicine & sport books">Medicine & sport books</option>
								</select>
							</div>


							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>-- select --</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label><input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Add</button>

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