<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Customers List</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous"> -->
<style>
   table {
   margin:10px;
 border-collapse: collapse;
 width: 100%;
}

th, td {
font: 12px Arial
 border: 2px solid black;
 text-align: left;
}
th {
    background-color:#00FF00;
    color: white;
}
tr:nth-child(even) {
    background-color: darkgrey;
}
</style>
</head>
<body>
	<div class="container">
		<div
			style="width: 60%; font-size: 30px; padding: 10px; background-color: #00FF00; margin: auto;">
			<h3 style="color: #FFFFFF">Customer Relationship Management</h3>
		</div>
		<div style="width: 60%;padding: 10px;margin: auto;">
			<a href="/CustomerMgmt/customers/add"
				style="font: bold 15px Arial; text-decoration: none; background-color: #EEEEEE; color: #333333; padding: 2px 6px 2px 6px; border-top: 1px solid #CCCCCC; border-right: 1px solid #333333; border-bottom: 1px solid #333333; border-left: 1px solid #CCCCCC;">Add
				Customer</a>
			<table class="table table-bordered table-striped">
				<thead class="thead-dark">
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customerModel}" var="customer">
						<tr>
							<td><c:out value="${customer.firstname}"></c:out></td>
							<td><c:out value="${customer.lastname}"></c:out></td>
							<td><c:out value="${customer.email}"></c:out></td>
							<td><a
								href="/CustomerMgmt/customers/update?id=${customer.id}"
								class="btn btn-info btn-sm">Update</a> <a
								href="/CustomerMgmt/customers/delete?id=${customer.id}"
								class="btn btn-danger btn-sm"
								onclick="if(!(confirm('Are you sure to delete this customer?'))) return false">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>