<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Affichage d'une alerte</title>
    </head>
    <body>
        <div id="corps">
		    <div class="alert alert-success"><h2 class="bg-success">${ form.resultat }</h2></div>
	    	<div style="text-align:center;size:20%;"><img src="/img/gok.png" alt="" /></div>
	    	<hr/>
		    <p>Owner : <c:out value="${ alerte.owner }"/></p>
            <p>Adresse : <c:out value="${ alerte.adresse }"/></p>
            <p>Date : <c:out value="${ alerte.date }"/></p>
            <p>Type : <c:out value="${ alerte.type }"/></p>
            <p>Image : <c:out value="${ alerte.image }"/></p>
            <p>Priorité : <c:out value="${ alerte.priorite }"/></p>
            <p>Commentaire : <c:out value="${ alerte.commentaire }"/></p>
        </div>
    </body>
</html>