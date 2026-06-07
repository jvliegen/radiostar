.include spice_models/NPN_idealNPN.mod

V1 anode 0 DC 9
Q1 anode 1 2 idealNPN

* R1 1 0 10k

Vmeas 2 3 DC 0    ; 0V source = short circuit, just measures current
R1 3 0 4.7


V2 1 0 DC 0
.dc V2 0 9 0.01      ; Sweep from -0 to +9V in 0.01V steps




** Control part
.control
run

plot v(anode), v(1), v(2), i(Vmeas)

.endc

.end

