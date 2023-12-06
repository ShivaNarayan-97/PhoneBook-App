<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Register</title>
		<%@include file="component/allCSS.jsp" %>
	</head>
	<body style="background-color: #f7faf8">
	
		<%@include file="component/navbar.jsp" %>

		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-body">
						<h3 class="text-center text-success">Registration Page</h3>
						
						<% 
							String successMsg = (String) session.getAttribute("sucss-msg"); 
							
							if(successMsg != null)
							{
							%>
								<p class="text-success text-center"><%=successMsg %></p>
							<%
							session.removeAttribute("sucss-msg");
							}
						%>
						
						<%
							String errorMsg = (String) session.getAttribute("error-msg"); 
						
							if(errorMsg != null)
							{%>
								<p class="text-danger text-center"><%=errorMsg %></p>
							<%
							session.removeAttribute("error-msg");
							}
						%>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name">
							</div>
						
							<div class="form-group">
								<label for="exampleInputEmail1">Email Address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Password</label> <input
									type="password" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="password">
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-primary"><span class="font-weight-bold">Register</span></button>
							</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<%@include file="component/footer.jsp" %>
</html>