<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>

<h1>Depot d'une nouvelle alerte</h1>
<label for="adresseAlerte">Adresse de l'alerte <span
	class="requis">*</span></label>
<input type="text" id="adresseAlerte" name="adresseAlerte"
	value="<c:out value="${alerte.adresse}"/>" size="30" maxlength="60" />
<span class="erreur">${form.erreurs['adresseAlerte']}</span>
<br />
<input type="button" value="Localiser" onclick="TrouverAdresse();"/>
<br />
		
<label for="typeAlerte">Type <span class="requis">*</span></label>
<select name="typeAlerte" value="<c:out value="${alerte.type}"/>"
	size="1">
	<option>Dégradation
	<option>Tag
	<option>Usure
</select>
<span class="erreur">${form.erreurs['typeAlerte']}</span>
<br />

<label for="imageAlerte">Image <span class="requis">*</span></label>
<input type="file" id="imageAlerte" name="imageAlerte"
	value="<c:out value="${alerte.image}"/>" size="30" maxlength="30" />
<span class="erreur">${form.erreurs['imageAlerte']}</span>
<br />


<label for="prioriteAlerte">Priorité <span class="requis">*</span></label>
<select name="prioriteAlerte"
	value="<c:out value="${alerte.priorite}"/>" size="1">
	<option>Faible
	<option>Moyenne
	<option>Haute
</select>
<span class="erreur">${form.erreurs['prioriteAlerte']}</span>
<br />

<label for="prioriteAlerte">Commentaire</label>
<input type="text" id="commentaireAlerte" name="commentaireAlerte"
	value="<c:out value="${alerte.commentaire}"/>" size="75"
	maxlength="400" />
<span class="erreur">${form.erreurs['commentaireAlerte']}</span>
<br />