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
 
<title>Ebook: Setting - SellBook</title>

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
	
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	
	
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>


 
				
			
<section class="contact" style="margin-top: 6%; width: 50%; margin-left: 25% ">

    
    <div class="row">

        <form action="add_old_book" method="post" enctype="multipart/form-data">
        
            <h3  class="text-center text-success" style="font-weight: bold;">Sell Old Book</h3>
            
                        <c:if test="${not empty failedMsg }">
							<h4 class="text-center text-danger">${failedMsg }</h4>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						 
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						 
						<input type="hidden" value="${userobj.email }" name="user">
						
						
			<div class="inputBox">    
          			 <h4 >Book Name</h4>  
            </div> 
            		
            <div class="inputBox" >   
			       <!-- <input style="width: 100%" placeholder="        " class="box"  
									aria-describedby="emailHelp"  required >  -->
									
									<input  style="width: 100%" class="box" 
									aria-describedby="emailHelp" required
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							 
            </div> 
            
			<br>
			<div class="inputBox">    
          			 <h4 >Author Name</h4>  
            </div>							
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							 
            </div> 
            
            <br>
			<div class="inputBox">    
          			 <h4 >Price</h4>  
            </div>	
             <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required type="number"
									name="price" type="double" class="form-control"
									id="exampleInputPassword1">
							 
            </div> 
             
             <br>
			<div class="inputBox">    
          			 <h4 >Upload Photo</h4>  
            </div>
              <div class="inputBox" >    
									
									<input  style="width: 100%" placeholder="" class="box" 
									aria-describedby="emailHelp" required
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							 
            </div> 
            
            <button type="submit" value="Send message" class="btn" style="margin-left: 80%; font-weight: bold;">Sell</button>
            
        </form>
 
   
    </div>

</section>




<%-- 
 
	<div class="container"  style="margin-top: 10%" >
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-body">
					<h1 class="text-center text-primary p-1">Sell Old Book</h1>
					
						<c:if test="${not empty succMsg }">
							<h4 class="text-center text-success">${succMsg }</h4>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<c:if test="${not empty failedMsg }">
							<h4 class="text-center text-danger">${failedMsg }</h4>
							<c:remove var="failedMsg" scope="session" />
						</c:if>
						
						
						<form action="add_old_book" method="post"
							enctype="multipart/form-data">

							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group ">
								<h4 for="exampleInputEmail1">Book Name*</h4><input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>


							<div class="form-group">
								<h4 for="exampleInputEmail1">Author Name*</h4><input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<h4 for="exampleInputPassword1">Price*</h4><input
									name="price" type="double" class="form-control"
									id="exampleInputPassword1">
							</div>


							<div class="form-group">
								<h4 for="exampleFormControlFile1">Upload Photo</h4>
								<input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Sell</button>

						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
 --%>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>