package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ContactDAO;
import com.conn.DBConnect;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		int userId = Integer.parseInt(req.getParameter("userid"));
		
		Contact contact = new Contact(name, email, phno, about, userId);
		
		ContactDAO dao = new ContactDAO(DBConnect.getConn());
		boolean f = dao.saveContact(contact);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("succMsg", "Your contact saved");
			resp.sendRedirect("addContact.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong on server");
			resp.sendRedirect("addContact.jsp");
		}
	}
}
