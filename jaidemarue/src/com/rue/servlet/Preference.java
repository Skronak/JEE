package com.rue.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;

import javax.jdo.PersistenceManager;

import com.google.appengine.api.users.User;
import com.rue.bean.UserPreference;
import com.rue.pmf.PMF;

public class Preference extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
	        UserService userService = UserServiceFactory.getUserService();
	        User user = userService.getCurrentUser();
            PersistenceManager pm = PMF.get().getPersistenceManager();
            
    		String street = request.getParameter("street").trim();
    		String query =  "select from " + UserPreference.class.getName() +
    				" where owner == ownerParam" +
    				" parameters com.google.appengine.api.users.User ownerParam";
    		List<UserPreference> pref = (List<UserPreference>)pm.newQuery(query).execute(user);
    		System.out.println(pref);
    		
    		//Cas de la création d'une preference
    		if(!pref.isEmpty()){
                pref.get(0).setStreet(street);
            	pm.close();
            	
            }else{
            UserPreference npref=new UserPreference();
    		npref.setOwner(user);
            npref.setStreet(street);
                try{           
	                //sauvegarde notre objet "alerte"
	                pm.makePersistent(npref);
	            }
	            finally{
	                pm.close();
	            }
            }
    		this.getServletContext().getRequestDispatcher( "/lesalertes" ).forward( request, response );
   }
}