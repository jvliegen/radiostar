* Description: This function is a controlled sine wave oscillator with parametrizable values of
* low and high peak output. It takes an input voltage or current value. This value is used as
* the independent variable in the piecewise linear curve described by the coordinate points
* of the cntl array and freq array pairs. From the curve, a frequency value is determined,
* and the oscillator will output a sine wave at that frequency. From the above, it is easy
* to see that array sizes of 2 for both the cntl array and the freq array will yield a linear
* variation of the frequency with respect to the control input. Any sizes greater than 2 will
* yield a piecewise linear transfer characteristic. For more detail, refer to the description of
* the piecewise linear controlled source, which uses a similar method to derive an output
* value given a control input.
* 
* freq = freq[i] + (freq[i+1] - freq[i]) * (V_ctrl - cntl[i]) / (cntl[i+1] - cntl[i])
* 
* 
* cntl_array = [-1,  0,    5,    6   ]
* freq_array  = [10, 10,   1000, 1000]
* Visually:
*           freq (Hz)
*           1000 |          ___________
*                |         /
*                |        /
*                |       /
*             10 |______/
*                |
*                +-----|-----|-----|------> ctrl voltage (V)
*                     -1     0     5     6
* 
* From -1V to 0V: frequency is flat at 10 Hz
* From 0V to 5V: frequency linearly interpolates from 10 Hz to 1000 Hz
* From 5V to 6V: frequency is flat at 1000 Hz
* 

* Why the flat regions at the ends?
*   cntl_array = [-1,  0, ...]   ← -1 and 0 both map to 10 Hz
*   cntl_array = [...,  5, 6]    ← 5 and 6 both map to 1000 Hz
*   This is a saturation/clamping technique. If the control voltage goes:
* 
*   Below -1V → ngspice clamps to the first value (10 Hz)
*   Above 6V → ngspice clamps to the last value (1000 Hz)
* 
*   Without these flat end segments, out-of-range voltages could cause undefined or unstable behavior. It's good practice to always add a flat region at both ends.

.model ees_sine sine(
+ cntl_array=[-1 0 5 6]
+ freq_array=[10 10 100 100] 
+ out_low=-2.5 out_high=2.5)
