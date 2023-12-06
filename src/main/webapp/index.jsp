<%@page import="com.entity.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.conn.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Phonebook App</title>
		<%@include file="component/allCSS.jsp" %>
		<style type="text/css">
			.back-img{
				background: url("img/phonebook.jpg");
				width: 100%;
				height: 85vh;
				background-repeat: no-repeat;
				background-position: center;
				}
		</style>
	</head>
	<body style="background-color: #FFF">
		<%@include file="component/navbar.jsp" %>
		
		<div class="container-fluid back-img text-center">
			<h1 class="p-2">Welcome to PhoneBook App</h1>
		</div>
	</body>
	
	<%@include file="component/footer.jsp" %>
</html>