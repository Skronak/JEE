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



public class BestAlertes extends HttpServlet {

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			UserService userService = UserServiceFactory.getUserService();
	        PersistenceManager pm = PMF.get().getPersistenceManager();        
	        
	        String query =  "select from " + Alerte.class.getName() +
	        				" order by vote desc";
	        
	        try{        
        		javax.jdo.Query query1 = pm.newQuery(query);
        		query1.setRange(0,4);
    	        List<Alerte> alertes = (List<Alerte>) query1.execute();
    	        request.setAttribute("alertes", alertes);
            }
            finally{
                pm.close();
            }
	        
	this.getServletContext().getRequestDispatcher( "/WEB-INF/bestalertes.jsp" ).forward( request, response );
	}
	
	public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	}
}

