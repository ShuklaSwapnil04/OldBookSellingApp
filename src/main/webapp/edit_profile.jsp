<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_Components/navbar.jsp"%>
<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>

	</c:if>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div  class="card">
<div class="card-body">

<h4 class="text-center text-primary">Edit profile</h4>
<c:if test="${not empty succMsg}">
	
	<div class="alert alert-success" role="alert">	${succMsg }
	<c:remove var="succMsg" scope="session"/>

	</div>
	</c:if>
	<c:if test="${not empty failedMsg}">
	<div class="alert alert-danger" role="alert">${failedMsg}
	<c:remove var="failedMsg" scope="session"/>
	</div>
	</c:if>

<form action="update_profile" method="post">

<input type="hidden" value="${userobj.id }"name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">EnterFull Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required"name="fname" value="${userobj.name }">

							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required="required" value="${userobj.email }">

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Enter Phone number</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phno" required="required" value="${userobj.phno }">

							</div>


							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required="required">
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>

</div>

</div>


</div>

</div>
</div>

</body>
</html>