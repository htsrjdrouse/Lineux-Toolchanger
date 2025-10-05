'use strict';
var store = require('store')
var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var port = process.env.PORT || 3000;
var json = require('express-json');
var fs = require('fs');

var mqtt = require('mqtt')  
let jsonData = require('/home/pi/config.json');
//console.log(jsonData['username']);
//var client = mqtt.connect('mqtt://localhost',{username:'ampmicrofl',password: 'labbot3d'})
//var client = mqtt.connect('mqtt://localhost',{username:jsonData['username'],password: 'labbot3d'})
var client = mqtt.connect('mqtt://localhost',{username:jsonData['username'],password: jsonData['password']})
app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

client.on('connect', () => {  
  //client.subscribe('topic/test')
  client.subscribe(jsonData['topic']+"track")
})

client.on('message', function (topic, message) {
  // message is Buffer
  console.log(message.toString());
  //client.end();
  //var obj = JSON.parse(fs.readFileSync('smoothie.json', 'utf8'));
  //var data = obj['track'];
  if (store.get("cmd")){
   var text = store.get("cmd");
   var myObj = JSON.parse(text); 
   var data = myObj['cmd'];
   data.push(message.toString());
   var myJSON = JSON.stringify(myObj);
   store.set("cmd", myJSON);
  }
  else {
   var myObj = {"cmd":[message.toString()]}
   var myJSON = JSON.stringify(myObj);
   store.set("cmd", myJSON);
   var text = store.get("cmd");
   myObj = JSON.parse(text); 
   data = myObj['cmd'];
  }
  if (message.toString() == "clear"){
   console.log("message cleared");
   var myObj = {"cmd":[message.toString()]}
   var myJSON = JSON.stringify(myObj);
   store.set("cmd", myJSON);
   var text = store.get("cmd");
   myObj = JSON.parse(text); 
   data = myObj['cmd'];
  }
  //io.emit('array message', data.toString());
  data = data.reverse();
  io.emit('array message', data.toString());
  console.log(message.toString());
  console.log(data.toString());
  io.emit('array single message', message.toString());
});

/*
io.on('connection', function(socket){
  socket.on('chat message', function(msg){
    io.emit('chat message', msg);
  });
  socket.on('chat2 message', function(msg){
    io.emit('chat2 message', msg);
  });
});
*/

http.listen(port, function(){
  console.log('listening on *:' + port);
});
