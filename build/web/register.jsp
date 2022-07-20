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
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">BLOGS <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                
                                <li><a href="login.jsp">LOGIN</a></li>

                                <li><a href="register.jsp">REGISTER</a></li>

                                
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

        <!-- start:register -->
        <div id="register-alt">
            <div class="container">
                <div class="box-register">
                    <form action="Register" method="post">
                        <div class="text-center">
                            <h3>Register a new account</h3>
                            <small>Already Signed Up? Click <a href="login.jsp">Sign In</a> to login your account.</small>
                        </div>
                        <hr>
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" name="fname" class="form-control" placeholder="First Name">
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" name="lname" class="form-control" placeholder="Last Name">
                        </div>
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="uname" class="form-control" placeholder="User Name">
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" name="email" class="form-control" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <label>Mobile No</label>
                            <input type="number" name="mob" class="form-control" placeholder="Mobile">
                        </div>
                        <div class="form-group row">
                            <div class="col-md-6">
                                <label>Password</label>
                                <input class="form-control" type="password" name="upass" placeholder="Password">
                            </div>
                            <div class="col-md-6">
                                <label>Password Confirmation</label>
                                <input class="form-control" type="password" name="cupass" placeholder="Password">
                            </div>
                        </div>
                        <hr>
                        <!--					<div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox"> I read <a href="#">Terms and Conditions</a>
                                                                    </label>
                                                                </div>-->
                        <div class="form-group">
                            <button class="btn btn-warning btn-block">LOGIN</button>
                        </div>
                    </form>
                    <%
                        String msg = request.getParameter("ms");

                        if (msg != null) {

                            int mg = Integer.parseInt(msg);

                            if (mg == 2) {
                                %><hr><div><h5> Guest Register not Successfully!!!</h5></div><%
                            }
                            
                        }
                    %>
                </div>
            </div>
        </div>
        <!-- end:register -->

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