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
  <title>Add Supplier</title>
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
margin-left:500px;
margin-top:50px;
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
 


<c:url value="/addsupplier" var="addsup"/>
<form:form action="${addsup}" method="post" commandName="supplier">
<fieldset>
<legend>Add Supplier</legend>
Supplier Id:<form:input type="text" path="supId"/><br><br>
Supplier Name:<form:input type="text" path="supName" placeholder="Enter Supplier Name" required="required"/><br><br><br>
Mobile number:<form:input type="text" path="mobile" placeholder="Enter Mobile Number" required="required"/><br><br><br>
Address:<form:input type="text" path="addr" placeholder="Enter Address" required="required"/><br><br><br>
 <input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" value="Cancel">
 </fieldset>
</form:form>
<table style="border: 1px solid black">
					<tr style=" background-color: #eee ">
					<th style="border: 1px solid black" >Supplier ID</th>
					<th style="border: 1px solid black">Supplier Name</th>
					<th style="border: 1px solid black">Supplier Mobile</th>
					<th style="border: 1px solid black">Supplier Address</th>
					<th colspan="2" style="border: 1px solid black">Edit/Delete</th>
					</tr>
				
					<center><tbody>
					<c1:forEach items="${suppliers}" var="supplier">
					<tr style="border: 1px solid black">
					<td style="border: 1px solid black">${supplier.getSupId()}</td>
					<td style="border: 1px solid black">${supplier.getSupName()}</td>
					<td style="border: 1px solid black">${supplier.getMobile()}</td>
					<td style="border: 1px solid black">${supplier.getAddr()}</td>
					<td style="border: 1px solid black"><a href="<c1:url value="/editsupplier/${supplier.getSupId()}"/>" class="btn btn-info">Edit</a></td>
                    <td style="border: 1px solid black"><a href="<c1:url value="/deletesupplier/${supplier.getSupId()}"/>" class="btn btn-danger">Delete</a></td>

                   </tr>
                   </c1:forEach>
                   </table>


</body>
</html>