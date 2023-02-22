<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Ebook: Index </title>
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

	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">EBook Management System</h2>
	</div>

<%-- <% Connection conn = DBConnect.getConn();
  out.println (conn );%> --%>
<!--  Star Recent Book-->


	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		
		<div class="row">
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div class="text-center mt-1">
		<a href="" class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>
	
	<!--  End Recent Book-->
	<hr>
	
	
	<!--  Star New Book-->


	<div class="container">
		<h3 class="text-center">New Book</h3>
		
		<div class="row">
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<a href="" class="btn btn-danger btn-sm ml-2"><i class="fas fa-cart-plus"></i>Add Cart</a> <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div class="text-center mt-1">
		<a href="" class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>
	
	<!--  End New Book-->
	<hr>
	
	<!--  Star Old Book-->


	<div class="container">
		<h3 class="text-center">Old Book</h3>
		
		<div class="row">
		
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<!-- <a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>  -->
							<a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<!-- <a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a> -->
							 <a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<!-- <a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>  -->
							<a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/conCo.jpg"
							style="width: 100%; height: 170px" class="img-thumblin">
						<p>Stork</p>
						<p>Comic</p>
						<div class="row">
							<!-- <a href="" class="btn btn-danger btn-sm ml-3">Add Cart</a>  -->
							<a
								href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1">299</a>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div class="text-center mt-1">
		<a href="" class="btn btn-danger btn-sm text-while">View All</a>
		</div>
	</div>
	
	<!--  End Old Book-->
	
	<%@include file="all_component/footer.jsp"%>
	
	
</body>
</html>