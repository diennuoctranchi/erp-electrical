$(function(){var e=navigator.userAgent.toLowerCase().indexOf("trident")>-1?"img/location/location-color-3.png":"img/location/location-color-3.svg",t={center:new google.maps.LatLng(40.761425,-73.977643),zoom:14,gestureHandling:"cooperative",panControl:!1,zoomControl:!1,mapTypeControl:!1,streetViewControl:!1,mapTypeId:google.maps.MapTypeId.ROADMAP,scrollwheel:!1,styles:[{elementType:"geometry",stylers:[{color:"#140e32"}]},{elementType:"labels.icon",stylers:[{visibility:"off"}]},{elementType:"labels.text.fill",stylers:[{color:"#866ff6"}]},{elementType:"labels.text.stroke",stylers:[{color:"#120d2b"}]},{featureType:"administrative.land_parcel",stylers:[{visibility:"off"}]},{featureType:"administrative.locality",elementType:"labels.text.fill",stylers:[{color:"#c2bbe8"}]},{featureType:"administrative.locality",elementType:"labels.text.stroke",stylers:[{color:"#130e2a"}]},{featureType:"landscape",stylers:[{color:"#1e1645"}]},{featureType:"poi",elementType:"geometry",stylers:[{color:"#033c87"}]},{featureType:"poi",elementType:"labels.text.fill",stylers:[{color:"#c0b6f2"}]},{featureType:"road",elementType:"geometry.fill",stylers:[{color:"#140e32"}]},{featureType:"road",elementType:"labels.text.fill",stylers:[{color:"#d2ccf0"}]},{featureType:"road.arterial",elementType:"geometry",stylers:[{color:"#140e32"}]},{featureType:"road.highway",elementType:"geometry",stylers:[{color:"#ee44a1"}]},{featureType:"road.highway",elementType:"geometry.stroke",stylers:[{color:"#e51f8c"}]},{featureType:"road.highway.controlled_access",elementType:"geometry.fill",stylers:[{color:"#df087e"}]},{featureType:"road.highway.controlled_access",elementType:"geometry.stroke",stylers:[{color:"#bb076a"}]},{featureType:"road.local",elementType:"labels.text.fill",stylers:[{color:"#d9d4f2"}]},{featureType:"transit",elementType:"labels.text.fill",stylers:[{color:"#757575"}]},{featureType:"water",elementType:"geometry",stylers:[{color:"#18142f"}]},{featureType:"water",elementType:"labels.text.fill",stylers:[{color:"#2a2d41"}]}]},o=new google.maps.Map(document.getElementById("google-container"),t);new google.maps.Marker({position:new google.maps.LatLng(40.761425,-73.977643),map:o,visible:!0,icon:e});var l=document.createElement("div");new function(e,t){var o=document.getElementById("zoom-in"),l=document.getElementById("zoom-out");e.appendChild(o),e.appendChild(l),google.maps.event.addDomListener(o,"click",function(){t.setZoom(t.getZoom()+1)}),google.maps.event.addDomListener(l,"click",function(){t.setZoom(t.getZoom()-1)})}(l,o);o.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(l)});