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

        <script type="text/javascript" language="javascript">
            function load(id1)
            {
                //alert("hi");
                var name = document.getElementById(id1).value;
                window.location.replace("blog1.jsp?reply=" + name);
                document.getElementById(id1).value = name;
            }
        </script>
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
                        <li><a href="guest.jsp">HOME</a></li>

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
            String rep = request.getParameter("reply");
            if (rep != null) {
                session.setAttribute("reply", rep);
            } else {
                rep = "0";
                session.setAttribute("reply", rep);
            }

            String bid = request.getParameter("bid");
            String uid = session.getAttribute("uid").toString();
            session.setAttribute("uid", uid);
            if(bid!=null){
                session.setAttribute("bid", bid);
            }else{
                bid = session.getAttribute("bid").toString();
                session.setAttribute("bid", bid);
            }

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "admin");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from blog where bid='" + bid + "'");


        %>
        <!-- start:single blog -->
        <div id="single-blog">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8">

                        <!-- start:single content -->
                        <div id="main-single-content">
                            <%                                
                        while (rs.next()) {

                            %>
                            <img src="img/content/<%=rs.getString("bimage")%>" class="img-responsive">
                            <div class="content-single">
                                <h2><%=rs.getString("title")%></h2>
                                <div class="tag">
                                    <p>	
                                        <span><i class="fa fa-user"></i> <%=rs.getString("username")%></span> 
                                        <i class="fa fa-circle"></i> 
                                        <span><i class="fa fa-calendar"></i><%=rs.getString("bdate")%></span>
                                        <i class="fa fa-circle"></i>
                                        <span><i class="fa fa-folder"></i> Uncategories, <%=rs.getString("categories")%></span>
                                        <i class="fa fa-circle"></i>
                                        <span><i class="fa fa-tag"></i> Acesories, <%=rs.getString("tag")%></span>
                                    </p>
                                </div>
                                <div class="hr-single"></div>
                                <p><%=rs.getString("message")%>.</p>
                                <div class="hr-single"></div>
                                <%
                                    }
                                    Statement st1 = con.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from userdata a, comment b where b.bid='" + bid + "' and b.reply='0'");


                                %>
                                <!-- start:comments -->
                                <div id="comments-list">
                                    <!-- start:comments list -->
                                    <div class="comment">
                                        <h3>Comments List</h3>
                                        <%                                                
                                    while (rs1.next()) {
                                        
                                        String aid1=rs1.getString("b.uid");
                                        String uname="";
                                        if(aid1.equals("0")){
                                            uname="admin";
                                        }else{
                                            uname=rs1.getString("a.username");
                                        }
                                        %>
                                        <ul class="comments">

                                            <li>
                                                <img src="img/user/user.jpg">

                                                <div class="post-comments">
                                                    <p class="meta"><%=rs1.getString("b.cdate")%> <a href="#"><%=uname%></a> says : <i class="pull-right"><a href="#form-comment" onclick="load(<%=rs1.getString("b.cid")%>)"><input type="hidden" id="<%=rs1.getString("b.cid")%>" name="<%=rs1.getString("b.cid")%>" value="<%=rs1.getString("b.cid")%>"/><small class="btn btn-xs btn-default">Reply</small></a></i></p>
                                                    <p>
                                                        <%=rs1.getString("b.message")%>
                                                    </p>
                                                </div>
                                            </li>


                                            <%
                                                Statement st2 = con.createStatement();
                                                ResultSet rs2 = st2.executeQuery("select * from userdata c, comment d where d.bid='" + bid + "' and d.reply='"+rs1.getString("b.cid")+"'");
                                                while (rs2.next()) {
                                                    String aid2=rs2.getString("d.uid");
                                                    String uname1="";
                                                    if(aid2.equals("0")){
                                                        uname1="admin";
                                                    }else{
                                                        uname1=rs2.getString("c.username");
                                                    }
                                        
                                            %>
                                            <ul class="comments hidden-xs list-unstyled">
                                                <li class="clearfix">
                                                    <img src="img/user/user.jpg" class="avatar" alt="danish personal blog and magazine template">
                                                    <div class="post-comments">
                                                        <p class="meta"><%=rs2.getString("d.cdate")%> <a href="#"><%=uname1%></a> says : <i class="pull-right"><a href="#form-comment" onclick="load(<%=rs2.getString("d.cid")%>)"><input type="hidden" id="<%=rs2.getString("d.cid")%>" name="<%=rs2.getString("d.cid")%>" value="<%=rs2.getString("d.cid")%>"/><small class="btn btn-xs btn-default">Reply</small></a></i></p>
                                                        <p>
                                                            <%=rs2.getString("d.message")%>
                                                        </p>
                                                    </div>
                                                    <%
                                                        Statement st3 = con.createStatement();
                                                        ResultSet rs3 = st3.executeQuery("select * from userdata e, comment f where f.bid='" + bid + "' and f.reply='"+rs2.getString("d.cid")+"'");
                                                        while (rs3.next()) {
                                                            String aid3=rs3.getString("f.uid");
                                                            String uname2="";
                                                            if(aid3.equals("0")){
                                                                uname2="admin";
                                                            }else{
                                                                uname2=rs3.getString("e.username");
                                                            }
                                                    %>
                                                    <ul class="comments list-unstyled">
                                                        <li class="clearfix">
                                                            <img src="img/user/user.jpg" class="avatar" alt="danish personal blog and magazine template">
                                                            <div class="post-comments">
                                                                <p class="meta"><%=rs3.getString("f.cdate")%> <a href="#"><%=uname2%></a> says : <i class="pull-right"><a href="#form-comment" onclick="load(<%=rs3.getString("f.cid")%>)"><input type="hidden" id="<%=rs3.getString("f.cid")%>" name="<%=rs3.getString("f.cid")%>" value="<%=rs3.getString("f.cid")%>"/><small class="btn btn-xs btn-default">Reply</small></a></i></p>
                                                                <p>
                                                                    <%=rs3.getString("f.message")%>
                                                                </p>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                    <%
                                                    
                                                        }
                                                    %>
                                                </li>
                                            </ul>
                                            <%
                                                        
                                                }

                                            %>
                                        </ul>
                                        <%                                            
                                        }

                                        %>
                                    </div>
                                    <!-- end:comments list -->
                                    <!-- start:form comment -->
                                    <div id="form-comment" class="form-comment">
                                        <h3>Form Comments</h3>
                                        <form role="form" action="Comment" method="post">
                                            <div class="row">

                                                <div class="form-group col-md-12">
                                                    <textarea class="form-control" name="comm" rows="5" placeholder="Messages.."></textarea>
                                                </div>
                                                <div class="form-group col-md-12">
                                                    <button class="btn btn-lg btn-default btn-block">SUBMIT</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- end:form comment -->
                                </div>
                                <!-- end:comments -->
                            </div>
                        </div>
                        <!-- end:single content -->
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
                                            Statement st3 = con.createStatement();
                                            ResultSet rs3 = st3.executeQuery("select * from blog ORDER BY bdate DESC");
                                            int count=0;
                                            while (rs3.next()) {
                                                if(count>=4){
                                                    break;
                                                }
                                        %>
                                        <li class="recent-post">
                                            <div class="thumbnail">
                                                <img src="img/content/<%=rs3.getString("bimage")%>" class="img-responsive">
                                            </div>
                                            <a href="blog1.jsp?bid=<%=rs3.getString("bid")%>"><h5><%=rs3.getString("title")%></h5></a>
                                            <p><small><i class="fa fa-calendar"></i><%=rs3.getString("bdate")%></small></p>
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
        <!-- end:single blog -->
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