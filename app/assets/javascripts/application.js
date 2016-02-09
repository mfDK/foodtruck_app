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

	// var order_lat = document.getElementById("order_latitude");
	// var order_lng = document.getElementById("order_longitude");

	var myLat = position.coords.latitude;
	var myLng = position.coords.longitude;
	var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	console.log(position.coords.latitude);
	console.log(position.coords.longitude);
	
	mapContainer = document.getElementById('map');
	var mapOptions = {
		zoom: 16,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(mapContainer,mapOptions);

	document.getElementById("cLat").text = "Hello";
	document.getElementById("cLong").text = "World";

	var marker=new google.maps.Marker({
  	position: myLatLng});
  	marker.setMap(map);


}

