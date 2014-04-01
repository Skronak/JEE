var geocoder;
var map;
var marker;
var infowindow = new google.maps.InfoWindow();


// initialisation de la carte Google Map de départ
function initialiserCarte() {
  geocoder = new google.maps.Geocoder();
  
  // centrage de la carte de départ
  var Nantes = new google.maps.LatLng(47.217352840714064, -1.553681373334257);
  var mapOptions = {
    zoom: 15,
    center: Nantes,
 //   styles: [{featureType:'all',stylers:[{saturation:-100},{gamma:0.50}]}],
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  
  // cree un marker au click de souris
  google.maps.event.addListener(map, 'click',function(event){
	  addMarker(event.latLng);
  });
  
  // Limite à la zone Nantes
 /* var MapBounds = new google.maps.LatLngBounds(
		    new google.maps.LatLng(47.26804770458176, -1.6107673634542152),
		    new google.maps.LatLng(47.18236259973963, -1.4761848439229652));

		    google.maps.event.addListener(map, 'dragend', function ()
		    {
		        if (MapBounds.contains(map.getCenter()))
		        {
		            return;
		        }
		        else
		        {
		            map.setCenter(new google.maps.LatLng(47.2255234, -1.5596189999999979));
		        }
		    });*/
}

// creation d'un marqueur avec les eventListener associes
function addMarker(location) {
	if (marker) {
		marker.setPosition(location);
	}else{
		marker = new google.maps.Marker({
		        position: location,
		        map: map,
		        draggable:true
		});

	}	
	//ferme l'infobulle pour la recreer

	//Met à jour les coordonnées affichées
    document.getElementById('text_latlng').innerHTML='Coordonnees : '+location;
    //Appel du reversegeocoding
    codeLatLng();
    
	//Event listener de marqueurs
	google.maps.event.addListener(marker, 'dragend', function(event) {
		//Met à jour les coordonnées affichées
	    document.getElementById('text_latlng').innerHTML='Coordonnees : '+event.latLng;
	    codeLatLng();
	});
}

function codeLatLng() {
	  var input = document.getElementById('text_latlng').innerHTML;
	  input=input.replace("Coordonnees : (","");
	  input=input.replace(")","");
	  var latlngStr = input.split(',', 2);
	  var lat = parseFloat(latlngStr[0]);
	  var lng = parseFloat(latlngStr[1]);
	  
	  var latlng = new google.maps.LatLng(lat, lng);
	  geocoder.geocode({'latLng': latlng}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	      if (results[1]) {
	    	infowindow.close;
	        infowindow.setContent(results[0].formatted_address);
	        infowindow.open(map, marker);
	    	document.getElementById('adresseAlerte').value=results[0].formatted_address;  
	    	document.getElementById('coordAlerte').value=latlng;
	      } else {
	        alert('No results found');
	      }
	    } else {
	      alert('Geocoder failed due to: ' + status);
	    }
	  });
	}

function TrouverAdresse() {
	
  // Récupération de l'adresse tapée dans le formulaire
  var adresse = document.getElementById('adresseAlerte').value;
  geocoder.geocode( { 'address': adresse}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      map.setCenter(results[0].geometry.location);
      // Récupération des coordonnées GPS du lieu tapé dans le formulaire
      var strposition = results[0].geometry.location+"";
      strposition=strposition.replace('(', '');
      strposition=strposition.replace(')', '');
      // Affichage des coordonnées dans le <span>
      document.getElementById('text_latlng').innerHTML='Coordonnees : '+strposition;
      // Création du marqueur du lieu (épingle)       addMarker(results[0].geometry.location);
    } else {
      alert('Adresse introuvable: ' + status);
    }
  });
}

// Lancement de la construction de la carte google map
google.maps.event.addDomListener(window, 'load', initialiserCarte);