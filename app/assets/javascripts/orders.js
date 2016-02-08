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
	var myLat = position.coords.latitude;
	var myLng = position.coords.longitude;
	var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
	console.log(position.coords.latitude);
	console.log(position.coords.longitude);
	document.getElementById("order_latitude").setAttribute("value", myLat);
  	document.getElementById("order_longitude").setAttribute("value", myLng);
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

