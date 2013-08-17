$(document).ready(function(){

	// give the map a starting position around Sydney
	var startPos = new google.maps.LatLng(-33.88834, 151.19182);

	// map options
	var options = { zoom: 10, center: startPos, mapTypeId: google.maps.MapTypeId.ROADMAP };

	// initialise the map
	var map = new google.maps.Map(document.getElementById("map_canvas"), options);

	//get the csv file using ajax
	$.ajax({
		url: 'Spaces.csv',
		type: 'GET',
		success: function(data) {
		
		
		//split up each row by a new line
		var rows = data.split('\n');
		
		//create an array for each column
		var cols = [];
		
		for (var i=0; i<rows.length; i++) {
			//split each line by commas
			cols[i] = rows[i].split(',');
		}
		
		for(var y=1; y < cols.length; y++){
		
			//Print out the items in the first column
			//console.log(cols[y][1]);
			
			//store every list item as an <li> string
			var listItem = '<li><a href="#map"><img src="images/beersmall.png" alt="beer" class="ui-li-icon ui-li-thumb" />'+ cols[y][1] +'<span class="ui-li-count">'+ cols[y][2] +'km</span></a></li>';
			
			//insert each list item into the beers list
			$('ul.Spaces').append(listItem);
			}
			
		for(var y = 0; y < rows.length; y++){
		
			var beer = new google.maps.LatLng(cols[y][3], cols[y][4]);
			var marker = new google.maps.Marker({
				position: beer,
				map: map
			});
		}	
		
		}
	
	});
	
	$(".get").bind("tap", function(event, ui) {
		
		// What happens when we successfully recieve location
		function onSuccess(position) {
		
		// Store the user position as a map marker
		var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		
		//add the map marker to the map
		var marker = new google.maps.Marker({
			position: pos,
			map: map
	});
	
	alert("Found you!");

};
		
		//When location fails
		function onError(error){
			alert("code: " + error.code + "message: " +error.message);
		}
		
		//get location from the navigator object
		navigator.geolocation.getCurrentPosition(onSuccess, onError);
	});
	
});