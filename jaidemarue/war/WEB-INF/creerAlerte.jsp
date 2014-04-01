<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.google.appengine.api.blobstore.*" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();%>
<jsp:include page="menu.jsp"/>

<!-- Script de geolocalisation-->
<script type="text/javascript" src="js/geoloc.js"></script>

	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="position:absolute; height:100%;width:100%;z-index: 1;"></div>
	
	<!-- Integration du formulaire --> 
	<div style="background-color:white;float:left; position:relative; height:100%;width:36%;z-index:2">
		<p class="bg-danger">${ form.resultat }</p>
		<form action="<%= blobstoreService.createUploadUrl("/alerte") %>" method="post" enctype="multipart/form-data">
	               <fieldset>
	                    <c:import url="inc_alerte_form.jsp" />
	                </fieldset>
	                <button type="submit" class="btn btn-primary">
					  <i class="glyphicon glyphicon-send icon-withe"></i>  Envoyer
					</button>
					<button type="reset" class="btn btn-default">
					  <i class="glyphicon glyphicon-remove-circle"></i>  Remettre à zéro
					</button>
	     </form>
	  		<span id="text_latlng" hidden="hidden">Pas de coordonnée actuelle</span>
	</div>

</body>


</html>