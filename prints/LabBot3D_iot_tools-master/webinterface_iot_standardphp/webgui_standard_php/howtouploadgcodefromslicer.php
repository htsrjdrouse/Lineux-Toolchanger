<br>In order to upload gcode files you need to include an end.g to your slicer that sets the z height. <br>
Something like this: 
<pre>
G91
G1 Z10
G90
M107
M104 S0 ; turn off temperature
M140 S0 ; turn off bed temp
G28 X0  ; home X axis
M84     ; disable motors
</pre>




