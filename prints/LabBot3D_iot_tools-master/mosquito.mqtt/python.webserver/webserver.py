import socket

HOST, PORT = '', 8888

listen_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
listen_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_socket.bind((HOST, PORT))
listen_socket.listen(1)
print 'Serving HTTP on port %s ...' % PORT
while True:
    client_connection, client_address = listen_socket.accept()
    request = client_connection.recv(1024)
    print request
    a = 444
    http_response = """\
HTTP/1.1 200 OK

<head>
  <script src="http://192.168.1.81/processing.min.js"></script>
</head>
<title>test</title>
<body>
Hello, World!



<p><canvas id="canvas1" width="200" height="200"></canvas></p>

<script id="script1" type="text/javascript">

// Simple way to attach js code to the canvas is by using a function
function sketchProc(processing) {
  // Override draw function, by default it will be called 60 times per second
  processing.draw = function() {
    function drawPoint(xpos, ypos, weight){
      processing.strokeWeight(weight);
      processing.point(xpos, ypos);
    }
    // erase background
    processing.background(224);
    var now = new Date();
    drawPoint(5,5,100);
  };
}

var canvas = document.getElementById("canvas1");
// attaching the sketchProc function to the canvas
var p = new Processing(canvas, sketchProc);
// p.exit(); to detach it
</script>
</body>
</html>
"""
    client_connection.sendall(http_response)
    client_connection.close()
