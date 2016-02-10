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

	var user_lat = document.getElementById("user_latitude");
	var user_lng = document.getElementById("user_longitude");

	var myLat = position.coords.latitude;
	var myLng = position.coords.longitude;

	var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	console.log(position.coords.latitude);
	console.log(position.coords.longitude);
		if (user_lat){
			user_lat.setAttribute("value", myLat);
			user_lng.setAttribute("value", myLng);
		}

	mapContainer = document.getElementById('map');
	var mapOptions = {
		zoom: 15,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(mapContainer,mapOptions);


	var userMarker = new google.maps.Marker({
  		position: myLatLng});
  	
  	userMarker.setMap(map);


	var truckOneMarker = new google.maps.Marker({
  		position: ({lat: 40.705145,lng: -74.009973}),
  		circle: new google.maps.Circle({
  			center: ({lat: 40.705145,lng: -74.009973}),
  			radius: 3218.69,
  			strokeColor: "#FF8000",
  			strokeOpacity: 0.6,
  			strokeWeight: 1,
  			fillColor: "#FF8000",
  			fillOpacity: 0.3,
  			map: map
  		})
  	});
  	truckOneMarker.setMap(map);
  	var infowindow = new google.maps.InfoWindow({
 		 content:"City2 Truck"
 	});

	infowindow.open(map,truckOneMarker);


}

$( document ).ready(function() {
    $("#logo_icon2").addClass("tossing");
});



