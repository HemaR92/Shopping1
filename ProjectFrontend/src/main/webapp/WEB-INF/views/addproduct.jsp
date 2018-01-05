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
  <title>Add Product</title>
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
    border: 2px solid black;
}

legend
{
	color: black;
	text-align:center;
}

table,td,th
{
margin-left:150px;
margin-top:30px;
padding:10px;
align: center;
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
 


<!-- <h1 style="align:center">Add Product</h1> -->
<c:url value="/addproduct" var="addprodu"/>
<form:form action="${addprodu}" method="post" commandName="product" enctype="multipart/form-data">
<fieldset>
<legend>Add Product</legend>
Product Id:<form:input type="text" path="prodId" placeholder="Enter ProductId" required="required"/><br><br>
Product Name:<form:input type="text" path="prodName" placeholder="Enter ProductName" required="required"/><br><br><br>
Price:<form:input type="text" path="price" placeholder="Enter Price" required="required"/><br><br><br>
Quantity:<form:input type="text" path="quantity" placeholder="Enter Quantity" required="required"/><br><br><br>
Description:<form:input type="text" path="prodDescription" placeholder="Enter Description" required="required"/><br><br><br>

 <div class="form-group">
 <label for="cat">Category
 <font color="#000000">
 <form:select path="category.catId" multiple="false">
 <c1:forEach items="${categories}" var="d">
 <form:option value="${d.getCatId()}" label="${d.getCatName()}"/>
 </c1:forEach></form:select>
 </font></label></div>
<div class="form-group">
 <label for="sup">Supplier
 <font color="#000000">
 <form:select path="supplier.supId" multiple="false">
 <c1:forEach items="${suppliers}" var="s">
 <form:option value="${s.getSupId()}" label="${s.getSupName()}"/>
 </c1:forEach></form:select>
 </font></label></div>
 <form:input path="pimg" type="file" name="image" value="Upload file"/>
 <input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="Cancel">
 </fieldset>
</form:form>
<table style="border: 1px solid black">
					<tr style=" background-color: #eee ">
					<th style="border: 1px solid black" >Product Image</th>
					<th style="border: 1px solid black" >Product ID</th>
					<th style="border: 1px solid black">Product Name</th>
					<th style="border: 1px solid black">Product Description</th>
					<th style="border: 1px solid black">Product Quantity</th>
					<th style="border: 1px solid black">Product Price</th>
					<th colspan="2" style="border: 1px solid black">Edit/Delete</th>
					</tr>
				
					<center><tbody>
					<c1:forEach items="${products}" var="product">
					<tr style="border: 1px solid black">
					<td style="border: 1px solid black"><img src="<c:url value="/resources/images/${product.getProdId()}.jpg"/>", width=200px, height=200px></td>
					<td style="border: 1px solid black">${product.getProdId()}</td>
					<td style="border: 1px solid black">${product.getProdName()}</td>
					<td style="border: 1px solid black">${product.getProdDescription()}</td>
					<td style="border: 1px solid black">${product.getQuantity()}</td>
					<td style="border: 1px solid black">${product.getPrice()}</td>
					<td style="border: 1px solid black"><a href="<c1:url value="/editproduct/${product.getProdId()}"/>" class="btn btn-info">Edit</a></td>
                    <td style="border: 1px solid black"><a href="<c1:url value="/deleteproduct/${product.getProdId()}"/>" class="btn btn-danger">Delete</a></td>

                   </tr>
                   </c1:forEach>
                   </table>



</body>
</html>