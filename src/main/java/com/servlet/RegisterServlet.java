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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User u = new User(name, email, password);
		UserDAO dao = new UserDAO(DBConnect.getConn());
		boolean f = dao.userRegister(u);
		
		HttpSession session = req.getSession();
		
		if (f) {
			session.setAttribute("sucss-msg", "User Register Successfully...");
			resp.sendRedirect("register.jsp");
//			System.out.println("User Register Successfully...");
		}else {
			session.setAttribute("error-msg", "Something wrong on server...");
			resp.sendRedirect("register.jsp");
//			System.out.println("Something wrong on server...");
		}
		
	}
}
