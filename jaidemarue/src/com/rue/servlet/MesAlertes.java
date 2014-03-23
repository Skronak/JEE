package com.rue.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class MesAlertes extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) {
		try {
			DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			UserService userService = UserServiceFactory.getUserService();

			// Demande tous les 5 derniers messages triés par date décroissante
			Query q = new Query("Alerte").addSort("date", SortDirection.DESCENDING);
			List<Entity> results = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(5));

			req.setAttribute("alertes", results);
			this.getServletContext().getRequestDispatcher("/WEB-INF/mesalertes.jsp").forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}