$(document).ready(function(){  
  var ready;
  var scheme   = "ws://";
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  ws.onmessage = function(message) {
    var data = JSON.parse(message.data);
    if(data.message === "true"){
      window.location.replace("/two_player/game");
    }else if(data.message === "quit"){
      window.location.replace("/");
    }else{
      ws.send("refresh");
    }
  };

  $("#enter-name").on("submit", function(event) {
    ws.send("player joined");
  });

  $("#reset-selections").click(function(event) {
    ws.send("reset selections");
  });

  $("#make-move").on("submit", function(event){
    ws.send("made move");
  });

  $("#quit").on("submit", function(event){
    ws.send("quit");
  });
});
  