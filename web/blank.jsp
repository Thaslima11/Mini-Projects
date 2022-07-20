<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>BMS</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	
</head>
<body>

	<!-- start:header -->
	<div id="header">
		<div class="overlay">
			<!-- start:header-top -->
			<div class="header-top">
				<div class="text-center">
					<div class="sosmed-header-top">
						
					</div>
				</div>
			</div>
			<!-- end:header-top -->
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-lg-offset-4 col-md-4">
						<div class="text-center">
							<div class="user">
								<img src="img/user/user.jpg">
							</div>
							<div class="slide-header">
								<h1>BLOG MANAGEMENT SYSTEM</h1>
								<div id="owl-header" class="owl-carousel owl-theme">
	 
								  	<div class="item"><h4>You get to tell everyone what you really think</h4></div>
								  	<div class="item"><h4>You polarize, which attracts attention</h4></div>
								  	<div class="item"><h4>a truncation of the expression weblog</h4></div>
								  	<div class="item"><h4>History of blogging and online diary</h4></div>
								 
								</div>
							</div>
							<div class="button-down">
								<i class="fa fa-angle-double-down"></i>
							</div>		
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end:header -->

	<!-- start:navbar -->
	<nav class="navbar navbar-default navbar-static-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><strong><i class="fa fa-sun-o"></i> BLOG.</strong></a>
			</div>
		
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">HOME</a></li>
                                        <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">BLOGS <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="login_aut.jsp">Author</a></li>
							<li><a href="login.jsp">Guest</a></li>
							
							<li><a href="register.jsp">New Guest</a></li>
							
							<li><a href="blank.jsp">BLANK PAGE</a></li>
						</ul>
					</li>
					<li><a href="contact.jsp">CONTACT</a></li>

					
				</ul>
				<form class="navbar-form navbar-right" role="search">
					<div class="input-group">
				      	<input type="text" class="form-control" placeholder="Search">
				      	<span class="input-group-btn">
				        	<button class="btn btn-default" type="button">Go!</button>
				      	</span>
				    </div>
				</form>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
	<!-- end:navbar -->
        
	<!-- start:blank page -->
	<div id="blank-page">
		<div class="container">
			<div class="box-blank-page">
				<p>This is blank page.</p>
			</div>
		</div>
	</div>
	<!-- end:blank page -->

	<!-- start:footer bottom -->
	<div class="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<p>Copyright©2016</p>
				</div>
				<div class="col-lg-4">
					<p class="pull-right">
						<a href="index.jsp">HOME</a>
						
						<a href="contact.jsp">CONTACT US</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- end:footer bottom -->

	<!-- start:javascript -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- end:javascript -->

</body>


</html>