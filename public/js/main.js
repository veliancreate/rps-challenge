var scheme   = "ws://";
var uri      = scheme + window.document.location.host + "/";
var ws       = new WebSocket(uri);

ws.onmessage = function(message) {
  var data = JSON.parse(message.data);
  console.log(data)
  if(data === true){
    window.location.replace("/two_player/game");
  }
};

$("#enter-name").on("submit", function(event) {
  ws.send("player joined");
});
