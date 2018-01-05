<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${css}/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${css}/style.css">/
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${js}/jquery.js"></script>
<%--   <link rel="stylesheet" href="${css}/bootstrap.css"> --%>
 <style>
 li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color:lightgray;
}

	</style>
</head>
<body background="${img}/bcg.jpg">


<nav class="navbar navbar-inverse" style="background-color:crimson">
  <div class="container-fluid">

    <ul class="nav navbar-nav" style="color:white">
      <li class="active"><a href="<c:url value="/"/>" style="color:white">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value="/products"/>" style="color:white">Products <span class="caret"></span></a>
        
        <ul class="dropdown-menu">
        <c1:forEach items="${lcat}" var="cat1">
  <li><a  href="<c:url value="/dispcategory/${cat1.getCatId()}"/>">${cat1.getCatName()}</a></li>
<%--           <li><a href="<c:url value="/men"/>" style="color:grey">Men</a></li> --%>
<%--           <li><a href="<c:url value="/women"/>" style="color:grey">Women</a></li> --%>
<%--           <li><a href="<c:url value="/kids"/>" style="color:greysssss">Kids</a></li> --%>
</c1:forEach>
        </ul>
      </li>
      <li><a href="<c:url value="/aboutus"/>" style="color:white">About Us</a></li>
	   <li><a href="<c:url value="/contactus"/>" style="color:white">Contact Us</a></li>
	   <c1:if test="${pageContext.request.userPrincipal.name!=null}">
	   <security:authorize access="hasRole('ROLE_ADMIN')">
	    <li><a href="<c:url value="/category"/>" style="color:white">Add Category</a></li>
      <li><a href="<c:url value="/supplier"/>" style="color:white">Add Supplier</a></li>
	   <li><a href="<c:url value="/product"/>" style="color:white">Add Product</a></li>
	   </security:authorize>
	   </c1:if>
    </ul>
 
    <ul class="nav navbar-nav navbar-right">
     
    <c1:if test="${pageContext.request.userPrincipal.name==null}">
    
      <li><a href="<c:url value="/signup"/>" style="color:white"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<c:url value="/login"/>" style="color:white"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </c1:if>
      <c1:if test="${pageContext.request.userPrincipal.name!=null}">
      welcome ${pageContext.request.userPrincipal.name}
      <li><a href="<c:url value="/j_spring_security_logout"/>" style="color:white"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </c1:if> 
      <li><a href="<c:url value="/viewcart"/>" style="color:white"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
    
    </ul>
  </div>
</nav>
 
<div id="bootstrap-touch-slider" class="carousel bs-slider fade  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000" >

            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
                <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
                <li data-target="#bootstrap-touch-slider" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper For Slides -->
            <div class="carousel-inner" role="listbox">

                <!-- Third Slide -->
                <div class="item active">

                    <!-- Slide Background -->
                    <img src="${img}/men.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
                    <div class="bs-slider-overlay"></div>

                    <div class="container">
                        <div class="row">
                            <!-- Slide Text Layer -->
                            <div class="slide-text slide_style_left">
                                <h1 data-animation="animated zoomInRight" style="font-size:50px">Express your style <br>with the All new prints </h1>
                                <br>
                                <a href="#" target="_blank" class="btn btn-default" data-animation="animated fadeInLeft">Show now</a>
                               
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="item">

                    <!-- Slide Background -->
                    <img src="${img}/women.jpg" alt="Bootstrap Touch Slider"  class="slide-image"/>
                    <div class="bs-slider-overlay"></div>
                    
                <div class="item">

                    <!-- Slide Background -->
                    <img src="${img}/kids4.png" alt="Bootstrap Touch Slider"  class="slide-image" height=1600px/>
                    <div class="bs-slider-overlay"></div>
                    <!-- Slide Text Layer -->
                    <div class="slide-text slide_style_right">
                       <!-- <h1 data-animation="animated zoomInLeft">Day Dreamin!!!</h1>-->
                        <br>
                        <a href="#" target="_blank" class="btn btn-default" data-animation="animated fadeInLeft">Shop now</a>
                        </div>
                </div>
                <!-- End of Slide -->


            </div><!-- End of Wrapper For Slides -->

            <!-- Left Control -->
            <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
                <span class="fa fa-angle-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>

            <!-- Right Control -->
            <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
                <span class="fa fa-angle-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>

        </div> 
        </div>
		<div class="container">
    <div class="row">
        <div class="row">
            <div class="col-md-9">
                <h3>
                    New Trends</h3>
            </div>
          
            <div class="col-md-3">
                <!-- Controls -->
                 
                <div class="controls pull-right hidden-xs">
                    <a class="left fa fa-chevron-left btn btn-danger" href="#carousel-example"
                        data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-danger" href="#carousel-example"
                            data-slide="next"></a>
                </div>
            </div>
        </div>
          
        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel" style="background-color:#800420">
            <!-- Wrapper for slides -->
           
            <div class="carousel-inner" >
                <div class="item active">
                    <div class="row">
                    <c1:forEach var="pro" items="${prods}">
                        <div class="col-sm-3">
                        
                            <div class="col-item">
                            
                                <div class="photo">
                                    <img src="${img}/${pro.getProdId()}.jpg" class="img-responsive" alt="a"  width="200px" height="200px"/>
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                            <h5>
                                                ${pro.getProdName()}</h5>
                                            <h5 class="price-text-color">
                                                ${pro.getPrice()}</h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
                                        <p class="btn-add">
                                            <i class="fa fa-shopping-cart"></i><a href="<c:url value="/addtocart/${pro.getProdId()}"/>" class="hidden-sm">Add to cart</a></p>
                                        <p class="btn-details">
                                            <i class="fa fa-list"></i><a href="<c:url value="/viewpro/${pro.getProdId()}"/>">View</a></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                          </div>
                            </div>
                            </c1:forEach>
                        </div></div></div></div></div></div>
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/m1.jpg" class="img-responsive" alt="a" height=100px /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product Example</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $249.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/p2.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Next Sample Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $149.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/m2.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Sample Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $199.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/p3.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product with Variants</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $199.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/m3.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Grouped Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $249.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/p4.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product with Variants</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $149.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-3"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/m4.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product with Variants</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $199.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--     <div class="row"> -->
<!--         <div class="row"> -->
<!--             <div class="col-md-9"> -->
<!--                 <h3> -->
<!--                     New Arrivals</h3> -->
<!--             </div> -->
<!--             <div class="col-md-3"> -->
<!--                 Controls -->
<!--                 <div class="controls pull-right hidden-xs"> -->
<!--                     <a class="left fa fa-chevron-left btn btn-danger" href="#carousel-example-generic" -->
<!--                         data-slide="prev"></a><a class="right fa fa-chevron-right btn btn-danger" href="#carousel-example-generic" -->
<!--                             data-slide="next"></a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--         <div id="carousel-example-generic" class="carousel slide hidden-xs" data-ride="carousel"> -->
<!--             Wrapper for slides -->
<!--             <div class="carousel-inner"> -->
<!--                 <div class="item active"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k1.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 sample Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $199.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k2.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product Example</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $249.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k3.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Next Sample Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $149.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k4.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product with Variants</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $199.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k5.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Grouped Product</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $249.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                         <div class="col-sm-4"> -->
<!--                             <div class="col-item"> -->
<!--                                 <div class="photo"> -->
<!--                                     <img src="product/k6.jpg" class="img-responsive" alt="a" /> -->
<!--                                 </div> -->
<!--                                 <div class="info"> -->
<!--                                     <div class="row"> -->
<!--                                         <div class="price col-md-6"> -->
<!--                                             <h5> -->
<!--                                                 Product with Variants</h5> -->
<!--                                             <h5 class="price-text-color"> -->
<!--                                                 $149.99</h5> -->
<!--                                         </div> -->
<!--                                         <div class="rating hidden-sm col-md-6"> -->
<!--                                             <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star"> -->
<!--                                             </i><i class="fa fa-star"></i> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="separator clear-left"> -->
<!--                                         <p class="btn-add"> -->
<!--                                             <i class="fa fa-shopping-cart"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">Add to cart</a></p> -->
<!--                                         <p class="btn-details"> -->
<!--                                             <i class="fa fa-list"></i><a href="http://www.jquery2dotnet.com" class="hidden-sm">More details</a></p> -->
<!--                                     </div> -->
<!--                                     <div class="clearfix"> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
       
</body>
</html>
