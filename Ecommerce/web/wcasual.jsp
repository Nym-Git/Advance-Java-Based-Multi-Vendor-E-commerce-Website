<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    Connection con= DriverManager.getConnection("jdbc:derby://localhost:1527/shopping1","yasir","yasir");
    String n= (String) session.getAttribute("name");
    PreparedStatement st=null;
    if(request.getParameter("mc")!=null)
    {
        st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE < 1004 "); 
    }
    else if(request.getParameter("wc")!=null)
    {
        st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE BETWEEN 1004 AND 1006");
    }
    else if(request.getParameter("na")!=null)
    {
        st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE BETWEEN 1008 AND 1010");
    }
    else if(request.getParameter("hc")!=null)
    {
        st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE BETWEEN 1005 AND 1007");
    }
    else if(request.getParameter("hd")!=null)
    {
        st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE  BETWEEN 1002 AND 1004");
    }
     ResultSet rs = st.executeQuery();
     
    
%>
<html>
     <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
            <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            <style>
                .card0 {
                    box-shadow: 0px 4px 8px 0px #757575;
                    border-radius: 0px
                }
                .checked
                {
                    color: orange;
                }
            </style>
    </head>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar10">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbar10">
           <ul class="navbar-nav nav-fill w-100">
                <li class="nav-item">
                    <a class="nav-link" href="SignIn.html"> Sign In </a>
                </li>
               <li class="nav-item">
                    <a class="nav-link" href="Categories.html"> Categories </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html"> Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Contactus.html">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="About.html"> About </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
        <div class="my-3 small">
           <h1 class="text-center"> <img src="imge/9.jpg" height="50" width="50">
            <a href="About.html" class="text-dark ">Shopping Heart</a>
            <img src="imge/9.jpg" height="50" width="50"></h1>
            <p class="text-center text-dark">For Those Who Love Shopping</p>
        </div>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <h2 class="text-light">Welcome</h2>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse " id="navbarSupportedContent">
        <form class="form-inline my-2 my-lg-0 ml-auto" action="search">
        <input class="form-control mr-sm-2" type="search" name="sr" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
         </form>
        </div>
                </header>
    <div class="small my-3">
        </div>
        <div class="row">
            <div class="col-md-3">
              <div class="container card0 text-dark">
	<div class="row">
        <div class="well" style="width:300px; padding: 8px 0;">
            <div style="overflow-y: scroll; overflow-x: hidden; height: 500px;">
                <ul class="nav list-group nav-list">
                    <li><label class="tree-toggler list-group-item nav-header">Top</label>
                        <ul class="nav nav-list list-group tree">
                            <li class="list-group-item text-dark"><a href="#">Shirts </a></li>
                            <li class="list-group-item text-muted"><a href="#">T-Shirts </a></li>
                        
                    <li class="list-group-item"><label class="tree-toggler nav-header">Seasonal Wear</label>
                        <ul class="nav list-group nav-list tree">
                            <li class="list-group-item"><a href="#">Summer</a></li>
                            <li class="list-group-item"><a href="#">Winter</a></li>
                            </ul>
                            <li class="list-group-item"><label class="tree-toggler nav-header">Party Wear</label>
                                <ul class="nav list-group nav-list tree">
                                    <li class="list-group-item"><a href="#">Casual</a></li>
                                    <li class="list-group-item"><a href="#">Ethnic</a></li>
                                </ul>
                            </li>
                    </li>
                </ul>
                    </li>
                    <li class="divider"></li>
                    <li><label class="tree-toggler list-group-item nav-header">Bottom</label>
                        <ul class="nav nav-list list-group tree">
                            <li class="list-group-item"><a href="#">Jeans</a></li>
                            <li class="list-group-item"><a href="#">Pant</a></li>
                            <li class="list-group-item"><label class="tree-toggler nav-header">Seasonal Wear</label>
                                <ul class="nav nav-list list-group tree">
                                    <li class="list-group-item"><a href="#">Summer</a></li>
                                    <li class="list-group-item"><a href="#">Winter</a></li>
                                    </ul>
                                    <li class="list-group-item"><label class="tree-toggler nav-header">Party Wear</label>
                                        <ul class="nav nav-list list-group tree">
                                            <li class="list-group-item"><a href="#">Casual</a></li>
                                            <li class="list-group-item"><a href="#">Ethnic</a></li>
                                        </ul>
                                    </li>
                                
                            </li>
                            <li><label class="tree-toggler list-group-item nav-header">Shoes</label>
                                <ul class="nav nav-list list-group tree">
                                    <li class="list-group-item"><a href="#">Sports</a></li>
                                    <li class="list-group-item"><a href="#">Formals</a></li>
                                    <li class="list-group-item"><label class="tree-toggler nav-header">Slippers</label>
                                        <ul class="nav nav-list list-group tree">
                                            <li class="list-group-item"><a href="#">Traditional</a></li>
                                            <li class="list-group-item"><a href="#">Loafers</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
	</div>
</div>
                <script>
                    $(document).ready(function () {
    $('label.tree-toggler').click(function () {
        $(this).parent().children('ul.tree').toggle(300);
    });
});
                    </script>
            </div>
            <div class="col">
                <div class="container">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="d-block w-100 " src="imge/1.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="imge/2.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                  <img class="d-block w-100" src="imge/3.jpg" alt="Third slide">
                </div>
              </div>
              <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
            </div>
                <div class="small my-3">
        </div>
                <FORM NAME="form1" action="cwish" METHOD="POST">
                    <div class="container-fluid">
                    <div class="card-deck card0 text-dark text-capitalize"> 
                <%while (rs.next()){
                    String z = rs.getString(1);
                    String pn = rs.getString(3);
                    int nm = rs.getInt(2);
                    int i = rs.getInt(8);
                    int rp = rs.getInt(5);
                    int t = rs.getInt(6);
                    int g=t;
                %>
                
                        <div class="card card0 text-left h-25">
                          <div class="card-body">
                             <img class="card-img-top " src="<%= z%>" alt="Card image cap">
                             <h6>#<input readonly class="border-0" name="id" value="<%= i%>"></h6>
                            <h5 class="card-title"><%= pn%></h5>
                            <div>
                            <% while(t!=0)
                            {
                            %>
                            
                            <span class="fa fa-star checked"></span>
                            <% 
                                t--;
                            }
                            %>
                            <%if(g!=5){while(g<5){%>
                            <span class="fa fa-star"></span>
                            <%g++;}}%>
                            </div>
                            <h5><i class="fa fa-inr"></i> <%= nm%></h5>
                            <h6>M.R.P <strike class="text-muted"><i class="fa fa-inr"></i> <%= rp%></strike></h6>
                            <a href="SignIn.html" class="btn btn-primary text-capitalize"><i class="fa fa-shopping-cart"></i> add to cart</a>
                            <a href="SignIn.html" class="btn btn-danger text-capitalize"><i class="fa fa-heart-o"></i> wishlist</a>
                          </div>
                        </div>
                            
                <%}%>
                    </div>
                </div>
                </Form>
            </div>
        </div>
        
        <div class="small my-3">
        </div>
        <footer id="dk-footer" class="dk-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-2 col-lg-3">
                    <div class="dk-footer-box-info">
                        <a href="index.html" class="footer-logo">
                            <img src="imge/ss.png" alt="footer_logo" class="img-fluid ">
                        </a>
                        <p class="footer-info-text">
                          ShoppingHeart.com is an Ecommerce website was started in 2021 by Yasir Ahmad Group of Companies
                        </p>
                        <div class="footer-social-link">
                            <h3>Follow us</h3>
                            <ul>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-linkedin"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="footer-awarad">
                        <img src="images/icon/best.png" alt="">
                        <p>Best Shopping Web Site 2021</p>
                    </div>
                </div>
                <div class="col-md-12 col-lg-8">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="contact-us">
                                <div class="contact-icon">
                                    <i class="fa fa-map-o" aria-hidden="true"></i>
                                </div>
                                <div class="contact-info">
                                    <h3>Kanpur India</h3>
                                    <p>Mall Road</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="contact-us contact-us-last">
                                <div class="contact-icon">
                                    <i class="fa fa-volume-control-phone" aria-hidden="true"></i>
                                </div>
                                <div class="contact-info">
                                    <h3>6394407864</h3>
                                    <p>Give us a call</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-lg-6">
                            <div class="footer-widget footer-left-widget">
                                <div class="section-heading">
                                    <h3>Useful Links</h3>
                                    <span class="animate-border border-black"></span>
                                </div>
                                <ul>
                                    <li>
                                        <a href="About.html">About us</a>
                                    </li>
                                    <li>
                                        <a href="Contactus.html">Contact us</a>
                                    </li>
                                    <li>
                                        <a href="#">Our Team</a>
                                    </li>
                                </ul>
                                <ul>
                                    <li>
                                        <a href="#">Services</a>
                                    </li>
                                    <li>
                                        <a href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a href="#">Testimonials</a>
                                    </li>
                                    <li>
                                        <a href="#">Faq</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-6">
                            <div class="footer-widget">
                                <div class="section-heading">
                                    <h3>Subscribe</h3>
                                    <span class="animate-border border-black"></span>
                                </div>
                                <p>
                               ShoppingHeart.com is different from other e- commerce websites as being the only website in India which serving both Individuals.</p>
                                <form action="#">
                                    <div class="form-row h-25">
                                        <div class="col dk-footer-form">
                                            <input type="email" class="form-control" placeholder="Email Address">
                                            <button type="submit">
                                                <i class="fa fa-send"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <span>Copyright © 2019, All Right Reserved Yasir Ahmad</span>
                    </div>                   
                    <div class="col-md-6">
                        <div class="copyright-menu">
                            <ul>
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li>
                                    <a href="#">Terms</a>
                                </li>
                                <li>
                                    <a href="#">Privacy Policy</a>
                                </li>
                                <li>
                                    <a href="Contactus.html">Contact Us</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    </div>                
            </div>            
        </div>        
        <div id="back-to-top" class="back-to-top">
            <button class="btn btn-dark" title="Back to Top" style="display: block">
                <i class="fa fa-angle-up"></i>
            </button>
        </div>        
</footer>
    </body>
</html>
