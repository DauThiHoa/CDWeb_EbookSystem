
<!-- 
	Trong bai co nhung => Chay bi loi
	 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
 
  
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script type="text/javascript" src="scripts/jquery-3.6.3.min.js"></script>
<script type="text/javascript" src="scripts/jquery-ajax.js"></script>


<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  --> 
<link rel="stylesheet" href="style.css">
 
 
 
 
  

<div class="container-fluid p-3 bg-light">
	<div class="row" style="margin-top: 0%;">
		<!-- <div class="col-md-3 text-success">
			<h3 style="color: black; font-weight: bold;">
				<i class="fas fa-book"></i > Ebooks
			</h3>
		</div> -->
 
  <!--  logo -->
  
 		<div class="col-md-3 text-success">
			<h3 style="color: black; font-weight: bold;">
				<span> <img alt="" style="width: 20%; height: 20%" src="../img/icon1.png"></span> 
				EBOOK
			</h3>
		</div>
		 

		<div class="col-md-3" style="margin-left: 85%; margin-top: -3%;">
			<c:if test="${not empty userobj }">

				<a class="btn btn-success text-white" style="font-weight: bold;">
				<i style="padding: 5px;" class="fas fa-user"></i>${userobj.name }</a>
				<a data-toggle="modal" data-target="#exampleModalCenter" style="font-weight: bold;"
					class="btn btn-primary text-white"><i style="padding: 5px;" 
					class="fas fa-sign-in-alt"></i>Logout</a>

			</c:if>
			<c:if test="${ empty userobj }">
				<a href="login.jsp" class="btn btn-success" style="font-weight: bold;"><i
					class="fas fa-sign-in-alt"></i>Login</a>
				<a href="../register.jsp" class="btn btn-primary text-white" style="font-weight: bold;"><i
					class="fas fa-user-plus"></i>Register</a>
			</c:if>
		</div>



	</div>
</div>

<!-- Begin Logout Modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do You Want Logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="font-weight: bold;background: green; " >Close</button>
					<a href="../logout" type="button"
						class="btn btn-primary text-white" style="font-weight: bold;background: green;">Logout</a>

				</div>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<!-- End Logout Modal -->



  <nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background: #27ae60;">

	<a class="navbar-brand" href="#"><i style="font-size: 140%;" class="fa fa-home"></i></a>


	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
 

			<li class="nav-item active"><a class="nav-link" href="home.jsp" style="font-weight: bold;">
					Home <span class="sr-only">(current)</span>
			</a></li>
 
		</ul>
 
	</div>
</nav>  
 
 	<script src="js/script.js"></script>
	<script src="js/script1.js"></script>
	
	