<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="menu.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Affichage d'une alerte</title>
        <link type="text/css" rel="stylesheet" href="<c:url value="/inc/style.css"/>" />
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
    </head>
    <body>
        <div id="corps">
		    <p class="bg-success">${ form.resultat }</p>
            <p>Auteur : <c:out value="${ alerte.auteur }"/></p>
            <p>Adresse : <c:out value="${ alerte.adresse }"/></p>
            <p>Date : <c:out value="${ alerte.date }"/></p>
            <p>Type : <c:out value="${ alerte.type }"/></p>
            <p>Image : <c:out value="${ alerte.image }"/></p>
            <p>Statut : <c:out value="${ alerte.statut }"/></p>
            <p>Priorité : <c:out value="${ alerte.priorite }"/></p>
            <p>Commentaire : <c:out value="${ alerte.commentaire }"/></p>
        </div>
    </body>
</html>