<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>Thankyou</title>
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
 <body>
 
  
  <div class="well well-big" >
 
  <div class="container">

            <div class="row">

                <div class="col-lg-8 col-lg-offset-2">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <center><h1 style="color:white">Thank You For Order</h1></center>
	  <div class="content">
									<center> <div class="row">
									<div class="col-lg-8 col-lg-offset-2">
<!-- 									<table style="border: 1px solid black" > -->
<!--     <thead style="border: 1px solid black"> -->
<!--       <tr style="background-color: #eee"> -->
<!--       <th style="border: 1px solid black">Product Image</th> -->
<!--         <th style="border: 1px solid black">Product Name</th> -->
<!-- <!--         <th>Description</th> --> 
<!--         <th style="border: 1px solid black">Category Name</th> -->
<!--         <th style="border: 1px solid black">Seller Name</th> -->
<!--         <th style="border: 1px solid black">Price</th> -->
<!--       </tr> -->
<!--     </thead> -->
<!--     <tbody> -->
   
<%-- <%--     <c1:if test="${prot!=null}"> --%> 
<!--       <tr> -->
<%--         <td style="border: 1px solid black"><img src="<c:url value='/resource/images/${prot.getP_id()}.jpg'/>" width=150px height=200px></td> --%>
<%--         <td style="border: 1px solid black">${prot.getP_Name()}</td> --%>
<%-- <%--         <td>${product.getDes()}</td> --%> 
<%--         <td style="border: 1px solid black">${prot.getCategory().getCat_name()}</td> --%>
<%--         <td style="border: 1px solid black">${prot.getSeller().getName()}</td> --%>
<%--         <td style="border: 1px solid black">${prot.getPrice()}</td> --%>
<!--       </tr> -->
<%-- <%--       </c1:if> --%> 
<!--   </div> -->
<!--   </div> -->
</center></nav>
<marquee><h4>  <a href="<c:url value="/allproducts"/>">Cart More</a> </h4></marquee>
           
 
    </tbody>
</body>
</html>