<%@ page pageEncoding="UTF-8" %>
<jsp:include page="menu.jsp"/>
<!-- Script de geolocalisation-->
<script type="text/javascript" src="js/geoloc.js"></script>

	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="float:top; position:absolute; height:63%;width:100%;z-index: 1;"></div>
	
	<!-- Integration du formulaire --> 
	<div style="background-color:white;margin-top:43%;float:bottom; position:relative; height:40%;width:100%;z-index:2">
		<p class="bg-danger">${ form.resultat }</p>
			<form method="post" action="<c:url value="/alerte"/>">
	               <fieldset>
	                    <c:import url="inc_alerte_form.jsp" />
	                </fieldset>
	                <input type="submit" class="btn btn-primary" value="Valider"/>
	                <input type="reset" class="btn btn-default" value="Remettre à zéro" /> <br />
	        </form>
	  		<span id="text_latlng">Pas de coordonnée actuelle</span>
	</div>

</body>


</html>