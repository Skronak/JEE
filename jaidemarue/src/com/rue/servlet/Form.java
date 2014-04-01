package com.rue.servlet;

import com.google.appengine.api.blobstore.*;
import com.google.appengine.api.images.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.rue.bean.Alerte;
import com.rue.bean.form_alerte;
import com.rue.pmf.PMF;
import com.google.appengine.api.users.*;

public class Form extends HttpServlet {

		public static final String ATT_ALERTE = "alerte";
		    public static final String ATT_FORM = "form";
		    public static final String VUE_SUCCES = "/WEB-INF/afficherAlerte.jsp";
		    public static final String VUE_FORM = "/WEB-INF/creerAlerte.jsp";
		    public static final String VUE_NONCONNECTE = "/WEB-INF/loggin.jsp";
		    UserService userService = UserServiceFactory.getUserService();
		    
		    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		    	if (userService.getCurrentUser() == null) { 
		    	   	/* � la r�ception d'une requ�te GET, simple affichage du formulaire */
			        this.getServletContext().getRequestDispatcher( VUE_NONCONNECTE ).forward( request, response );
			    } else {
			        this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
			    }
		    }

		    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		     DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		     BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		     ImagesService imagesService = ImagesServiceFactory.getImagesService();

		     //========================================================
		     //					Traitement de l'image
		     //========================================================
		     // Récupère une Map de tous les champs d'upload de fichiers
		     Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
		     // Récupère la liste des fichiers uploadés dans le champ "uploadedFile"
		     List<BlobKey> blobKeys = blobs.get("uploadedFile");
		     // Récupère la clé identifiant du fichier uploadé dans le Blobstore (à sauvegarder)
		     //String cleFichierUploade = blobKeys.get(0).getKeyString();
		     String urlImage = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(blobKeys.get(0)));   
		     
		     
		     /* Pr�paration de l'objet formulaire */
		        form_alerte form = new form_alerte();

		        /* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
		        Alerte alerte = form.creerAlerte( request );
		        alerte.setImage(urlImage);

		        /* Ajout du bean et de l'objet m�tier � l'objet requ�te */
		        request.setAttribute( ATT_ALERTE, alerte );
		        request.setAttribute( ATT_FORM, form );

		        if ( form.getErreurs().isEmpty() ) {
		            /* Si aucune erreur, alors affichage de la fiche r�capitulative */
		            //UTILE POUR AFFICHAGE MARKERS DANS JS 
		            /*
		        	String coord =alerte.getCoord();
		            coord = coord.replace("(","") ;
		            coord = coord.replace(")","") ;
		            String[] latlong= coord.split(","); 
		            */
		            PersistenceManager pm = PMF.get().getPersistenceManager();
		            try{           
		                //sauvegarde notre objet "alerte"
		                pm.makePersistent(alerte);
		            }
		            finally{
		                pm.close();
		            }
		           
		            this.getServletContext().getRequestDispatcher( VUE_SUCCES ).forward( request, response );
		                       
		        } else {
		            /* Sinon, r�-affichage du formulaire de cr�ation avec les erreurs */
		            this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
		        }
		    }
		}