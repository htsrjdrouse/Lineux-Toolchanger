#notes: this fills the tubing so many cycles

def moving(steparray): 
  steparray.append("hts_s1_valveinput go")
  steparray.append("delay 1")
  steparray.append("hts_s1_backward go")
  steparray.append("delay 10")
  steparray.append("hts_s1_valveoutput go")
  steparray.append("delay 1")
  steparray.append("hts_s1_forward go")
  steparray.append("delay 10")
  return steparray


steparray = []
steparray.append("hts_s1_setsteps 20000")
steparray.append("delay 1")
steparray.append("hts_s1_setsteprate 100")
steparray.append("delay 1")
steparray = moving(steparray)
steparray = moving(steparray)
steparray = moving(steparray)
steparray = moving(steparray)
steparray = moving(steparray)

print steparray