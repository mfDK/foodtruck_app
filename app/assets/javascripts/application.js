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
	var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	console.log(position.coords.longitude)
	var mapOptions = {
		zoom: 16,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	mapContainer = document.getElementById('map');
	var map = new google.maps.Map(mapContainer,mapOptions);

	var marker=new google.maps.Marker({
  	position: myLatLng});
  	marker.setMap(map);
}