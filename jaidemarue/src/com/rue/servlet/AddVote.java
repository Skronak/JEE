package com.rue.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.KeyFactory;

import javax.jdo.PersistenceManager;

import com.rue.bean.Alerte;
import com.rue.pmf.PMF;

public class AddVote extends HttpServlet {
	
<<<<<<< HEAD
    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
=======
     	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
	
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
>>>>>>> aee371de3f07b668f2535e5f153b7ba3297b02c0
		System.out.println("Addvote: doget");
		PersistenceManager pm =  PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			System.out.println(request.getParameter("id"));
			Alerte alerte = pm.getObjectById(Alerte.class, KeyFactory.stringToKey(request.getParameter("id")));
			System.out.println(alerte.getVote());
			alerte.setVote();
			
			// Ajout de l'utilisateur dans la liste des votants
			alerte.setVotant(user);
<<<<<<< HEAD
			
=======

>>>>>>> aee371de3f07b668f2535e5f153b7ba3297b02c0
			System.out.println(alerte.getVote());
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
			this.getServletContext().getRequestDispatcher( "/lesalertes" ).forward( request, response );
	}
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		System.out.println("Addvote: dopost");
		PersistenceManager pm =  PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			Alerte alerte = pm.getObjectById(Alerte.class, KeyFactory.stringToKey(request.getParameter("id")));
			System.out.println(alerte.getVote());
			alerte.setVote();
			
			// Ajout de l'utilisateur dans la liste des votants
			alerte.setVotant(user);
			
			System.out.println(alerte.getVote());
			pm.currentTransaction().commit();
			
		    // Stock l'id de l'alerte en cookie
		    /*
		    Cookie ck = new Cookie(request.getParameter("id"), request.getParameter("id"));
		    ck.setMaxAge(30 * 60);
		    response.addCookie(ck);
		    */

		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
			this.getServletContext().getRequestDispatcher( "/lesalertes" ).forward( request, response );
	}
}


