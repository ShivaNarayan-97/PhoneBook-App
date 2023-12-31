package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.conn.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
//		System.out.println(email + " " + password);
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		User user = dao.loginUser(email, password);
		
		HttpSession session = req.getSession();
		if (user != null) {
			session.setAttribute("user", user);
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("invalidMsg", "Invalid credentials");
			resp.sendRedirect("login.jsp");
		}
	}
}
