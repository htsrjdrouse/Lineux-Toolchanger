import sys, re
import operator

# Function to calculate the time for each segment
def tmecalc(a):
    b = []
    E, X, Y, Z, F = 0, 0, 0, 0, 0
    tim = 0
    poscmds = []
    ct = 0
    for i in a:
        dt = {}
        i = re.sub("\n|\r", "", i)
        if re.match('^.*F.*', i):
            df = re.match('^.*F(.*)$', i)
            abf = re.sub('[ |X|x|Y|y|Z|z|E|e].*', '', df.group(1))
            abf = re.sub(r'\s*;.*$', '', abf, flags=re.MULTILINE)
            try:
                pf = float(abf)
                if pf > 0:
                    F = pf
            except:
                pass
        if re.match('^.*[Z|X|Y|E]', i):
            dt['F'] = F
            ct += 1
            dt['ct'] = ct
            pe, px, py, pz = 0, 0, 0, 0
            if re.match('^.*E', i):
                d = re.match('^.*E(.*)', i)
                abe = re.sub('[ |X|x|Y|y|Z|z|F|f].*', '', d.group(1))
                abe = re.sub(r'\s*;.*$', '', abe, flags=re.MULTILINE)
                try:
                    pe = float(abe)
                    dt['diffe'] = abs(E - pe)
                    E = pe
                    dt['E'] = pe
                except:
                    pass
            if re.match('^.*X', i):
                dx = re.match('^.*X(.*)', i)
                abx = re.sub('[ |E|e|Y|y|Z|z|F|f].*', '', dx.group(1))
                abx = re.sub(r'\s*;.*$', '', abx, flags=re.MULTILINE)
                try:
                    px = float(abx)
                    dt['diffx'] = abs(X - px)
                    X = px
                    dt['X'] = px
                except:
                    pass
            if re.match('^.*Y', i):
                dy = re.match('^.*Y(.*)', i)
                aby = re.sub('[ |E|e|X|x|Z|z|F|f].*', '', dy.group(1))
                aby = re.sub(r'\s*;.*$', '', aby, flags=re.MULTILINE)
                try:
                    py = float(aby)
                    dt['diffy'] = abs(Y - py)
                    Y = py
                    dt['Y'] = py
                except:
                    pass
            if re.match('^.*Z', i):
                dz = re.match('^.*Z(.*)', i)
                abz = re.sub('[ |E|e|X|x|Y|y|F|f].*', '', dz.group(1))
                abz = re.sub(r'\s*;.*$', '', abz, flags=re.MULTILINE)
                try:
                    pz = float(abz)
                    dt['diffz'] = abs(Z - pz)
                    Z = pz
                    dt['Z'] = pz
                except:
                    pass
            dt['cmd'] = i
            comp = {}
            for key in ['diffx', 'diffy', 'diffz', 'diffe']:
                if key in dt:
                    comp[key] = dt[key]
            if len(comp) > 0:
                sorted_comp = sorted(comp.items(), key=operator.itemgetter(1))
                dt['maxdiff'] = sorted_comp[-1][1]
                if dt['F'] > 0:
                    dt['time'] = (dt['maxdiff'] / dt['F']) * 60.0
                    tim += dt['time']
                else:
                    dt['time'] = 0
                    tim += dt['time']
                poscmds.append(dt)
    return int(tim) + 1, poscmds

# Function to segment the G-code by tool changes
def segments(filn):
    ln = []
    ct = 0
    endstart = 0
    toolchangers = []
    for i in filn:
        if re.match(';END_START', i):
            endstart = ct
        if endstart > 0 and re.match('^T[0-1]', i):
            toolchangers.append(ct)
        ln.append(i)
        ct += 1
    toolchanger_segments = []
    for j in range(len(toolchangers)):
        try:
            toolchanger_segments.append(ln[toolchangers[j]:toolchangers[j + 1]])
        except:
            pass
    toolchanger_segments.append(ln[toolchangers[-1]:ct])
    return toolchanger_segments

# Main script to modify G-code
filn = open(sys.argv[1])
lines = filn.readlines()
filn.close()

# Split into segments based on tool changes
toolchanger_segments = segments(lines)

# Calculate time for each segment and store results
segment_times = []
for seg in toolchanger_segments:
    time, _ = tmecalc(seg)
    segment_times.append(time)

# Modify G-code with preheat and conditional cooling
output_lines = []
current_tool = None
last_tool = None
last_tool_change_time = 0

for i, line in enumerate(lines):
    output_lines.append(line.rstrip('\n'))  # Preserve original line

    # Detect tool change
    if re.match('^T[0-1]', line):
        new_tool = int(line.strip()[1])
        if current_tool is not None and last_tool is not None:
            # Calculate rest time for the previous tool
            rest_time = segment_times[last_tool_change_time] if last_tool_change_time < len(segment_times) else 0
            if rest_time < 45:
                output_lines.append(f"; Skipping cooling for T{last_tool} (rest time {rest_time}s < 45s)")
            else:
                output_lines.append(f"M568 P{last_tool} A0 ; Cool down T{last_tool}")

        # Preheat the new tool 30 seconds before pickup
        output_lines.append(f"M568 P{new_tool} S210 A1 ; Preheat T{new_tool} to 210°C")
        output_lines.append("G4 S30 ; Wait 30 seconds for preheat")

        last_tool = current_tool
        current_tool = new_tool
        last_tool_change_time += 1  # Increment segment counter

# Write modified G-code to a new file
output_file = sys.argv[1].replace('.gcode', '_modified.gcode')
with open(output_file, 'w') as f:
    for line in output_lines:
        f.write(line + '\n')

print(f"Modified G-code written to {output_file}")
