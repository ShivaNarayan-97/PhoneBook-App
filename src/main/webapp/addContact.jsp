<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Add Contact</title>
		<%@include file="component/allCSS.jsp" %>
	</head>
	<body>
		<%@include file="component/navbar.jsp" %>
		
		<% 
			if(user == null){
				session.setAttribute("invalidMsg", "Login Please...");
				response.sendRedirect("login.jsp");
			}
		%>
		
		<div class="container-fluid">
			<div class="row p-5">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						<h3 class="text-center text-success">Add Contact Page</h3>
						
						<% 
							String successMsg = (String) session.getAttribute("succMsg"); 
							
							if(successMsg != null)
							{
							%>
								<p class="text-success text-center"><%=successMsg %></p>
							<%
							session.removeAttribute("succMsg");
							}
						%>
						
						<%
							String failedMsg = (String) session.getAttribute("failedMsg"); 
						
							if(failedMsg != null)
							{%>
								<p class="text-danger text-center"><%=failedMsg %></p>
							<%
							session.removeAttribute("failedMsg");
							}
						%>
						
						<form action="addContact" method="post">
							
							<%
								if(user != null){%>
									<input type="hidden" value="<%=user.getId()%>" name="userid">
								<%}
							%>						
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
								<label for="exampleInputEmail1">Enter Phone no</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phno">
							</div>

							<div class="form-group">
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3" placeholder="Enter About" name="about"></textarea>
							</div>

							<div class="container text-center">
								<button type="submit" class="btn btn-success add"><span class="font-weight-bold">Save Contact</span></button>
							</div>
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>