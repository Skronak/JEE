jQuery(function($) {
    // Asynchronously Load the map API 
    var script = document.createElement('script');
    script.src = "http://maps.googleapis.com/maps/api/js?sensor=false&callback=initialize";
    document.body.appendChild(script);
});

function initialize() {
    var map;
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
        
    // Multiple Markers
    var markers = [
                   ['Avenue des tullipes, Nantes', 'Portail casse ca urge !', 'mickael@gmal.com','../img/portai.png',47.21854793294357, -1.5530633926391602],
                   ['Rose Bonbon, Nantes', 'Panneau abime', 'stephael@gmal.com','../img/ruine.jpeg',47.216653262032224, -1.558084487915039],
                   ['Rue de la torture, Nantes', 'manque un bout de trottoire ca urge !', 'Rickael@gmal.com','../img/portai.png',47.216711560608246, -1.5629339218139648]
               ];
                        
       
    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Loop through our array of markers & place each one on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][4], markers[i][5]);
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
                    '<h3>'+markers[i][2]+'</h3>'+
                    '<p>'+markers[i][1]+'</p>'+
                    '<IMG SRC="'+markers[i][3]+'"ALT="'+markers[i][1]+'TITLE="'+markers[i][2]+'"width="100px" height="100px")>'+
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

google.maps.event.addDomListener(window, 'load', initialize);

