/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


 function initialize(n,lt,lg) {
 
//alert('hiiiiiii');
 var name=n.split(',');
 alert(name[0]);
 var lat=new Array(20);
        lat=lt.split(',');
        alert(lat);
 var lng=new Array(20);
        lng=lg.split(',');
        alert(lng);
 
// var valkLatlng = new google.maps.LatLng(40.352644, -94.880408);
// var rtLabLatlng = new google.maps.LatLng(40.392123, -94.890718);
// var hortiLatlng = new google.maps.LatLng(40.366960, -94.783399);


var valkLatlng = new google.maps.LatLng(lat[1], lng[1]);
 var rtLabLatlng = new google.maps.LatLng(lat[0],lng[0]);
 var hortiLatlng = new google.maps.LatLng(lat[2], lng[2]);
 
 var mapOptions = {
 zoom: 11,
 center: rtLabLatlng
 };
 
 var mapDiv=document.getElementById('map');
 var map = new google.maps.Map(mapDiv, mapOptions);
 
 
 //R.T. Wright Laboratory Farm Marker
 var rtLabmarker = new google.maps.Marker({
 position: rtLabLatlng,
 map: map,
 title: name[0],
 clickable: true        
 });
 
 google.maps.event.addDomListener(rtLabmarker, 'click', navigatePage);
 
 //Valk Center Marker
 var valkmarker = new google.maps.Marker({
 position: valkLatlng,
 map: map,
 title: 'Valk Center',
 clickable: true        
 });
 
 google.maps.event.addDomListener(valkmarker, 'click', navigatePage);
 
 //Horticulture Complex Marker
 var hortimarker = new google.maps.Marker({
 position: hortiLatlng,
 map: map,
 title: 'Horticulture Complex',
 clickable: true
 
 });
 
 google.maps.event.addDomListener(hortimarker, 'click', navigatePage);
 google.maps.event.addDomListener(map, 'idle', function(){
 center = map.getCenter();
 });
 
 $(window).resize(function(){
 //          map.setCenter(map.getCenter());
 map.setCenter(rtLabLatlng);
 
 });
 }
 
 function navigatePage(){
 window.location="faces/enterpriseHome.xhtml";
 }
 google.maps.event.addDomListener(window, 'load', initialize);
 