var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var port = process.env.PORT || 3000;

var mqtt = require('mqtt')  
var client = mqtt.connect('mqtt://192.168.122.119',{username:'pi',password: '6pack5'})

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

client.on('connect', () => {  
  client.subscribe('topic/test')
})

client.on('message', function (topic, message) {
  // message is Buffer
  //console.log(message.toString());
  //client.end();
  io.emit('chat message', message.toString());
});


io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    io.emit('chat message', msg);
  });
});


http.listen(port, function(){
  console.log('listening on *:' + port);
});

