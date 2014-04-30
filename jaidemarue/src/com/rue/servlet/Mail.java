package com.rue.servlet;

import java.io.IOException;
	import java.util.Properties;
	import javax.servlet.http.*;
	import javax.mail.*;
	import javax.mail.internet.*;
	
@SuppressWarnings("serial")

public class Mail extends HttpServlet {	
	
	//Pour utiliser, envoyer des attributs "message" et "recepteur" à la requête
	
	 public void doGet(HttpServletRequest request, HttpServletResponse resp) throws IOException {
	        try {
	            Properties props = new Properties();
	            Session session = Session.getDefaultInstance(props, null);
	            
	            String message = request.getAttribute("message").toString();
	            String recepteur = request.getAttribute("recepteur").toString();
	            	            
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
