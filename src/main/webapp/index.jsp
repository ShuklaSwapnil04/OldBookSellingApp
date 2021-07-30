
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book :Index</title>
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
<body style="background-color: #f7f7f7;">
<!-- To fetch user object -->
<%

User u= (User)session.getAttribute("userobj");
%>




	<%@include file="all_Components/navbar.jsp"%>
	<div class="conatiner-fluid back-image">
<!-- 		<h2 class="text-center text-white">Old Books Reselling</h2> -->

	</div>




	<!-- Start Recent Book -->

	<div class="container">
		<h1 class="text-center">Recent Book</h1>


		<div class="row">
			<%
				BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							<%
								if (b.getBookCategory().equals("Old")) {
							%>
							Category:<%=b.getBookCategory()%></p>
						<div class="row">
						
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%></a>
						</div>
						<%
							} else {
						%>

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
								}%>
							
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<%
							}
						%>

					</div>
				</div>
			</div>
			<%
				}
			%>








		</div>

		<div class="text-center mt-1">
			<a href=" all_recent_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>


	</div>
	<!-- 	End Recent book -->


	<hr>
	<!-- Start New Book -->

	<div class="container">
		<h1 class="text-center">New Book</h1>
		<div class="row">


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
								}%>
							
							 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
								
								 <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>












		</div>

		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>


	</div>
	<!-- 	End New book -->



	<hr>



	<!-- Start old Book -->

	<div class="container">
		<h1 class="text-center">Old Book</h1>
		<div class="row">
		<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>Category:<%=b.getBookCategory() %></p>
<div class="row">
						 <a
								href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
				}
			%>






	

		</div>

		<div class="text-center mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>


	</div>
	<!-- 	End Old book -->

	<%@include file="all_Components/footer.jsp"%>
</body>
</html>