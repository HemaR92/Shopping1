
<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html lang="en">
<head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>Add Category</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
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

<body style="background-color:light pink">

<nav class="navbar navbar-inverse" style="background-color:crimson">
  <div class="container-fluid">

    <ul class="nav navbar-nav" style="color:white">
      <li><a href="<c:url value="/"/>" style="color:white">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value="/products"/>" style="color:white">Products <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="<c:url value="/men"/>" style="color:crimson">Men</a></li>
          <li><a href="<c:url value="/women"/>" style="color:crimson">Women</a></li>
          <li><a href="<c:url value="/kids"/>" style="color:crimson">Kids</a></li>
        </ul>
      </li>
      <li><a href="/aboutus" style="color:white">About Us</a></li>
	   <li><a href="/contactus" style="color:white">Contact Us</a></li>
	    <li  class="active"><a href="<c:url value="/addcategory"/>" style="color:white">Add Category</a></li>
      <li><a href="<c:url value="/addsupplier"/>" style="color:white">Add Supplier</a></li>
	   <li><a href="<c:url value="/addproduct"/>" style="color:white">Add Product</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<c:url value="/signup"/>" style="color:white"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="<c:url value="/login"/>" style="color:white"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li><a href="<c:url value="/logout"/>" style="color:white"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
      <li><a href="<c:url value="/cart"/>" style="color:white"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
    
    </ul>
  </div>
</nav>
</body>
</html>