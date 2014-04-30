<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
		<!-- Optional theme -->
		<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&language=fr"></script>
</head>
<body>
	<!-- MODAL -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		        <h4 class="modal-title" id="myModalLabel">Comment utiliser Street Gardian</h4>
		      </div>
		      <div class="modal-body">
		        Street Gardian est une application web permettant de signaler de possible dégradations sur la voie publique afin de les réparer.
		        Chaque alertes posté pourra faire l'objet de +1 pour certifier de sa véracité. Losque cette alerte aura obtenu un certain montant de +1, une équipe de la municipalité interviendra.
		      </div>
		      <div class="modal-body">
		        <strong>Vous disposez de plusieurs fonctionnalités </strong>
		        <ul>
					<li>
						<a href="/creerAlerte"><span class="glyphicon glyphicon-envelope"> Poster une alerte</span></a>
						<p>Permet à un utilisateur authentifié de pouvoir poster une alerte</p>	
					</li>	
					<li>
						<a href="/mesAlertes"><span class="glyphicon glyphicon-folder-open"> Mes alertes</span></a>
						<p>Permet à un utilisateur authentifié de consulter toutes les alertes qu'il a posté. L'utilisateur pourra supprimer les alertes qu'il ne juge plus pértinentes.</p>
					</li>
					<li>	
						<a href="/lesalertes"><span class="glyphicon glyphicon-globe"> Toutes les alertes</span></a>
						<p>Permet de consulter toutes les alertes postées.</p>
					</li>
					<li>
						<a href="/creerAlerte"><span class="glyphicon glyphicon-user"> Login</span></a>
						<p>Permet à un utilisateur de s'authentifié.</p>
					</li>		
						<li>
							<p>Rue de préférence</p>
							<p>
								<input type="text" style="width:50%;" class="form-control" placeholder="rue de préférence" name="street">
							</p>
							
							<p>Permet à un utilisateur authentifié de renseigner une rue de préférence. Ainsi à chaque alerte postée dans sa rue il pourra être averti par mail. </p>
						</li>
									
				</ul>
		      </div>
		      <div class="modal-footer">
		        <p style="text-align:center;"><button  type="button" class="btn btn-primary btn-lg" data-dismiss="modal" aria-hidden="true">Retour</button></p>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- FIN MODAL -->

</body>
</html>