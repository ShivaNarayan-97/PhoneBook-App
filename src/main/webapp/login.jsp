<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<%@include file="component/allCSS.jsp" %>
	</head>
	<body style="background-color: #f7faf8">
	
		<%@include file="component/navbar.jsp" %>

		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						<h3 class="text-center text-success">Login Page</h3>
						
						<%
							String invalidMsg = (String) session.getAttribute("invalidMsg");
							if(invalidMsg != null){%>
								<p class="text-danger text-center"><%=invalidMsg %></p>
							<%}
							session.removeAttribute("invalidMsg");
						%>
						
						<%
							String logMsg = (String) session.getAttribute("logMsg");
							if(logMsg != null){%>
								<p class="text-success text-center"><%=logMsg %></p>
							<%}
							session.removeAttribute("logMsg");
						%>
						
						<form action="login" method="post">
						
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
								<button type="submit" class="btn btn-primary"><span class="font-weight-bold">Login</span></button>
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