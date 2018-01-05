<html>
<head>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%></head>
  <body>
  <div class="well well-big" >
 
  <div class="container">

            <div class="row">

                <div class="col-lg-8 col-lg-offset-2">
                 
 <table style="align:left" >  
                  <tr>
                  
                 <td> <c:url value="/addcategory" var="a"/>
                 
                  <form:form method="POST" action="${a}" commandName="cat">
                  
                  <label>Category Name</label></td>
                  <form:input type="hidden" path="catId" />
                 <td> <form:input text="text" path="catName"/><br></td>
                 </tr>
                   <tr>
                   <td><label>Category Discription</label></td>
                  <td><form:input text="text" path="cat_des"/></td></tr>
                  <tr colspan="2">
                  <td align="center">
                  <input type="submit" value="save"/></td>
                  </tr>
                   </form:form>
					</table>
					<br>
					<br>
					
					
					
					

            </div>

        </div>
        </div>
       

        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="validator.js"></script>
        <script src="contact.js"></script>
    </body>
 </html>