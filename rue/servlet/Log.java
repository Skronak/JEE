package com.rue.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Log extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7168810584495989748L;

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		this.getServletContext().getRequestDispatcher( "/WEB-INF/Log.jsp" ).forward( request, response );
	}
}
