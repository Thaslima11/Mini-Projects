<%@page import="java.sql.*"%>
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
					<li class="active"><a href="contact.jsp">CONTACT</a></li>

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
        
                <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from blog");


        %>
	<!-- start:main -->
	<div id="main">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<!-- start:main contact -->
					<div id="main-contact">
						<div class="maps">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63245.97055414073!2d110.37484495!3d-7.803250449999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e7a5787bd5b6bc5%3A0x21723fd4d3684f71!2sYogyakarta!5e0!3m2!1sen!2s!4v1404127909069" width="100%" height="350" frameborder="0" style="border:0"></iframe>
						</div>
						<div class="content-contact">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-contact">
										<h3 class="title-form-contact">
											<span>//</span> SEND ME YOUR MESSAGE
										</h3>
										<form role="form">
											<div class="row">
												<div class="form-group col-md-4">
													<input class="form-control input-lg" placeholder="Name..">
												</div>
												<div class="form-group col-md-4">
													<input class="form-control input-lg" placeholder="Email..">
												</div>
												<div class="form-group col-md-4">
													<input class="form-control input-lg" placeholder="Phone..">
												</div>
												<div class="form-group col-md-12">
													<textarea class="form-control" rows="8" placeholder="Messages.."></textarea>
												</div>
												<div class="form-group col-md-12">
													<button class="btn btn-lg btn-default">SEND ME</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<!-- end:main contact -->
				</div>
				<div class="col-lg-4 col-md-4">
                        <!-- start:sidebar -->
                        <div id="sidebar">
                            <!-- start:widget recent post -->
                            <div class="widget-sidebar">
                                <h3 class="title-widget-sidebar">
                                    // RECENT POST
                                </h3>
                                <div class="content-widget-sidebar">

                                    <ul>
                                        <%                                             
                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery("select * from blog ORDER BY bdate DESC");
                                            int count=0;
                                            while (rs1.next()) {
                                                if(count>=4){
                                                    break;
                                                }
                                        %>
                                        <li class="recent-post">
                                            <div class="thumbnail">
                                                <img src="img/content/<%=rs1.getString("bimage")%>" class="img-responsive">
                                            </div>
                                            <a href="blog1.jsp?bid=<%=rs1.getString("bid")%>"><h5><%=rs1.getString("title")%></h5></a>
                                            <p><small><i class="fa fa-calendar"></i><%=rs1.getString("bdate")%></small></p>
                                        </li>
                                        <hr>
                                        <%
                                            }

                                        %>
                                    </ul>
                                </div>
                            </div>
                            <!-- end:widget recent post -->
                            
                            <!-- start:categories -->
                            <div class="widget-sidebar">
                                <h3 class="title-widget-sidebar">
                                    // CATEGORIES
                                </h3>
                                <div class="content-widget-sidebar">
                                    <ul>
                                        <%                                             
                                            Statement st2 = con.createStatement();
                                            ResultSet rs2 = st2.executeQuery("select distinct categories from blog");
                                            
                                            while (rs2.next()) {
                                                
                                        %>
                                        <li class="categories">
                                            <a href="#">
                                                <h5><i class="fa fa-angle-double-right"></i><%=rs2.getString("categories")%></h5>
                                            </a>
                                        </li>
                                        <hr>
                                        <%
                                            }

                                        %>
                                        
                                    </ul>
                                </div>
                            </div>
                            <!-- end:categories -->
						
					</div>
					<!-- end:sidebar -->
				</div>
			</div>
		</div>
	</div>
	<!-- end:main -->
        <%    } catch (Exception e) {
                e.printStackTrace();
            }
        %>
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
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/blog.js"></script>
	<!-- end:javascript -->

</body>


</html>	