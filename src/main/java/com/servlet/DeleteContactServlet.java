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

@WebServlet("/delete")
public class DeleteContactServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("cid"));
		
		ContactDAO dao = new ContactDAO(DBConnect.getConn());
		boolean f = dao.deleteContactById(id);
		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("succMsg", "Contact deleted successfully");
			resp.sendRedirect("viewContact.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("viewContact.jsp");
		}
	}
}
