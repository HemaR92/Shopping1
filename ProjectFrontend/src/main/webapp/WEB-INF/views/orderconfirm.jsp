<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>OrderConformation</title>
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${css}/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${css}/style.css">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all">
  <script src="${js}/jquery.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <script>
 var app = angular.module('myApp', []);
 app.controller('myCtrl', function($scope, $http){
	 $http.get("http://localhost:8080/ProjectFrontend/SendMail")
	 });
 </script>
 </head>
 <style>
 li a:hover:not(.active) {
    background-color: #111;
}

.active {
    background-color:pink;
}

fieldset { 
    
    margin-left: 500px;
    margin-right: 500px;
    padding:25px;
    border: 2px solid black;
}

legend
{
	color: black;
	text-align:center;
}
	</style>
 <body background="${img}/bcg.jpg">
 <nav class="navbar navbar-inverse" style="background-color:crimson">
  <div class="container-fluid">

    <ul class="nav navbar-nav" style="color:white">
      <li class="active"><a href="<c:url value="/"/>" style="color:white">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value="/products"/>" style="color:white">Products <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<c:url value="/men"/>" style="color:grey">Men</a></li>
          <li><a href="<c:url value="/women"/>" style="color:grey">Women</a></li>
          <li><a href="<c:url value="/kids"/>" style="color:greysssss">Kids</a></li>
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
      <li><a href="<c:url value="/cart"/>" style="color:white"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
    
    </ul>
  </div>
</nav>

  <div class="container">
  <div class="well well-big" >
 
  

            <div class="row">
            <div class="span15">

                <div class="col-lg-8 col-lg-offset-2">
<center>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10 clearfix" id="checkout">

<!--                         <div class="box"> -->
                            <form method="post" action="shop-checkout4.html">
                                <ul class="nav nav-pills nav-justified">
                                    <li><a href="<c:url value="/previous"/>"></a><i class="fa fa-map-marker"></i><br>Billing Adress</a></li>
                                    <li class="active"><a href="<c:url value="/pay"/>"><i class="fa fa-money"></i><br>Confirm Your Order</a></li>
                                    <li class="disabled"><a href="<c:url value="/orderconfirmation"/>"><i class="fa fa-eye"></i><br>Shipment Address</a></li>
                                </ul>

<!--                                 <div class="container"> -->
<!--                                    <div class="row"> -->
                                       
<!--                                             <div class="box payment-method"> -->
											<center>
                                                <h4>Billing Address</h4>
                                                <table class="table" style="border: 1px solid black; border-collapse: collapse;">
                                               
		                                     <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;">   <p>Email: </p></td>
		                                     <td style="border: 1px solid black; border-collapse: collapse;">   <p>${billing.getEmail()} </p></td></tr>
                                             <tr style="border: 1px solid black; border-collapse: collapse;padding: 15px">  <td style="border: 1px solid black; border-collapse: collapse;"> <p>Phone: </p></td>
                                             <td style="border: 1px solid black; border-collapse: collapse;"> <p>${billing.getMobile()} </p></td></tr>
                                              <tr style="border: 1px solid black; border-collapse: collapse;"> <td style="border: 1px solid black; border-collapse: collapse;"> <p>City: </p></td>
                                              <td style="border: 1px solid black; border-collapse: collapse;"> <p>${billing.getCity()} </p></td></tr>
                                                <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"><p>Country: </p></td>
                                                <td style="border: 1px solid black; border-collapse: collapse;"><p>${billing.getCountry()} </p></td></tr>
                                               <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"> <p>House Number: </p></td>
                                               <td style="border: 1px solid black; border-collapse: collapse;"> <p>${billing.getHouseno()} </p></td></tr>
                                                <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"><p>Pin Code :</p></td>
                                                <td style="border: 1px solid black; border-collapse: collapse;"><p>${billing.getPincode()}</p></td></tr>
                                                 <br></center>
                                           </table>
                                        </div>
                                        <div class="col-sm-6">
<!--                                             <div class="box payment-method"> -->
											<center>
                                                <h4>Shipment Address</h4>
                                               <table class="table" style="border: 1px solid black; border-collapse: collapse;">
                                               <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;">Name:</td> <td style="border: 1px solid black; border-collapse: collapse;"><p>${shippingAddress.getFirstName()}  ${shippingAddress.getLastName()}.</p></td></tr>
                                                <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"><p>Email:</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getEmail()} .</p></td></tr>
                                               <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"> <p>Phone:</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getMobile()} .</p></td></tr>
                                                <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"><p>City:</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getCity()} .</p></td></tr>
                                               <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"> <p>Country:</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getCountry()} .</p></td></tr>
                                               <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"> <p>House Number:</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getHouseno()} .</p></td></tr>
                                                <tr style="border: 1px solid black; border-collapse: collapse;"><td style="border: 1px solid black; border-collapse: collapse;"><p>Pin Code :</td><td style="border: 1px solid black; border-collapse: collapse;">${shippingAddress.getPincode()}</p></td></tr>
                                                
                                            
                                            </div>
                                        </div>
</center>
                                        
                                        </div>
                                    </div>
									
                                    <!-- /.row -->
									<div class="content">
									<div class="row">
									<div class="col-lg-8 col-lg-offset-2">
									<table style="border: 1px solid black" >
    <thead style="border: 1px solid black">
      <tr style="background-color: #eee">
      <th style="border: 1px solid black">Product Image</th>
        <th style="border: 1px solid black">Product Name</th>
<!--         <th>Description</th> -->
        <th style="border: 1px solid black">Category Name</th>
        <th style="border: 1px solid black">Seller Name</th>
        <th style="border: 1px solid black">Price</th>
      </tr>
    </thead>
    <tbody>
   
    <c1:if test="${prot!=null}">
      <tr>
        <td style="border: 1px solid black"><img src="<c:url value='/resources/images/${prot.getProdId()}.jpg'/>" width=150px height=200px></td>
        <td style="border: 1px solid black">${prot.getProdName()}</td>
<%--         <td>${product.getDes()}</td> --%>
        <td style="border: 1px solid black">${prot.getCategory().getCatName()}</td>
        <td style="border: 1px solid black">${prot.getSupplier().getSupName()}</td>
        <td style="border: 1px solid black">${prot.getPrice()}</td>
      </tr>
      </c1:if>
    <c1:if test="${prot==null}">
     <c1:forEach items="${cartItems}" var="c1">
      <tr>
        <td style="border: 1px solid black"><img src=""></td>
        <td style="border: 1px solid black">${c1.getProduct().getProdName()}</td>
<%--         <td>${c1.getproduct.getDes()}</td> --%>
        <td style="border: 1px solid black">${c1.getProduct().getCategory().getCatName()}</td>
        <td style="border: 1px solid black">${c1.getProduct().getSupplier().getSupName()}</td>
        <td style="border: 1px solid black">${c1.getProduct().getPrice()}</td>
      </tr>
      </c1:forEach>
      </c1:if>
   

  </tbody>
 </table>
     <p calss="pull-left">Total price=Rs${prot.getPrice()}</p>
			<h2> Order will Be delivered to You with in 7 busisness days</h2>						
			</div>
									</div>
									</div>
                                <div class="box-footer">
                                         <div class="pull-left">
                                        <a href="<c:url value="/previous"/>" class="btn btn-default"><i class="fa fa-chevron-left"></i>previous</a>
                                        </div>
                                         <div class="pull-right">
                                        <a href="<c:url value="/pay"/>"  class="btn btn-template-main"><i class="fa fa-chevron-right">Pay</i></a>
                                        </button>
                                        </div>
                                     </div>
                                </div>
                                <!-- /.content -->
                                
                                

    </div>

    



</body>

</html>