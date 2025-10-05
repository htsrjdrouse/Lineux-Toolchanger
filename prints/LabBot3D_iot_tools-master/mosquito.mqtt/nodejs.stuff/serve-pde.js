/** A simple Node.js script to instantly serve
 * Processing source code as Processing.js :)
 *
 * Usage: node serve-pde 8080 sketch.pde */

var http = require('http');
var fs = require('fs');

var head = '<html><head>';
var body = '</head><body>';
var tail = '</body></html>';

var sketch_head = '<script type=\"application/processing\" data-processing-target="canvas">\n\n';
var sketch_tail = '</script><canvas id="canvas"></canvas>';

//var pjs_version = 'http://processingjs.org/content/download/processing-js-1.3.0/processing-1.3.0.js'
var pjs_version = 'http://localhost/processing.min.js'
var pjs_include = '<script type=\"text/javascript\" src=\"' + pjs_version + '\"></script>'

http.createServer(function (request, response) {

    console.log('Request received ...');
    
        fs.readFile(process.argv[3], function(error, sketch_body) {
                if (error) {                        
                        response.writeHead(500);    
                        response.end();             
                }                                   
                else {  
                        response.writeHead(200, { 'Content-Type': 'text/html' });
                        response.write( 
                          head + pjs_include +
                          body + sketch_head );
                        response.write(sketch_body, 'utf-8');
                        response.end(sketch_tail + tail);
                }                     
        });                           

}).listen(process.argv[2]);

console.log('Node HTTP server running at http://localhost:' + process.argv[2]
           + ' with sketch `' + process.argv[3] + '`.');

