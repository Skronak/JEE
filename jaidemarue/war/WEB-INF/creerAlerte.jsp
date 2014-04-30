<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();%>
<jsp:include page="menu.jsp"/>
<jsp:include page="modal.jsp" />


<!-- Script de geolocalisation-->
<script type="text/javascript" src="js/geoloc.js"></script>

<!-- onsubmit="verifFileExtension('uploadedFile',extensionsValides)" -->
	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="position:absolute; height:100%;width:100%;z-index: 1;"></div>
	
	<!-- Integration du formulaire --> 
	<div style="background-color:white;float:left; position:relative; height:100%;width:36%;z-index:2">
		<p class="bg-danger">${ form.resultat }</p>
		<form  action="<%= blobstoreService.createUploadUrl("/alerte") %>" name="formYo" method="post" enctype="multipart/form-data">
	               <fieldset>
	                    <c:import url="inc_alerte_form.jsp" />
	                </fieldset>
	                <button type="button" onclick='verifFileExtension("uploadedFile", extensionsValides)' class="btn btn-primary">
					  <i class="glyphicon glyphicon-send icon-withe"></i>  Envoyer
					</button>
					<button type="reset" class="btn btn-default">
					  <i class="glyphicon glyphicon-remove-circle"></i>  Remettre à zéro
					</button>
	     </form>
	  		<span id="text_latlng" hidden="hidden">Pas de coordonnée actuelle</span>
	</div>
	
	<!-- scipt JS validation image -->
	<script language="javascript">

	    extensionsValides=new Array('jpg','png','jpeg','gif');
	
	    function getExtension(filename)
	    {
	        var parts = filename.split(".");
	        return (parts[(parts.length-1)]);
	    }    
	
	
	    // vérifie l'extension d'un fichier uploadé
	    // champ : id du champ type file
	    // listeExt : liste des extensions autorisées
	    function verifFileExtension(champ,listeExt){
		
			filename = document.getElementById(champ).value.toLowerCase();
			fileExt = getExtension(filename);
			for (i=0; i<listeExt.length; i++)
			{
				if ( fileExt == listeExt[i] ) 
				{
					 document.formYo.submit();
					 var ok=true;

				}
	    	}
			if(!ok){
				alert("Votre image doit être au format png, jpg ou gif");
			}
			
	    }
	</script>
</body>


</html>