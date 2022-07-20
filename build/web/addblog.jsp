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
<%
String uid=session.getAttribute("uid").toString();
session.setAttribute("uid", uid);
%>
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
                    <a class="navbar-brand" href="author.jsp"><strong><i class="fa fa-sun-o"></i> AUTHOR.</strong></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="author.jsp">HOME</a></li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">BLOGS <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="addblog.jsp">ADD BLOG</a></li>
                                <li><a href="editblog.jsp">EDIT BLOG</a></li>

                                <li><a href="removeblog.jsp">REMOVE BLOG</a></li>

                                <li><a href="viewblog.jsp">VIEW BLOG</a></li>
                            </ul>
                        </li>
                        <li class="navbar-right"><a href="index.jsp">LOGOUT</a></li>


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
                    <form action="Addblog" method="post" enctype="multipart/form-data">
                        
                        <div class="text-center">
                            <h3>ADD NEW BLOG</h3>

                        </div>
                        <hr>
                        <div class="form-group">
                            <label>Title</label>
                            <input type="text" name="title" class="form-control" placeholder="Blog Title" required>
                        </div>
                        <div class="form-group">
                            <label>Upload Image</label>
                            <input type="file" name="bimg" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" name="uname" class="form-control" placeholder="User Name" required>
                        </div>
                        <div class="form-group">
                            <label>Date</label>
                            <input type="date" name="bdate" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Categories</label>
                            <input type="text" name="fol" class="form-control" placeholder="Categories Name" required>
                        </div>

                        <div class="form-group">
                            <label>Tag</label>
                            <input type="text" name="tag" class="form-control" placeholder="Tag Name" required>
                        </div>

                        <div class="form-group">
                            <label>Message</label>
                            <textarea class="form-control" name="message" rows="8" placeholder="Messages.."></textarea>
                        </div>

                        <hr>

                        <div class="form-group">
                            <button class="btn btn-warning btn-block">ADD BLOG</button>
                        </div>
                    </form>
                    <%
                        String msg = request.getParameter("ms");

                        if (msg != null) {

                            int mg = Integer.parseInt(msg);

                            if (mg == 2) {
                                %><hr><div><h5> Blog Added Successfully!!!</h5></div><%
                            }else{
                                %><hr><div><h5> Blog Added Not Successfully!!!</h5></div><%
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