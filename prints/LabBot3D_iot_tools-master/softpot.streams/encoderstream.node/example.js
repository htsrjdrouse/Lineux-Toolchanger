
var d3 = require("d3");
var express = require('express')
var app = express()
var websocket = require('websocket-stream')
var sys = require('util')
var spawn = require('child_process').spawn


// controller.js
const mqtt = require('mqtt')  
const client = mqtt.connect('mqtt://192.168.1.81',{username:'pi',password: '6pack5'})


var garageState = ''  
var connected = false

client.on('connect', () => {  
  client.subscribe('topic/test')
})

 
client.on('message', function (topic, message) {
  // message is Buffer
  console.log(message.toString());
  //client.end();
});

app.get('/', function (req, res) {
  res.send('Hello World!<br>')
})

app.listen(3000, function () {
  console.log('Example app listening on port 3000!')
})

/*
client.on('message', (topic, message) => {  
  if(topic === 'topic/test') {
    connected = (message.toString() === 'true');
  }
})
*/

