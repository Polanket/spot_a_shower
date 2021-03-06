import mapboxgl from 'mapbox-gl';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach((marker) => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/polanket/cjy8h2en50moo1cobqbfj4we9'
    });


    const markers = JSON.parse(mapElement.dataset.markers);
    if (Array.isArray(markers)) {
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      });
    } else {
      const popup = new mapboxgl.Popup().setHTML(markers.infowindow);
      new mapboxgl.Marker()
        .setLngLat([ markers.lng, markers.lat ])
        .setPopup(popup)
        .addTo(map);
      map.flyTo({
        center: [ markers.lng, markers.lat ],
        zoom: 14
      })
    }

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
