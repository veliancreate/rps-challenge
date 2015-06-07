$(document).ready(function(){  
  var ready;
  var scheme   = "ws://";
  var uri      = scheme + window.document.location.host + "/";
  var ws       = new WebSocket(uri);

  ws.onmessage = function(message) {
    var data = JSON.parse(message.data);
    console.log(data);
    if(data === true){
      window.location.replace("/two_player/game");
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

  $.get("/two_player/poll", function(response){
    ready = response.ready
    if(ready === false){
      readyPoll();
    };  
  });
  function readyPoll(){
    $.get("/two_player/poll", function(response){
      ready = response.ready
      if(ready === false){
        readyPoll();
      }else{
        window.location.replace('/two_player/game');
      }
    });  
  };
});
  