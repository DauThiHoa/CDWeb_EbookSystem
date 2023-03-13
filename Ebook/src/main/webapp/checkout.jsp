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

<!-- BIEU TUONG TRANG WEB -->
<link rel="icon" href="img/icon2.png" type="image/png" class="icon">

<title>EBook: Cart Page</title>



<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<!-- <link rel="stylesheet" href="css/style1.css">
<link rel="stylesheet" href="css/style.css">  -->

<script>
  
</script>

<%@include file="all_component/allCss.jsp"%>
</head>

<!-- AJAX - Update Quantity -->



<body style="background-color: #f0f1f2;">

	 <%@include file="all_component/navbar.jsp"%> 



	<!--  --------------------------------------DO LOI NAY-------------------------------------------->
	<!--  PHUONG THUC BAT BUOC PHAI DANG NHAP ADMIN MOI VAO DC-->



	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>

	<!--  HIEN THI THONG BAO XOA SAN PHAM TRONG GIO HANG HAY CHUA-->


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>



	<div class="container " style="margin-top: 8%">
		<div class="row">
			<div class="col-md-6"> 
				<div class="card bg-white" style="width: 125%; margin-left: -25%">
					<div class="card-body">
						<table class="table table-striped">
						
						<h1 class="text-center text-success">Your Selected Item</h1>
							<thead>
								<tr>
									<th scope="col">Image</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Quantity</th>
									<th scope="col">Price</th>
									<th scope="col">Total</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.0;
								for (Cart c : cart) {
									totalPrice += c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><img alt="" src="book/<%=c.getImage()%>"
										style="width: 50px; height: 65px"></th>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>

									<td>
										<form action="updateQuantity" method="get">
											<input name="quantity" type="number"
												value="<%=c.getQuantity()%>"
												style="width: 50%; text-align: center;"> <input
												type="hidden" name="bid" value="<%=c.getBid()%>"> <input
												type="hidden" name="uid" value="<%=c.getUserId()%>"> <input
												type="hidden" name="cid" value="<%=c.getCid()%>">
										</form>
									</td>

									<td><%=c.getPrice()%></td>
									<td><%=c.getTotalPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card" style="width: 125%; margin-right: -25%">
					<div class="card-body ">
						<h1 class="text-center text-success">Your Details For Order</h1>
						<form action="order" method="post">
							<input type="hidden" value="${userobj.id }" name="id">


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="${userobj.name }"
										name="username" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4"
										value="${userobj.email }" name="email" required>
								</div>
							</div>


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4"
										value="${userobj.phno }" name="phno" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4"
										value="${userobj.address }" name="address" required>
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4"
										value="<%=u.getLandmark()%>" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4"
										value="<%=u.getCity()%>" name="city" required>
								</div>
							</div>




							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4"
										value="<%=u.getState()%>" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input type="text"
										class="form-control" id="inputPassword4"
										value="<%=u.getPincode()%>" name="pincode" required>
								</div>
							</div>


							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">--- Select ---</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center text-white">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success"> Continue
									Shopping</a>
							</div>


						</form>
					</div>
				</div>
			</div>
			
			
			

		</div>
	</div>

<%@include file="all_component/footer.jsp"%>

	<script type="text/javascript">
 
function edit_Quantity()() {
	alert("editQuantity");
}


</script>


</body>

</html>