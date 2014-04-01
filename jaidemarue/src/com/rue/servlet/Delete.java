package com.rue.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.jdo.PersistenceManager;

import com.google.appengine.api.users.User;
import com.rue.bean.Alerte;
import com.rue.pmf.PMF;



public class Delete extends HttpServlet {
	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	    UserService userService = UserServiceFactory.getUserService();
	    User user = userService.getCurrentUser();
		// Creation de l'entite persistante
        PersistenceManager pm = PMF.get().getPersistenceManager();
        
/*        String query =  "select from " + Alerte.class.getName() +
           " where key == "+ id +
           " parameters com.google.appengine.api.users.User ownerParam" +
           " order by date";
        Alerte alerte = (Alerte)pm.newQuery(query).execute(user);
        
  */

		Alerte alrt = (Alerte) request.getSession().getAttribute("alerte");
		try {
			pm.currentTransaction().begin();

			// We don't have a reference to the selected Product.
			// So we have to look it up first,
			alrt = pm.getObjectById(Alerte.class, alrt.getKey());
			pm.deletePersistent(alrt);

			pm.currentTransaction().commit();
		} catch (Exception ex) {
			pm.currentTransaction().rollback();
			throw new RuntimeException(ex);
		} finally {
			pm.close();
		}
       
        this.getServletContext().getRequestDispatcher("/WEB-INF/mesalertes.jsp").forward( request, response );

	}
}


