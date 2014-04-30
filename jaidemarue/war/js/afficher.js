var map;

// Lancer un affichage de la map à l'affichage puis relancer avec initialize(markers)
function initialize(markers2) {
   
    var bounds = new google.maps.LatLngBounds();
    var Nantes = new google.maps.LatLng(47.217352840714064, -1.553681373334257);
    var mapOptions = {
      zoom: 15,
      center: Nantes,
   //     styles: [{featureType:'all',stylers:[{saturation:-100},{gamma:0.50}]}],
    };
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    map.setTilt(45);

    //Decoupe la chaine de caractere
	    var markers=markers2.replace("\\[|\\]" , "");
	    markers=markers.split("|");

	    // Display multiple markers on a map
	    var infoWindow = new google.maps.InfoWindow(), marker, i;
	    
	    // Loop through our array of markers & place each one on the map  
	    for( i = 0; i < markers.length-1; i++ ) {
	    	markers[i]=markers[i].split(",");
	    	
	    	var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
	        bounds.extend(position);
	        marker = new google.maps.Marker({
	            position: position,
	            map: map,
	            animation : google.maps.Animation.DROP,
	            title: markers[i][0]
	        });
	
	        // Allow each marker to have an info window    
	        google.maps.event.addListener(marker, 'click', (function(marker, i) {
	            return function() {
	                // Info Window Content
	                var infoWindowContent =
	                    '<div id="content">' +
	                    '<h3>'+markers[i][0]+'</h3>'+
	                    '<p> Postee le '+markers[i][3]+'<p>'+
	                    '</div>';
	                
	                infoWindow.setContent(infoWindowContent);
	                infoWindow.open(map, marker);
	            }
	        })(marker, i));
	
	    	// Animation des curseurs lors du survol
	        google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
	        	return function(){
	    		  if (marker[i].getAnimation() != null) {
	    		    setTimeout(function(){
	    		    	marker[i].setAnimation(null);
	    		    },500);
	    		  }else {    	
	    			setTimeout(function(){
	    		    marker[i].setAnimation(google.maps.Animation.BOUNCE);},500);
	    		  }
	        	}
	        })(marker, i));
	        
	        // Automatically center the map fitting all markers on the screen
	        map.fitBounds(bounds);
	    }
	
	    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
	    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
	        this.setZoom(14);
	        google.maps.event.removeListener(boundsListener);
	    });
}