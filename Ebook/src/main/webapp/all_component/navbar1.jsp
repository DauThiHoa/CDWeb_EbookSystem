<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#search" ).autocomplete({
      source: availableTags
    });
  } );
  </script>
</head>
<body>
 


	<div class="container-fluid"
		style="height: 10px; background-color: #303f9f"></div>


	<div class="container-fluid p-3 bg-light">
		<div class="row">
			<div class="col-md-3 text-success">
				<h3>
					<i class="fas fa-book"></i> Ebooks
				</h3>
			</div>
			
			
			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0" action="search.jsp"
					method="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" id="search"
						type="submit">Search</button>
				</form>
			</div>
			

			<c:if test="${not empty userobj }">
				<div class="col-md-3">

					<a href="checkout.jsp"><i class="fas fa-cart-plus fa-2x"></i></a> 
					
					<a
						href="login.jsp" class="btn btn-success"><i
						class="fas fa-user-plus"></i>${userobj.name }</a> 
						
						<a href="logout"
						class="btn btn-primary text-white"><i
						class="fas fa-sign-in-alt"></i>Logout</a>
				</div>
			</c:if>

			<c:if test="${empty userobj }">
				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-success"><i
						class="fas fa-sign-in-alt"></i>Login</a>
						 <a href="register.jsp"
						class="btn btn-primary text-white"><i class="fas fa-user-plus"></i>Register</a>
				</div>
			</c:if>


		</div>
	</div>





	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">

		<a class="navbar-brand" href="#"><i class="fa fa-home"></i></a>


		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">

				<!-- 		  <a class="navbar-brand" href="#"><i class="fa fa-home"></i>Home</a>
 -->

				<li class="nav-item active"><a class="nav-link"
					href="index.jsp"> Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_recent_book.jsp"><i class="fas fa-book-open"></i>Recent
						Book</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_new_book.jsp"><i class="fas fa-book"></i>New Book</a></li>



				<li class="nav-item active"><a class="nav-link disabled"
					href="all_old_book.jsp"><i class="fas fa-book"></i>Old Book</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="setting.jsp" class="btn btn-light my-2 my-sm-0"
					type="submit"> <i class="fas fa-cog"></i>Setting
				</a>
				<button class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
					<i class="fas fa-phone-square-alt"></i>Contact Us
				</button>
			</form>
		</div>
	</nav>
 
 
 </body>
</html>