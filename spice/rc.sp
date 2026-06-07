RC Circuit Transient Response

** Circuit
r1 1 2 1k
c1 2 0 1u
vin 1 0 pwl (0 0 10ms 0 11ms 5v 20ms 5v)

r2 1 3 2k
c2 3 0 1u

r3 1 4 4k
c3 4 0 2u

r4 1 5 8k
c4 5 0 2u

r5 1 6 1k
l5 6 0 5u

** Do transient
.tran 0.02ms 200ms

** Control part
.control
run

plot v(1) v(2) v(3) v(4) v(5) v(6)

.edc

.end