package com.rue.servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.bean.Alerte;
import com.bean.form_alerte;
import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.SortDirection;

public class Form extends HttpServlet {

public static final String ATT_ALERTE = "alerte";
    public static final String ATT_FORM = "form";
    public static final String VUE_SUCCES = "/WEB-INF/afficherAlerte.jsp";
    public static final String VUE_FORM = "/WEB-INF/creerAlerte.jsp";

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* � la r�ception d'une requ�te GET, simple affichage du formulaire */
        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
     DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        
     /* Pr�paration de l'objet formulaire */
        form_alerte form = new form_alerte();

        /* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
        Alerte alerte = form.creerAlerte( request );

        /* Ajout du bean et de l'objet m�tier � l'objet requ�te */
        request.setAttribute( ATT_ALERTE, alerte );
        request.setAttribute( ATT_FORM, form );

        if ( form.getErreurs().isEmpty() ) {
            /* Si aucune erreur, alors affichage de la fiche r�capitulative */
            this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response );
           
           //creation de l'objet pour le stoker dans le datastore
           Entity alt = new Entity("Alerte");
           alt.setProperty("auteur", alerte.getAuteur());
           alt.setProperty("adresse", alerte.getAdresse());
           alt.setProperty("date", alerte.getDate());
           alt.setProperty("type", alerte.getType());
           alt.setProperty("image", alerte.getImage());
           alt.setProperty("statut", alerte.getStatut());
           alt.setProperty("priorite", alerte.getPriorite());
           alt.setProperty("commentaire", alerte.getCommentaire());
           datastore.put(alt);
        } else {
            /* Sinon, r�-affichage du formulaire de cr�ation avec les erreurs */
            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
        }
    }
}