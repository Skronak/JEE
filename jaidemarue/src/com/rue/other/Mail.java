package com.rue.other;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import java.util.Date;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.rue.bean.Alerte;
import com.rue.bean.UserPreference;
import com.rue.pmf.PMF;



public class Mail extends HttpServlet {

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			UserService userService = UserServiceFactory.getUserService();
	        PersistenceManager pm = PMF.get().getPersistenceManager();        
	        
	       
	        String datej = new Date().toString();
	        
	        
	        String query =  "select from " + Alerte.class.getName() +
	        				" where date=="+datej;
	        
	        String query2= "select from" +UserPreference.class.getName();
	        
	    	List<Alerte> alertes = (List<Alerte>)pm.newQuery(query).execute();
	    	List<UserPreference> preferences = (List<UserPreference>)pm.newQuery(query2).execute();
	    	        
	                pm.close();
	            
	        
	        // tri de requetes
	        
	        ArrayList<String> mail=new ArrayList<String>();
	        
	        // parcours de liste alerte
	        for(int i=0; i==alertes.size();i++){
	        	Alerte a=alertes.get(i);
	        	
	        	//parcours liste preference
	        	for(int j=0; j== preferences.size();i++){
	        		UserPreference pref=preferences.get(j);
	        		
	        		if (a.getAdresse().equals(pref.getStreet())){
	        			mail.add(pref.getOwner().toString());
	        		}
	        	}
	        }// fin parcours, les adresses auxquelles envoyer sont dans mail
	        
	        // suppression des doublons
	        
	        ArrayList<String> newTab=new ArrayList<String>();
			
			for(int i = 0; i < mail.size(); i++)
		    {
		      if(!newTab.contains(mail.get(i))){
		    	newTab.add(mail.get(i));  
		      }
		    } 
			mail=newTab;
			
	        // envois de mail proprement dit
			for(int i = 0; i < mail.size(); i++){
		        try {
		            Properties props = new Properties();
		            Session session = Session.getDefaultInstance(props, null);
		            
		            String message = "Une nouvelle alerte a été déposée près de chez vous !";
		            String recepteur = mail.get(i);
		            	            
		            Message msg = new MimeMessage(session);
		            msg.setFrom(new InternetAddress("admin@monapplication.com", "Administrateur"));
		            msg.addRecipient(Message.RecipientType.TO,
		                             new InternetAddress(recepteur));
		            msg.setSubject("Nouvelle alerte près de chez vous");
		            msg.setText(message);
		            Transport.send(msg);
		        } catch (MessagingException e) {
		            e.printStackTrace();
		        }
			}
	}	
}

