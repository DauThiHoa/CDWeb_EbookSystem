<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>FOOD WEBSITE</title>
<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="../img/icon2.png" type="image/png" class="icon">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css"> -->

<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script> -->

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">


</head>
<body>

	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<%-- <c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if> --%>


	<!-- header section starts  -->

	<header class="header">

		<!--  logo -->
		<a href="index.jsp" class="logo"> <span><img alt=""
				style="width: 20%; height: 20%" src="img/icon1.png"></span> EBOOK
		</a>

		<!--  THANH menu  -->
		<nav style="margin-left: -9%" class="navbar">
			<a href="index.jsp">home</a> 
			<a href="shop.jsp">shop</a> 

			<!-- <div class="btn-group">
				<button type="button" class="btn btn-secondary dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					shop</button>
				<div class="dropdown-menu dropdown-menu-right">
					<button class="dropdown-item" type="button">Action</button>
					<button class="dropdown-item" type="button">Another action</button>
					<button class="dropdown-item" type="button">Something else
						here</button>
				</div>
			</div> -->

			<a href="about.jsp">about</a> 
			<a href="review.jsp">review</a>
			<a href="blog.jsp">blog</a> 
			<a href="contact.jsp">contact</a> 
		</nav>



		<c:if test="${not empty userobj }">

			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons">
				<div id="menu-btn" class="fas fa-bars"></div>
				<div id="search-btn" class="fas fa-search"></div>

				<a href="checkout.jsp">
					<div id="cart-btn" class="fas fa-shopping-cart"></div>
				</a> <a href="login.jsp">
					<div id="login-btn" class="fas fa-user"></div>


				</a> <a href="logout">
					<div id="login-btn" class="fas fa-sign-in-alt"></div>
				</a> <a href="setting.jsp">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
			</div>
			
		</c:if>


		<c:if test="${empty userobj }">

			<!-- CAC ICON SEARCH - LOGIN  -->
			<div class="icons">
				<div id="menu-btn" class="fas fa-bars"></div>
				<div id="search-btn" class="fas fa-search"></div>

				</a> <a href="login.jsp">
					<div id="login-btn" class="fas fa-user"></div>
				</a> <a href="register.jsp">
					<div id="login-btn" class="fas fa-user-plus"></div>
				</a> <a href="setting.jsp">
					<div id="login-btn" class="fas fa-cog"></div>
				</a>
			</div>
		</c:if>


		<!--  SEARCH -->
		<form action="search.jsp" method="post" class="search-form">
			<input type="search" placeholder="Search here..." id="search-box"
				name="ch" aria-label="Search">
			<!-- <label for="search-box" class="fas fa-search" id="search" type="submit"></label> -->
			<button class="btn btn-success my-2 my-sm-0" id="search"
				type="submit" style="margin-left: -5%">Search</button>
		</form>



	</header>





	<!-- header section ends -->

	<!-- custom css file link  -->
	<script src="js/script.js"></script>
	<script src="js/script1.js"></script>


</body>
</html>
