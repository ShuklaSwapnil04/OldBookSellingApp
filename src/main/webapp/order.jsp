<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order list</title>
<%@include file="all_Components/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_Components/navbar.jsp"%>
<c:if test="${empty userobj}">

		<c:redirect url="login.jsp"></c:redirect>

	</c:if>
<div class="container p-1">
<h3 class="text-center text-info">Order's List</h3>
<table class="table table-striped mt-3">
<thead >
<tr>
<th scope="col">Order Id</th>
<th scope="col">Name</th>
<th scope="col">Book Name</th>
<th scope="col">Author</th>
<th scope="col">Price</th>
<th scope="col">Payment type</th>
</tr>
</thead>
<tbody>
<%
User u=(User)session.getAttribute("userobj");
BookOrderDAOImpl dao=new BookOrderDAOImpl(DBConnect.getConn());
List<BookOrder> blist =dao.getBook(u.getEmail());
for(BookOrder b:blist)
{
%>
<tr>
<th scope="row"><%=b.getOrderId() %></th>
<td><%=b.getUsername() %></td>
<td><%=b.getBookName() %></td>
<td><%=b.getAuthor() %></td>
<td><%=b.getPrice() %></td>
<td><%=b.getPaymentType() %></td>
</tr>
<%
}
%>
</tbody>
</table>
</div>
</body>
</html>