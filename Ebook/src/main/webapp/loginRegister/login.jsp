<%@page import="com.entity.User"%>
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
<!-- BIEU TUONG TRANG WEB -->
 <link rel="icon" href="img/icon1.png" type="image/png" class="icon">
 
<title>EBook: Login</title> 

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link href="styleLoginRegister.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</head>
<body>

<%
	User u = (User) session.getAttribute("userobj");
	%>
	
	
	<div class="container infinity-container">
		<div class="row">
			<div class="col-md-1 infinity-left-space"></div>

			<!-- FORM BEGIN -->
			<div
				class="col-lg-10 col-md-10 col-sm-12 col-xs-12 text-center infinity-form">
				<!-- Company Logo -->
				<div class="text-center mb-3 mt-5">
					<img src="logo.png" width="150px">
				</div>
				<div class="text-center mb-4">
					<h4>Login into account</h4>
				</div>



<c:if test="${not empty failedMsg }">
							<h5 class="text-center text-danger">${failedMsg }</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h5 class="text-center text-success">${succMsg }</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						
				<!-- Form -->
				<form action="login" method="post"  class="px-3">
					<!-- Input Box -->
					<div class="form-input">
						<span><i class="fa fa-envelope"></i></span> <input type="email"
							 id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email" placeholder="Email Address" tabindex="10" required>
					</div>
					<div class="form-input">
						<span><i class="fa fa-lock"></i></span> <input type="password"
							id="exampleInputPassword1"
									required="required" name="password" placeholder="Password" required>
					</div>
					<div class="row mb-3">
						<!-- Remember Box -->
						<div class="col-auto d-flex align-items-center">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input" id="cb1">
								<label class="custom-control-label" for="cb1">Remember
									me</label>
							</div>
						</div>
					</div>
					<!-- Login Button -->
					<div class="mb-3">
						<button type="submit" class="btn btn-block">Login</button>
					</div>
					<div class="text-right ">
						<a href="reset.jsp" class="forget-link">Forgot password?</a>
					</div>
					<div class="text-center mb-2">
						<div class="text-center mb-3" style="color: #777;">or login
							with</div>

						<!-- Facebook Button -->
						<a href="" class="btn btn-social btn-facebook"><i
							class="fa fa-facebook"></i></a>

						<!-- Google Button -->
						<a href="" class="btn btn-social btn-google"><i
							class="fa fa-google"></i></a>

						<!-- Twitter Button -->
						<a href="" class="btn btn-social btn-twitter"><i
							class="fa fa-twitter"></i></a>
					</div>
					<div class="text-center mb-5" style="color: #777;">
						Don't have an account? <a class="register-link"
							href="register.jsp">Register here</a>
					</div>
				</form>
			</div>
			<!-- FORM END -->

			<div class="col-md-1 infinity-right-space"></div>
		</div>
	</div>

</body>
</html>
