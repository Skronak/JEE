package nantes.server;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.google.appengine.api.users.*;

public final class form_alerte {
    private static final String CHAMP_ADRESSE   = "adresseAlerte";
    private static final String CHAMP_TYPE = "typeAlerte";
    private static final String CHAMP_IMAGE = "imageAlerte";
    private static final String CHAMP_PRIORITE     = "prioriteAlerte";
    private static final String CHAMP_COMMENTAIRE     = "commentaireAlerte";
    

    private String              resultat;
    private Map<String, String> erreurs         = new HashMap<String, String>();

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Alerte creerAlerte( HttpServletRequest request ) {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
    	
    	String adresse = getValeurChamp( request, CHAMP_ADRESSE );
    	String type = getValeurChamp( request, CHAMP_TYPE );
    	String image = getValeurChamp( request, CHAMP_IMAGE );
    	String priorite = getValeurChamp( request, CHAMP_PRIORITE );
    	String commentaire = getValeurChamp( request, CHAMP_COMMENTAIRE );

        Alerte alerte = new Alerte();

        alerte.setAuteur( user.getNickname() );
        alerte.setDate( new Date() );
        alerte.setStatut( "Non traité" );
        alerte.setCommentaire( commentaire );
        alerte.setPriorite( priorite );
        
        //adresse
        try {
            validationAdresse( adresse );
        } catch ( Exception e ) {
            setErreur( CHAMP_ADRESSE, e.getMessage() );
        }
        alerte.setAdresse( adresse );

        try {
            validationType( type );
        } catch ( Exception e ) {
            setErreur( CHAMP_TYPE, e.getMessage() );
        }
        alerte.setType( type );

        try {
            validationImage( image );
        } catch ( Exception e ) {
            setErreur( CHAMP_IMAGE, e.getMessage() );
        }
        alerte.setImage( image );


        if ( erreurs.isEmpty() ) {
            resultat = "Succès de la création de l'alerte.";
        } else {
            resultat = "Échec de la création de l'alerte.";
        }

        return alerte;
    }

    private void validationAdresse( String adresse ) throws Exception {
        if ( adresse != null ) {
            if ( adresse.length() < 10 ) {
                throw new Exception( "L'adresse de l'alerte doit contenir au moins 10 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer une adresse." );
        }
    }

    private void validationType( String type ) throws Exception {
        if ( type != null) {
        	if ( type.length() < 2 ) {
	            throw new Exception( "Le type de l'alerte doit contenir au moins 2 caractères." );
	        }
        }else {
	            throw new Exception( "Merci d'entrer un type." );    
        }
    }

    private void validationImage( String image ) throws Exception {
        if ( image != null ) {
            if ( image.length() < 2 ) {
                throw new Exception( "L'image de l'alerte doit contenir au moins 2 caractères." );
            }
        } else {
            throw new Exception( "Merci d'entrer une image." );
        }
    }

    /*
     * Ajoute un message correspondant au champ spécifié à la map des erreurs.
     */
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }

}
