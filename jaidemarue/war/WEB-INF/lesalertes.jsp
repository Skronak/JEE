<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.rue.bean.Alerte" %>
<%@ page import="com.google.appengine.api.datastore.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.users.User"%>
<jsp:include page="menu.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Script de googlemap-->
	<script type="text/javascript" src="js/afficher.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="Jaidemarue.css">
	<title>Les alertes</title>
</head>
<!-- Remplacer le scriplet par JSTL que l'on vient de voir !!!! -->
<!-- <c:forEach items="${alerte}" var="news"> -->
<!-- 	{alerte.vote}-->
<!-- </c:forEach> -->
		<%	
			UserService userService = UserServiceFactory.getUserService();
        	User user = userService.getCurrentUser();
			int a=0;
			List<Alerte> alertes = (List<Alerte>) request.getAttribute("alertes");

			String alertes2 = (String)request.getAttribute("alertes2");
			String ok="";
			int temp=0;
			String coord;
			<!-- J'AVOUE C'EST MOCHE MAIS CA MARCHE --> 
			
			for (Alerte alerte : alertes) {
				<!-- CETTE LIGNE POURRAIT REMPLACER TT CE QU'IL Y A DANS CE FOR (en mieux) -->   
				//ok=ok+alerte.toMap();
				if(temp==0){
					coord= alerte.getCoord();
					int longueur=coord.length()-1;
					coord=coord.substring(1,longueur);
					ok=ok+"["+coord+"]";
				}
				else{
					coord= alerte.getCoord();
					int longueur=coord.length()-1;
					coord=coord.substring(1,longueur);
					ok=ok+",["+coord+"]";
				}
				temp++;
			}%>

<body onload="initialize(ok)">

	<!-- Integration de la google map -->      		
	<div id="map-canvas" style="float:top; position:absolute; height:63%;width:100%;z-index: 1;"></div>
	
	<!-- PR TESTER :::A METTRE ligne 55 (AVANT LA GOOGLE MAP DANS LE CODE) + ENLEVER onload="initialize(ok)" du body  -->
	<a href=# onClick="alert('<%=ok%>')>CLICK ICI POUR AFFICHER LE CONTENU DU STRING</a>
	
	<!-- Affichage des alertes -->      		
	<div style="background-color:white;margin-top:40%;float:bottom; position:absolute; height:100%;width:100%;z-index:2">
		<h1>Liste des alertes :</h1>	

						
<%			for (Alerte alerte : alertes) {
				a++;
		%>
			<%if (a==3) { %>
			<div class="row">
			<% } %>
			  <div class="col-sm-6 col-md-4">
				 <div class="thumbnail">
			      <img src="<%=alerte.getImage()%>" alt="...">
			      <div class="caption">
			        <h3><%=alerte.getOwner()%></h3>
			        <p><table>
					<tr>
						<td>Adresse:</td>
						<td><%=alerte.getAdresse()%></td>
					</tr>
					<tr>
						<td>Date:</td>
						<td><%=alerte.getDate()%></td>
					</tr>
					<tr>
						<td>Type:</td>
						<td><%=alerte.getType()%></td>
					</tr>
					<tr>
						<td>Priorité:</td>
						<td><%=alerte.getPriorite()%></td>
					</tr>
					<tr>
						<td>Commentaire:</td>
						<td><%= alerte.getCommentaire()%></td>
					</tr>
					<tr>
						<td>Vote(s): </td>
						<td><%= alerte.getVote()%></td>
					</tr>
					<tr>
						<td>Coordonnées:</td>
						<td><%= alerte.getCoord()%></td>
					</tr>
				</table>
			        <p style="text-align: left;float:left;margin-right:5%;"><a href="#" class="btn btn-primary" role="button">Localiser</a></p>
			        
			        <!--  On test l'existence du cookie sur le vote pour savoir si on a deja voté -->
				<% 
				Bool affiche =true;
				for(int i = 0; i <= alerte.GetVote.lenght; i++){
					if alerte.GetVote!=user {
						affiche=false
					}
				}
				If affiche {%>
				        <p style="text-align: left;"><a href="/addVote?id=<%=alerte.getKey()%>" class="btn btn-Info" role="button">+1</a></span>
				<%}%>				        
			        </p>
			      </div>
			    </div>
			</div>
		<%if (a==3) { %>
		</div>
		<% }
	}
	%>
</div>
</body>
</html>
