var map = L.map("map").setView([20.5937, 78.9629], 5); // Centered on India
L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
  maxZoom: 19,
  attribution: "©contributors-@KUNAL_CHINCHE",
}).addTo(map);
L.marker([20.5937, 78.9629])
  .addTo(map)
  .bindPopup("Center of  India")
  .openPopup();
