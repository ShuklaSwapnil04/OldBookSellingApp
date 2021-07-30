<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_Components/allCss.jsp"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <%@page isELIgnored="false" %>
</head>
<body style="background-color:#f0f1f2">
	<%@include file="all_Components/navbar.jsp"%>
	<div class="container">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center "> Login</h4>
					
					<c:if test="${not empty failMsg}">
					<h5 class="text-center text-danger">${failMsg }</h5>
					<c:remove var="failMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty succMsg}">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="failMsg" scope="session"/>
					</c:if>
				
					
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
								
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
							
							<div class="text-center">
							<button type="submit" class="btn btn-primary">Login</button><br>
							<a href="register.jsp">Create Account</a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>