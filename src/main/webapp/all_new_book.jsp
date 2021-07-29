<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Books:All</title>

<%@include file="all_Components/allCss.jsp"%>
<style type="text/css">
.back-image {
	background: url("image/book.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>

<body>
<%

User u= (User)session.getAttribute("userobj");
%>
<c:if test="${not empty addcart }">
<div id="toast">${addcart} </div>
<script type="text/javascript">
showToast();
function showtoast(content)
{
	$('#toast').addClass("display");
	$('#toast').html(content);
	setTimeout(()=>{
	$("#toast").removeClass("display");
	},2000)
	}
	</script>
}
<c:remove var="addCart" scope="session"/>

</c:if>
	<%@include file="all_Components/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row p-3">

	<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
							<%if(u==null)
								{%>
								<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add To Cart</a>
							<%}
							else
							{
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add To Cart</a>
							
								<%
								}%> <a
								href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>




	
	
	</div>
	</div>
	
</body>
</html>