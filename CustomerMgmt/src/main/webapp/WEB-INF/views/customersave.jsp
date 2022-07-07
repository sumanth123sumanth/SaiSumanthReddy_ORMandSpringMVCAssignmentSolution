<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Save Customer</title>

</head>
<body>
	<div class="container">
		<div
			style="width: 60%; font-size: 30px; padding: 10px; background-color: #00FF00; margin: auto;">
			<h3 style="color: #FFFFFF">Customer Relationship Management</h3>
		</div>
		<div style="width: 60%; padding: 10px; margin: auto;">
			<h2>Save Customer</h2>
			<form action="/CustomerMgmt/customers/save" method="post">
				<input type="hidden" name="id" value="${customer.id}">
				<div style="margin:10px;">
					<label for="firstname" style="margin-right: 10px">First
						Name:</label> <input type="text" name="firstname"
						value="${customer.firstname}" id="firstname"
						placeholder="First Name" class="form-control mb-4 col-4">
				</div>
				<div style="margin:10px;">
					<label for="lastname" style="margin-right: 10px">Last Name:</label>
					<input type="text" name="lastname" value="${customer.lastname}"
						id="lastname" placeholder="Last Name"
						class="form-control mb-4 col-4">
				</div>
				<div style="margin:10px;">
					<label for="email" style="margin-right: 42px">Email:</label> <input
						type="text" name="email" value="${customer.email}" id="email"
						placeholder="Email" class="form-control mb-4 col-4">
				</div>
				<button type="submit" class="btn btn-info col-2">Save</button>
			</form>

			<a href="/CustomerMgmt/customers/list">Back to Customers List</a>
		</div>
	</div>
</body>
</html>