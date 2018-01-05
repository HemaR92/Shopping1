
<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html><head>
<c:url value="/resources/css" var="css"/>
<c:url value="/resources/js" var="js"/>
<c:url value="/resources/images" var="img"/>
  <title>Payment</title>
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
	 $http.get("http://localhost:7072/ProjectFrontend/SendMail")
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
   <center><h2>Pay</h2></center>
  <p><strong>Note:</strong> please <strong>Select</strong> The  payment methord in order to complete your order </p>
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Cash on D</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body">
        <c:url value="/payment" var="e"/>
          <form:form action="${e}" method="post" id="myForm">
          <div class="checkbox">
             <input type="checkbox"  name="cod" value="1" name="pay"  data-toggle="collapse" data-target="#demo" >cod
              <div id="demo" class="collapse">
   					 One time password has been sent to your mail id<br>
   					 
   					Enter the otp : <input ng-app="myApp" ng-controller="myCtrl" type="text"  name="otp"> 
  			</div>
             </div>
             <input type="submit" class="button" value="pay">
          </form:form>   
        </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Pay by Card</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse in">
        <div class="panel-body"><div class="container">
    
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="credit-card-div">
                <div class="panel panel-default">
                    <div class="panel-heading">

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <h5 class="text-muted"> Credit Card Number</h5>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input type="text" class="form-control" placeholder="0000" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input type="text" class="form-control" placeholder="0000" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input type="text" class="form-control" placeholder="0000" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <input type="text" class="form-control" placeholder="0000" />
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <span class="help-block text-muted small-font"> Expiry Month</span>
                                <input type="text" class="form-control" placeholder="MM" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <span class="help-block text-muted small-font">  Expiry Year</span>
                                <input type="text" class="form-control" placeholder="YY" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <span class="help-block text-muted small-font">  CCV</span>
                                <input type="text" class="form-control" placeholder="CCV" />
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-3">
                                <img src="data:image/png;base64,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" class="img-rounded" />
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-12 pad-adjust">

                                <input type="text" class="form-control" placeholder="Name On The Card" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 pad-adjust">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" checked class="text-muted"> Save details for fast payments. <a href="#">Learn More</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                <input type="submit" class="btn btn-danger" value="CANCEL" />
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 pad-adjust">
                                <input type="submit" class="btn btn-warning btn-block" value="PAY NOW" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- CREDIT CARD DIV END -->
        </div>
    </div>
</div> </div>
    </div>
    
    </div>

</div>

            <!-- CREDIT CARD FORM ENDS HERE -->
             
             <!-- end of payment -->
             



</body>
</html>