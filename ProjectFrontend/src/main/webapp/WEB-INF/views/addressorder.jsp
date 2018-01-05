<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>Add Category</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="${css}/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${css}/style.css">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" media="all">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css" rel="stylesheet" media="all">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${js}jquery.js"></script>
<%--   <link rel="stylesheet" href="${css}/bootstrap.css"> --%>
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
    border: 2px solid pink;
}

legend
{
	color: crimson;
	text-align:center;
}
	</style>
</head>
<body background="${img}/bcg.jpg">
<!-- <body style="background-color:light pink"> -->

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
      <li><a href="<c:url value="/logout"/>" style="color:white"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      </c1:if>
      <li><a href="<c:url value="/cart"/>" style="color:white"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
    
    </ul>
  </div>
</nav>
			

	
	<div class="span11">

	<div class="col-md-12  col-sm-12  col-xs-8 "
	style="background: #fff; padding: 30px;">

	<div class="col-md-6 col-sm-6 col-xs-12">
		<h3 class="text-center">Billing Address</h3>

		<hr>
			<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="text" path="user.umail" name="email" class="form-control input-sm"					
				placeholder="Emailid" disabled="true"/> 
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="number" name="mono" path="user.mobile" disabled="true"
			class="form-control input-sm" placeholder="Mobile no"/>
			</div>
		</div>
		

		<div class="col-xs-12 col-sm-12 col-md-12">
			<div class="form-group">
				<form:input class="form-control" path="user.billing.houseno" disabled="true"
					placeholder="House name and number"/>                                                
                                            
			</div>
		</div>

		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text" name="country" disabled="true"
					class="form-control input-sm" placeholder="country" path="user.billing.country" />
			</div>
		</div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text" name="city" disabled="true"
					class="form-control input-sm" placeholder="city" path="user.billing.city"/>
			</div>
		</div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text" name="pincode" disabled="true"
					class="form-control input-sm" placeholder="pincode" path="user.billing.pincode" />
			</div>
		</div>
		<input class="coupon_question" type="checkbox" name="coupon_question"
			value="1"> <span class="item-text">Check Shipping
			address</span>
			
	</div>


	<div class="col-md-6 shipping col-sm-6 col-xs-12">
		<h3 class="text-center">shipping Address</h3>

		<hr>
	<c:url value="/orderConfirm" var="a"/>
		<form:form action="${a}" method="post" commandName="shippingAddress">
		
	
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="text" name="First Name" id="first_name"
					class="form-control input-sm" placeholder="First Name" path="firstName"/>
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="text" name="Last Name" id="last_name"
					class="form-control input-sm" placeholder="Last Name" path="lastName"/>
			</div>
		</div>

		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="text" name="Email id" id="first_name"
					class="form-control input-sm" placeholder="Email id" path="email"/>
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<form:input type="text" name="Mobile no" 
					class="form-control input-sm" placeholder="Mobile no" path="mobile"/>
			</div>
		</div>

		<div class="col-xs-12 col-sm-12 col-md-12">
			<div class="form-group">
				<form:input type="text" class="form-control" path="houseno"/>                                                
                                           
			</div>
		</div>

		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text"
					class="form-control input-sm" placeholder="country" path="country"/>
			</div>
		</div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text" 
					class="form-control input-sm" placeholder="city" path="city"/>
			</div>
		</div>
		<div class="col-xs-12 col-sm-4 col-md-4">
			<div class="form-group">
				<form:input type="text"
					class="form-control input-sm" placeholder="pincode" path="pincode" />
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<input type="submit" class="btn btn-primary pull-right" value="Continue">
	</div>
   </form:form>
</div>
</div></div>
<!--
Footer
-->

<!-- /container -->

<div class="copyright">
<div class="container">
	
	<span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
</div>
</div>
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
