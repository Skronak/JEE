package com.rue.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.jdo.PersistenceManager;

import com.google.appengine.api.users.User;
import com.rue.bean.Alerte;
import com.rue.pmf.PMF;

public class MesAlertes extends HttpServlet {
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		//Affichage des alertes de l'utilisateur
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();
	    if (user != null) {
	        PersistenceManager pm = PMF.get().getPersistenceManager();        
	        
	        String query =  "select from " + Alerte.class.getName() +
	           " where owner == ownerParam" +
	           " parameters com.google.appengine.api.users.User ownerParam" +
	           " order by date";
            try{           
    	        List<Alerte> alertes = (List<Alerte>)pm.newQuery(query).execute(user);
    	        System.out.println(alertes);
    	        request.setAttribute("alertes", alertes);
            }
            finally{
                pm.close();
            }
	    }
	    
		this.getServletContext().getRequestDispatcher( "/WEB-INF/mesalertes.jsp" ).forward( request, response );
	}
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		//Suppression d'une alerte
		PersistenceManager pm =  PMF.get().getPersistenceManager();
		try {
			pm.currentTransaction().begin();
			Alerte alerte = pm.getObjectById(Alerte.class,  KeyFactory.stringToKey(request.getParameter("id")));
			pm.deletePersistent(alerte);
			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
			this.getServletContext().getRequestDispatcher( "/WEB-INF/deleteAlerte.jsp" ).forward( request, response );
	}
}


