package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_book")
public class DeleteOldbook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	try {
		String em=req.getParameter("em");
		int id=Integer.parseInt(req.getParameter("id"));
		BookDAOImpl dao=new  BookDAOImpl(DBConnect.getConn());
		boolean f=dao.oldBookDeleteByUser(em, "Old",id);
		HttpSession session=req.getSession();
		if(f)
		{
			session.setAttribute("succMsg", "Book Deleted Successfully");
			resp.sendRedirect("old_book.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("old_book.jsp");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}
	

}
