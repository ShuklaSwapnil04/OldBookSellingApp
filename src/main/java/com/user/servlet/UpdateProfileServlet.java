package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// TODO Auto-generated method stub
	try {
		int id=Integer.parseInt(req.getParameter("id"));
		
		String name=req.getParameter("fname");
		String email=req.getParameter("email");
		String phno=req.getParameter("phno");
		String password=req.getParameter("password");
		
		User us=new  User();
		us.setId(id);
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phno);
		
		HttpSession session=req.getSession();
		
		UserDAOImpl dao=new UserDAOImpl(DBConnect.getConn());
		
		boolean f=dao.checkPassword(id, password);
		if(f)
		{
			boolean f2=dao.updateProfile(us);
			if(f2)
			{
				session.setAttribute("succMsg","User Updated Succesfully");
		        resp.sendRedirect("edit_profile.jsp");	
			}
			else
			{
				session.setAttribute("failedMsg","Something Went Wrong");
		        resp.sendRedirect("edit_profile.jsp");
			}
		}
		else
		{
			session.setAttribute("failedMsg","Password Incorrect");
	        resp.sendRedirect("edit_profile.jsp");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	}}

	