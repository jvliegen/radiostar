EES_ex1a




**.include spice_models/D1N4148.mod
.include spice_models/D_ees.mod





V1 1 0 DC 10V

r1 1 2 470

D1 2 0 DEES



.op
.tran 0.02ms 1m

.control
run

**plot  v(1) v(2) i(V1)
plot i(V1)
.endc

.end