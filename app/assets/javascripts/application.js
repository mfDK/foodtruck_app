// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .




function findMe(){
	// checks to see if  geolocation works on current browser
	// this is also the main function that uses both the error and success functions as values and runs them
	if (navigator && navigator.geolocation){
		navigator.geolocation.getCurrentPosition(success,error);
		// console.log(navigator.geolocation.getCurrentPosition(success, error))
	}
	else{
		console.log("Geolocation is not supported");
	}
}

function error(){}


function success(position){
	//hard coded list of all trucks
	var myLat = position.coords.latitude;
	var myLng = position.coords.longitude;


	var truckLoc = [
  		['Fidi',40.7113533, -74.00504269999999],
  		['Flushing',40.7748021,-73.90930589999999],
  		['Brooklyn', 40.7026415, -73.99323799999999], 
	];
	
	//dom element variables
	var user_lat = document.getElementById("user_latitude");
	var user_lng = document.getElementById("user_longitude");



	//grabs value current position of the user
	var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	//checks to see if the user_latitude dom item exists. if it does it will assign the users current coords as values of that user_latitude and user_longtiude dom elements.
		if (user_lat){
			user_lat.setAttribute("value", myLat);
			user_lng.setAttribute("value", myLng);
		}

	mapContainer = document.getElementById('map');
	//creates parameters to generate google map
	var mapOptions = {
		zoom: 12,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(mapContainer,mapOptions);


	var userMarker = new google.maps.Marker({
  		position: myLatLng});
  	
  	userMarker.setMap(map);

  	// this sets markers for each truck
  	for (i = 0; i < truckLoc.length; i++){
  
		var truckOneMarker = new google.maps.Marker({
  			position: ({lat:truckLoc[i][1],lng:truckLoc[i][2]}),
  			circle: new google.maps.Circle({
	  			center: ({lat: truckLoc[i][1],lng: truckLoc[i][2]}),
	  			radius: 1609.34,
	  			strokeColor: "#FF8000",
	  			strokeOpacity: 0.6,
	  			strokeWeight: 1,
	  			fillColor: "#FF8000",
	  			fillOpacity: 0.3,
	  			map: map
  			})
  		});
  	 	truckOneMarker.setMap(map);
  		var infoWindow = new google.maps.InfoWindow({
 			content:"Truck",
 		});
  		// infoWindow.open(map,truckOneMarker);
	}	


}
// jquery animation 
$( document ).ready(function() {
    $("#logo_icon2").addClass("tossing");
});




