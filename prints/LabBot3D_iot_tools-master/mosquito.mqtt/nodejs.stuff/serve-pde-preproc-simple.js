/** A simple Node.js script to instantly serve
 * Processing source code as Processing.js :)
 *
 * This is an enhanced version which pre-procs
 * the code, so each of the clients does not
 * have to translate the PDE Java code into
 * PJS. The server will re-load the file only
 * if it has changed, in the first version
 * that had been reloaded on each GET request!
 *
 * Usage: node serve-pde 8080 sketch.pde */

var http = require('http');
var sys = require('sys');
var fs = require('fs');

// var ev = require('events');

var canvas_name = 'myCanvas',
    sketch_name = 'mySketch';

var head = '<!DOCTYPE html>'
         + '<html><head>'
         + '</head><body>';
var tail = '\n-->\n</script>'
         + '<canvas id=\"'+canvas_name+'\"></canvas>'
         + '<script type=\"text/javascript\">'
         + '\n<!--\n'
         + 'new Processing(document.getElementById(\''+canvas_name+'\'), '+sketch_name+');'
         + '\n-->\n</script>'
         + '</body></html>';

var pjs_version = 'http://processingjs.org/content/download/processing-js-1.3.0/processing-1.3.0.js';
//var pjs_version = '/opt/devel/src/work/node.git/import/processing/processing.js';
var pjs_include = '<script type=\"text/javascript\" src=\"' + pjs_version + '\"></script>';

var sketch_head = '<script type=\"application/processing\" data-processing-target=\"'+canvas_name+'\">\n\n';
var script_head = '<script type=\"text/javascript\">\n<!--\n';
var canvas_fake = head + pjs_include + sketch_head + tail,
    canvas_head = head + pjs_include + script_head;

var dom = require("jsdom").jsdom;

// TODO: require('optimist');
var server_port = process.argv[2];
var sketch_file = process.argv[3];

var script = '';

function parser(sketch_body) {
  dom.env(canvas_fake, [pjs_version], function (dom_err, window) {
    if ( dom_err ) {
      console.error("jsdom_err:\n" + sys.inspect(dom_err));
      throw _err;
    } else {
      // It is probably quicker this way, never mind we are in the
      // context already .. alternatives should be tested sometime :)
      script = window.Processing.compile(String(sketch_body)).sourceCode;
      var splice = script.split('\n');
      script = 'var '+sketch_name+' = ' +splice.slice(1,splice.length).join('\n');
      sys.puts(script);
    }
  });
}

parser(fs.readFileSync(sketch_file, 'utf8'));

sys.puts(script);

fs.watchFile(sketch_file, { persistent: true, interval: 50 }, function (curr, prev) {
  //console.log('the current mtime is: ' + curr.mtime);
  //console.log(sys.inspect(curr));
  //console.log('the previous mtime was: ' + prev.mtime);
  //console.log(sys.inspect(prev));
  if ( curr.mtime !== prev.mtime ) {
    console.log('Will re-read `' + sketch_file + '`');
    fs.readFile(sketch_file, 'utf8', function (fs_err, sketch_body) {
      if ( fs_err ) {
        console.log('Error reading `' + sketch_file + '`');
        throw fs_err;
      } else {
        parser(sketch_body);
      }
    });
  }
});

http.createServer(function (request, response) {

  console.log('request starting...');
  while ( script === '' ) { }
  response.writeHead(200, { 'Content-Type': 'text/html' });
  response.write(canvas_head, 'utf-8');
  //console.log(sys.inspect(script));
  response.write(script, 'utf-8');
  response.end(tail, 'utf-8');

}).listen(server_port);

console.log('Server running at http://127.0.0.1:' + server_port);
