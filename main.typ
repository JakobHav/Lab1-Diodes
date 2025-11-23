#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("assets/frontpage.jpg"))
#v(206pt)
#h(105pt)
Jakob Haverkamp
#h(155pt)
5932110

#h(105pt)
Milan Fark
#h(186pt)
5900383

#set page(background: [])

#import "@local/ufr-sheet-universal:0.1.0": conf

#show: doc => conf(
  doc,
  subject: "Elektronics Laboratory",
  date: "12.11.2025",
  prof: "Prof. Dr. Hans Zappe",
  semester: "WS 25/26",
  title: "Lab 1 - Diodes",
  name: "jh1444, nr254",
  header_start: 2,
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)

= 1.2 A Variety of Diodes

== 1.2.1 Simulation


The goal of the Simulation is to measure and plot the characteristics of different Types of Diodes, in this case one Si Diode (Model: 1N4148), one Schottky Diode (Model: BAT41) and one Zener Diode (Model: ZD3V9).


=== Circuit Diagrams:
#v(5pt)

#figure(
  caption: [Circuit Diagrams from LTSpice #footnote[Our actual command for the rightmost plot was: `V3 -4.297 4 0.01`, the one in the diagram (which we were supposed to use) did not work (bec exponential groth we think) we did the min. working values)]],
)[
  #image("assets/circuits.jpg")
  #v(0pt)
]
#v(12pt)

=== Plots:

#include "1.2.plot_sim.typ"

=== Text Questions:

(f)
Small-Signal Resistance $r_D$ for $abs(I_D) = 20 "mA"$ for:

- 1N4148 Diode is $r_D approx$ 0.223 #sym.Omega
- BAT41 Diode is $r_D approx$ - #sym.Omega#footnote[We could not calculate a value because LTSpice only generated up to (0.469 V,	18.1 mA) as described earlier and seen in @figure2, so we could not compute derivative for 20mA]
- ZD3V9 Diode is $r_(D) approx$ 0.213 #sym.Omega (reverse and forward)
#v(2em)
(g)
One essential difference between the characteristics is the breakdown voltage, which for the Schottky diode is $approx 0.3$ V, for the Si diode is $approx 0.6$ V and for the Zener diode is $approx 0.7$ V.

Also, the Zener Diode has the classical Zener-Curve in the negative voltages, having a reverse breakdown voltage of $approx 3.8$ V, whereas the other ones stay at 0.0 A.

\
=== Conclusion:

We explored the IV-Curves and characteristics of the different types of diodes. The plot had the interesting attribute that it only simulated to $approx 1V$ because of the exponential nature of the curve (as seen in #text(blue)[@figure2]).
#v(10pt)
= 1.2.2. Measurement

The goal of the measurement is to verify the Simulation we created in the previous exercise.

== Circuit Diagrams:

#figure(caption: "Schematic of the diode characteristics circuit")[
  #image("assets/1.2.2.circuit.jpg", width: 70%)
  #v(0pt)
]
#pagebreak()
=== Plots:

#include "1.2.plot_real.typ"

== Text Questions:

(a) The true value of  $R_(14) approx 199.1 Omega$

(b)

#table(
  columns: 3,
  inset: 5pt,
  align: horizon + center,
  table.header(
    [*Diode*],
    [*Forward Bias* [V]],
    [*Reverse Bias*#footnote()[$>= 2$ means we could not measure it with our multimeter as the maximum 'diode test' can do is 2V]\[V\]],
  ),
  [$D 1$ (1N4148)], [0.612], [0],
  [$D 2$ (BAT41)], [0.382], [0],
  [$D 3$ (ZD3V9)], [0.712], [$>= 2$],
)

The results of $D 1$ and $D 2$ look fairly similar to the simulation, but all the diodes did read slightly higher voltages when measured in reality.

The Zener Diode (D3) was very different in real life, because the multimeter only operates to 1.99V in Diode Test mode, so we could not read the value for reverse bias, which was approximately $3.85 V$ in the simulation.

=== Conclusion

We measured and compared our results to the simulations and found similar results.

= 1.3 Light-emitting diodes

== 1.3.1 Simulation

=== Circuit Diagrams
=== Plots

#include "1.3.plot_sim.typ"

=== Conclusion

== 1.3.2. Measurement

The goal of the measurement was to see the LED Brightness and to mesaure the LED characteristics.

=== Circuit Diagrams

#figure(caption: "Schematic of the LED characteristics circuit")[
  #image("assets/1.3.2.circuit.jpg", width: 60%)
]
#v(10pt)

=== Plots

#include "1.3.plot_real.typ"

=== Text Questions
(a) \
#table(
  columns: 2,
  inset: 5pt,
  align: horizon + center,
  table.header([*LED*], [*$V_f$* [V]]),
  [$D 11$], [$>=2$],
  [$D 10$], [1.858],
  [$D 9$], [1.828],
  [$D 8$], [1.760],
)

(f)
#table(
  columns: 3,
  inset: 5pt,
  align: (left, center, center),
  table.header([*Kombination (L & R)*], [*LED 1 (L)* ], [*LED 2 (R)*]),
  [$D 8 "& "D 9$], [Bright], [Bright],
  [$D 8 "& " D 10$], [Bright], [Not so bright],
  [$D 8 "& " D 11$], [Bright], [Off],
  [$D 9 "& " D 11$], [A little less bright], [Off],
  [$D 10 "& " D 11$], [Dim], [Off],
)

(g)
=== Conclusion

= 1.4. Temperatur dependence

== 1.4.1. Simulation

=== Circuit Diagrams
=== Plots
#include "1.4.plot_sim.typ"
=== Conclusion

== 1.4.2. Measurement

=== Circuit Diagrams

#figure(caption: [Schematic of the _bridge_ circuit])[
  #image("assets/1.4.2.circuit.jpg", width: 35%)
]

=== Plots
#include "1.4.plot_real.typ"

=== Text Questions

=== Conclusion

= 1.5. Rectifier

== 1.5.1. Simulation

=== Circuit Diagrams


=== Plots
#include "1.5.plot_sim.typ"

=== Text Questions
=== Conclusion

== 1.5.2. Measurement

=== Circuit Diagrams
#figure(caption: [Schematic of the _rectifier_ circuit])[
  #image("assets/1.5.2.circuit.jpg", width: 70%)
]
=== Plots

#include "1.5.plot_real.typ"

=== Text Questions
=== Conclusion
