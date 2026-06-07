# AM

## Frequencies

*source: claude.ai*
Amateur & Licence-Free Frequencies for AM Experimentation
There are several options depending on your location and intentions.

ISM Bands (Licence-Free, Internationally Recognised)
These are open to anyone for low-power experimentation:

| Band | Frequency | Notes|
|---------|---|---|
| LF ISM  |  6.765 – 6.795 kHz |Rarely used|
| MF ISM  |  13.553 – 13.567 MHz ||
| HF ISM  |  26.957 – 27.283 MHz |CB radio sits nearby|
| VHF ISM |  40.66 – 40.70 MHz ||

Power limits are strict — typically a few milliwatts to tens of milliwatts conducted, with tight limits on spurious emissions.

## Transmitter

**ASCII Char → Binary bits → Modulate carrier → Transmit**

#### Encoding

For encoding: use UTF-8

e.g. '*' => UTF-8 Hex Bytes: 0x2A => 00101010

#### Modulate carrier

* For simplicity, use **OOK (On-Off Keying)** — a form of AM where the carrier is switched on for 1 and off for 0. 
* **True DSB-AM (with both sidebands)** is also possible but requires a balanced modulator.

Let's go for OOK!

Build a stable carrier oscillator — a Colpitts or Hartley LC oscillator works well for AM frequencies (e.g. 500 kHz–1.6 MHz for the AM band). Frequency stability is important; add a trimmer capacitor for tuning.

[On Oscillators](https://www.electronics-tutorials.ws/oscillator/oscillators.html)

Equation for the Resonant Frequency of a LC Oscillator

fr = 1 / ( 2 * pi * sqrt(L*C))

    Where:
    L is the Inductance in Henries
    C is the Capacitance in Farads
    ƒr is the Output Frequency in Hertz

Let's go for the Colpitts ([link](https://www.electronics-tutorials.ws/oscillator/colpitts.html))

> The advantage of this type of capacitive circuit configuration is that with less self and mutual inductance within the tank circuit, frequency stability of the oscillator is improved along with a more simple design.


## Transmit

For a perfect antenna, the length of the antenna should be half of the wavelength.

f_antenna = f_input
c = f_antenna x lambda_input

300'000 km/s = 10800 Hz * lambda_input
=> lambda_input =  27'777m
=> l_antenna = 27'777m / 2 = 13'888 m

** Ter info

golflengte lamba = c / f= 300'000 km/s / 10800 1/s = 27'777 m
Dus antenne moet lambda/2 = 13'888 m

300000000 / 40690000 =  7.372 m
Dus antenne moet lambda/2 = 3.6m 
Dus antenne moet lambda/12 = 0.614m

* **Q** Monopool of dipool?


## Receiver

**Receive → Demodulate → Decode → ASCII Char**