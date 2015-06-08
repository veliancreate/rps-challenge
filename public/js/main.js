$(document).ready(function(){  
  var ready;
  var scheme   = "wss://";
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  ws.onmessage = function(message) {
    var data = JSON.parse(message.data);
    if(data.message === "true"){
      window.location.replace("/two_player/game");
    }else if(data.message === "reset selections"){
      window.location.replace("/two_player/reset_selections");  
    }else if(data.message === "quit"){
      window.location.replace("/reset_game");
    }else{
      ws.send("refresh");
    }
  };

  $("#two_player-enter-name").on("submit", function(event) {
    ws.send("player joined");
  });

  $("#two_player-reset-selections").click(function(event) {
    ws.send("reset selections");
  });

  $("#two_player-make-move").on("submit", function(event){
    ws.send("made move");
  });

  $("#two_player-quit").on("submit", function(event){
    ws.send("quit");
  });
});
  