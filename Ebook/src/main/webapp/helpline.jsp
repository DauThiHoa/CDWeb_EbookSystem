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
 
<title>Ebook: Setting - HelpLine</title>

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
	User u = (User) session.getAttribute("userobj");
	%>
	
	
	<div class="container">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-success">
					<i class="fas fa-phone-square-alt fa-5x"></i>
				</div>
				<h3>24*7 Service</h3>
				<h4>Help Line Number</h4>
				<h5>+0671 869899023</h5>
				<a href="index.jsp" class="btn btn-primary">Home</a>
			</div>
		</div>

	</div>


	<%@include file="all_component/footer.jsp"%>

</body>
</html>