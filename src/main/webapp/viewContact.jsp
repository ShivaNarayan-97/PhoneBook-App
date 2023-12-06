<%@page import="com.entity.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.DAO.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>View Contact</title>	
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

		<%
			String succMsg = (String)session.getAttribute("succMsg");
			if(succMsg != null){%>
				<div class="alert alert-success text-center" role="alert"><%=succMsg %></div>
			<%
			session.removeAttribute("succMsg");
			}
			%>
	
		<%
			String failedMsg = (String) session.getAttribute("failedMsg");
			if (failedMsg != null) {
			%>
			<p class="text-danger text-center"><%=failedMsg%></p>
			<%
			session.removeAttribute("failedMsg");
			}
		%>
	
		<div class="container">
				<div class="row p-4">
					
					<%
					if (user != null) {
						ContactDAO dao = new ContactDAO(DBConnect.getConn());
						List<Contact> contact = dao.getAllContact(user.getId());
	
						for (Contact c : contact) {%>
						<div class="col-md-4 p-3">
							<div class="card crd-ho">
								<div class="card-body">
									<h6><span class="font-weight-bold">Name:</span>
										
										<%=c.getName()%></h6>
									<p><span class="font-weight-bold">Ph No:</span>
										
										<%=c.getPhone()%></p>
									<p><span class="font-weight-bold">Email:</span>
										
										<%=c.getEmail()%></p>
									<p><span class="font-weight-bold">About:</span>
										
										<%=c.getAbout()%></p>
									<div class="text-center">
										<a href="edit.jsp?cid=<%=c.getId() %>" class="btn btn-success edit"><span class="font-weight-bold">Edit</span></a>
										<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger delete"><span class="font-weight-bold">Delete</span></a>
									</div>
								</div>
							</div>
							</div>
						<%}
					}
					%>
					
				</div>
			</div>
		
	</body>
</html>