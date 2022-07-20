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
 <%
            String uid = session.getAttribute("uid").toString();
            session.setAttribute("uid", uid);

            String bid = request.getParameter("bid");
            if (bid != null) {
                session.setAttribute("bid", bid);
            }
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");


        %>
        <!-- start:main -->
        <div id="main">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <!-- start:content -->
                        <div id="content">
                            <div class="row">
                                <%                                    
                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("select * from blog ORDER BY bdate DESC");
                                    while (rs.next()) {
                                %>
                                <div class="col-lg-6 col-md-6">
                                    <aside>
                                        <img src="img/content/<%=rs.getString("bimage")%>" class="img-responsive">
                                        <div class="content-title">
                                            <div class="text-center">
                                                <h3><a href="blog.jsp?bid=<%=rs.getString("bid")%>" ><%=rs.getString("title")%></a></h3>
                                            </div>
                                        </div>
                                        <div class="content-footer">
                                            <img src="img/user/user.jpg">
                                            <span><%=rs.getString("username")%></span>
                                            <span class="pull-right">
                                                <a href="#"><i class="fa fa-comments" data-toggle="tooltip" data-placement="top" title="Comments"></i> <%=rs.getString("bcomment")%></a>
                                                <a href="#"><i class="fa fa-heart" data-toggle="tooltip" data-placement="top" title="Loved"></i> <%=rs.getString("blike")%></a>
                                            </span>
                                        </div>
                                    </aside>
                                </div>
                                <%
                                    }

                                %>
                            </div>
                        </div>
                        <!-- end:content -->
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
                                            <a href="blog.jsp?bid=<%=rs1.getString("bid")%>"><h5><%=rs1.getString("title")%></h5></a>
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