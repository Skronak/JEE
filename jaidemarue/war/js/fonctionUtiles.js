function initialiser() {
	var latlng = new google.maps.LatLng(46.779231, 6.659431);
	
	var options = {
		center: latlng,
		zoom: 19,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	
	var carte = new google.maps.Map(document.getElementById("carte"), options);

	//création du marqueur
	var marqueur = new google.maps.Marker({
		position: new google.maps.LatLng(46.779231, 6.659431),
		map: carte,
		Draggable:true
	});
	
	google.maps.event.addListener(marqueur, 'click', function() {
		alert("Le marqueur a été cliqué.");//message d'alerte
	});

	google.maps.event.addListener(marqueur, 'dragend', function(event) {
		//message d'alerte affichant la nouvelle position du marqueur
		alert("La nouvelle coordonnée du marqueur est : "+event.latLng);
	});

	// Animation des curseurs lors du survol
    google.maps.event.addListener(Marker, 'mouseover', function(){
		  if (Marker.getAnimation() != null) {
		    setTimeout(function(){
		    	Marker.setAnimation(null);
		    },500);
		  }else {    	
			setTimeout(function(){
		    marqueur.setAnimation(google.maps.Animation.BOUNCE);},500);
		  }
	});
    
}

style:[
       {
           "elementType": "geometry",
           "stylers": [
               {
                   "hue": "#ff4400"
               },
               {
                   "saturation": -68
               },
               {
                   "lightness": -4
               },
               {
                   "gamma": 0.72
               }
           ]
       },
       {
           "featureType": "road",
           "elementType": "labels.icon"
       },
       {
           "featureType": "landscape.man_made",
           "elementType": "geometry",
           "stylers": [
               {
                   "hue": "#0077ff"
               },
               {
                   "gamma": 3.1
               }
           ]
       },
       {
           "featureType": "water",
           "stylers": [
               {
                   "hue": "#00ccff"
               },
               {
                   "gamma": 0.44
               },
               {
                   "saturation": -33
               }
           ]
       },
       {
           "featureType": "poi.park",
           "stylers": [
               {
                   "hue": "#44ff00"
               },
               {
                   "saturation": -23
               }
           ]
       },
       {
           "featureType": "water",
           "elementType": "labels.text.fill",
           "stylers": [
               {
                   "hue": "#007fff"
               },
               {
                   "gamma": 0.77
               },
               {
                   "saturation": 65
               },
               {
                   "lightness": 99
               }
           ]
       },
       {
           "featureType": "water",
           "elementType": "labels.text.stroke",
           "stylers": [
               {
                   "gamma": 0.11
               },
               {
                   "weight": 5.6
               },
               {
                   "saturation": 99
               },
               {
                   "hue": "#0091ff"
               },
               {
                   "lightness": -86
               }
           ]
       },
       {
           "featureType": "transit.line",
           "elementType": "geometry",
           "stylers": [
               {
                   "lightness": -48
               },
               {
                   "hue": "#ff5e00"
               },
               {
                   "gamma": 1.2
               },
               {
                   "saturation": -23
               }
           ]
       },
       {
           "featureType": "transit",
           "elementType": "labels.text.stroke",
           "stylers": [
               {
                   "saturation": -64
               },
               {
                   "hue": "#ff9100"
               },
               {
                   "lightness": 16
               },
               {
                   "gamma": 0.47
               },
               {
                   "weight": 2.7
               }
           ]
       }
   ]

















