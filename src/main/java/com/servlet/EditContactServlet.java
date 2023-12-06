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

@WebServlet("/update")
public class EditContactServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String about = req.getParameter("about");
		
		Contact contact = new Contact();
		contact.setId(cid);
		contact.setName(name);
		contact.setEmail(email);
		contact.setPhone(phno);
		contact.setAbout(about);
		ContactDAO dao = new ContactDAO(DBConnect.getConn());
		boolean f = dao.updateContact(contact);
		
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("succMsg", name + " updated");
			resp.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong on server");
			resp.sendRedirect("edit.jsp?cid=" + cid);
		}
	}
}
