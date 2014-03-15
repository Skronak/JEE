<%@ page pageEncoding="UTF-8" %>
<jsp:include page="menu.jsp"/>

<div style="background-color: white;float:left; position:absolute; height:100%;width:200px;z-index:1">
	<p class="bg-danger">${ form.resultat }</p>
		<form method="post" action="<c:url value="/alerte"/>">
               <fieldset>
                    <legend>Informations alerte</legend>
                    <c:import url="inc_alerte_form.jsp" />
                </fieldset>
                <input type="submit" class="btn btn-primary" value="Valider"/>
                <input type="reset" class="btn btn-default" value="Remettre à zéro" /> <br />
        </form>
  		<span id="text_latlng">Pas de coordonnée actuelle</span>
</div>

		<!-- Integration de la google map -->      		
        <div id="map-canvas" style="float:right; position:relative; height:100%;width:80%;z-index: 1;"></div>
		<!-- logo du site
		<div style="float:left; position:relative; height:20%;width:20%;z-index:8">
			<a href="/Jaidemarue.html"><img src="/img/logo.png" width=100% height=20% style="margin-left:250%;"></a>  
		</div>-->
</body>


</html>