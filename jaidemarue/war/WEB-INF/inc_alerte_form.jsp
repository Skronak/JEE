<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>

<h1>Depot d'une nouvelle alerte</h1>
<hr/>
<label for="adresseAlerte">Adresse de l'alerte <span class="requis">*</span></label>
<input type="text" id="adresseAlerte" name="adresseAlerte" value="<c:out value="${alerte.adresse}"/>" size="30" maxlength="60" />
<span class="erreur">${form.erreurs['adresseAlerte']}</span>
<input type="button" class="btn btn-info btn-large" value="Localiser" onclick="TrouverAdresse();"/>
<hr/>
		
<label for="typeAlerte">Type <span class="requis">*</span></label>
<select name="typeAlerte" value="<c:out value="${alerte.type}"/>"
	size="1">
	<option>Dégradation de la voie publique
	<option>Vandalisme
	<option>Voiture mal garée
	<option>Usure
	<option>Véhicule abandonné
	<option>Eclairage public
	<option>Dechets
	<option>Chaussée détériorée
</select>
<span class="erreur">${form.erreurs['typeAlerte']}</span>
<hr/>

<label for="uploadedFile">Fichier à envoyer* : </label>
<input type="file" name="uploadedFile" id="uploadedFile"/>
<hr/>


<label for="prioriteAlerte">Priorité</label>
<select name="prioriteAlerte"
	value="<c:out value="${alerte.priorite}"/>" size="1">
	<option>Faible
	<option>Moyenne
	<option>Haute
</select>
<span class="erreur">${form.erreurs['prioriteAlerte']}</span>
<hr/>

<label for="prioriteAlerte">Commentaire</label>
<input type="text" id="commentaireAlerte" name="commentaireAlerte"
	value="<c:out value="${alerte.commentaire}"/>" size="65%"
	maxlength="400" />
<span class="erreur">${form.erreurs['commentaireAlerte']}</span>
<hr/>
<input type="text" id="coordAlerte" name="coordAlerte" value="<c:out value="${alerte.coord}"/>" hidden="hidden"/>