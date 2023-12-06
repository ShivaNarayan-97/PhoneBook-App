<%@page import="com.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="#"><i class="fa fa-phone"></i>
		<span class="font-weight-bold">PhoneBook</span></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="addContact.jsp"><i class="fa-solid fa-circle-plus"></i>
					Add Contact</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="viewContact.jsp"><i class="fa-solid fa-eye"></i> View
					Contact</a></li>
		</ul>

		<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
		%>
		<form class="form-inline my-2 my-lg-0">
			<a href="login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> <span class="font-weight-bold">Login</span></a> <a
				href="register.jsp" class="btn btn-danger ml-2"><i
				class="fa-solid fa-user"></i> <span class="font-weight-bold">Register</span></a>
		</form>
		<%
		} else {
		%>
		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-success"><span class="font-weight-bold"><%=user.getName()%></span></button>
			<a data-toggle="modal" data-target="#exampleModalCenter"
				class="btn btn-danger ml-2 text-white"><span class="font-weight-bold">Logout</span></a>
		</form>
		<%
		}
		%>
	</div>

	<!-- Logout Popup -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Logout PhoneBook</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h6>Do you want to logout?</h6>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal"><span class="font-weight-bold">Close</span></button>
					<a href="logout" class="btn btn-primary"><span class="font-weight-bold">Logout</span></a>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</nav>

