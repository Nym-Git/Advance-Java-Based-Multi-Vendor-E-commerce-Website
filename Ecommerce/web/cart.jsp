<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Connection con= DriverManager.getConnection("jdbc:derby://localhost:1527/shopping1","yasir","yasir");
int i=0,l=0,jk=4;
String n= (String) session.getAttribute("name");
if(request.getParameter("di")!=null)
{
     PreparedStatement st=con.prepareStatement("DELETE FROM CART WHERE EMAIL = ? AND ID = ? ");
                st.setString(1,n);
                st.setString(2,request.getParameter("di"));
                int k = st.executeUpdate();
                if (k ==0)
                {
                    request.getRequestDispatcher("cart.jsp").include(request, response);%>
               <html><body><script>alert('Product Deleted Succesfully');</script></body></html>
                <%}
}
if(request.getParameter("id")!=null)
            {
                int m=0;
                PreparedStatement st=con.prepareStatement("SELECT ID FROM CART WHERE EMAIL =?");
                st.setString(1,request.getParameter("id"));
                ResultSet rs = st.executeQuery();
                while(rs.next())
                {
                    m++;
                }
             if(m == 0)
             {
             PreparedStatement stv=con.prepareStatement("INSERT INTO CART VALUES(?,?)");
             stv.setString(2,request.getParameter("id"));
             stv.setString(1, n); 
             stv.executeUpdate();
             }
            }
PreparedStatement st=con.prepareStatement("SELECT * FROM PRODUCTS WHERE ID IN ( SELECT ID FROM CART WHERE EMAIL =?)");
st.setString(1,n);
ResultSet rs=st.executeQuery();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar10">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbar10">
           <ul class="navbar-nav nav-fill w-100">
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp"> Cart </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="wishlist.jsp"> Wishlist </a>
                </li>
               <li class="nav-item">
                    <a class="nav-link" href="logcategories.html"> Categories </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loghome.html"> Home </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="order.jsp"> Order </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logcontact.html">Contact Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp"> Profile </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
        <div class="my-3 small">
           <h1 class="text-center"> <img src="imge/9.jpg" height="50" width="50">
            <a href="logabout.html" class="text-dark ">Shopping Heart</a>
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
        <div class="small my-2">
        </div>
        
        

        <div class="card-deck text-dark">
            <%while (rs.next()){
                    String z = rs.getString(1);
                    String pn = rs.getString(3);
                    int nm = rs.getInt(2);
                    int ig = rs.getInt(8);
                    int rp = rs.getInt(5);
                    int t = rs.getInt(6);
                    int g = rs.getInt(6);
                    i++;
                    l++;
                %>
                
                        <div class="card card0 text-left h-25">
                          <div class="card-body">
                             <img class="card-img-top card-group " src="<%= z%>" alt="Card image cap">
                             <label name="number">#<%= ig%></label>
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
                            <form action="bdlt">
                            <button type="submit" class="btn btn-primary text-capitalize" name="buy" ><i class="fa fa-shopping-cart"></i> Proceed to buy</button>
                            <a href="cart.jsp?di=<%=rs.getString(8)%>" class="btn btn-danger text-capitalize"><i class="fa fa-trash"></i> delete</a>
                            </form>
                          </div>
                        </div>

                            <%}%>
            </div>
            
             <%if(i==0){
            PreparedStatement st1=con.prepareStatement("SELECT * FROM PRODUCTS WHERE IDE < 1005"); 
            ResultSet rs1=st1.executeQuery();%>
            <div class="text-center">
                
              <img src="imge/EM.jpg" class="rounded w-75 h-75" alt="...">
              
                
            </div>
            <div class="my-3 small card0 bg-dark">
              <h1 class="text-center text-light">You May Also Like..</h1>  
            </div>
            
            <div class="card-deck text-dark">
            <%while (rs1.next()){
                    String z = rs1.getString(1);
                    String pn = rs1.getString(3);
                    int nm = rs1.getInt(2);
                    int ig = rs1.getInt(8);
                    int rp = rs1.getInt(5);
                    int t = rs1.getInt(6);
                    int g=t;
                %>
                
                        <div class="card card0 text-left h-25">
                          <div class="card-body">
                             <img class="card-img-top " src="<%= z%>" alt="Card image cap">
                             <label name="number">#<%= ig%></label>
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
                            <button class="btn btn-primary text-capitalize" name="cart" value="submit" ONCLICK="submit()"><i class="fa fa-shopping-cart"></i> Add to cart</button>
                            <button class="btn btn-danger text-capitalize" name="wish" value="submit" ONCLICK="submit()"><i class="fa fa-heart-o"></i> wishlist</button>
                          </div>
                        </div>
                            <%}%>
            <%}%>
            </div>
        

            
        
        
        <div class="small my-2">
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


