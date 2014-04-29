package com.rue.servlet;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.rue.bean.Alerte;
import com.rue.pmf.PMF;



public class LesAlertes extends HttpServlet {

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			UserService userService = UserServiceFactory.getUserService();
	        PersistenceManager pm = PMF.get().getPersistenceManager();        
	        
	        String query =  "select from " + Alerte.class.getName() +
	        				" order by date desc";
		//NEW--
	        String alertes2="";
		//----
		
	        try{           
	    	        List<Alerte> alertes = (List<Alerte>)pm.newQuery(query).execute();
	    	
	    	//NEW--
	    	// On parcours la liste des alertes que l'on vient de recuperer et on la concatene dans un String avec un séparateur
	    	        for (Alerte alerte : alertes) {
		    	    	alertes2=alertes2+alerte.getCoord();
		    	    	alertes2=alertes2+"|";		    	    	
		    	}
			request.setAttribute("alertes2",alertes2);
	    	//----
	    	        request.setAttribute("alertes", alertes);
	    	    
	            } finally {
	                pm.close();
	            }
	        
	this.getServletContext().getRequestDispatcher( "/WEB-INF/lesalertes.jsp" ).forward( request, response );
	}
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		UserService userService = UserServiceFactory.getUserService();
        PersistenceManager pm = PMF.get().getPersistenceManager();        
        
        String query =  "select from " + Alerte.class.getName() +
        				" order by date";
        
        try{           
    	        List<Alerte> alertes = (List<Alerte>)pm.newQuery(query).execute();
    	        request.setAttribute("alertes", alertes);
            }
            finally{
                pm.close();
            }
        
this.getServletContext().getRequestDispatcher( "/WEB-INF/lesalertes.jsp" ).forward( request, response );
}
}

