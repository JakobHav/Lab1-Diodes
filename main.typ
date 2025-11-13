#import "@preview/lilaq:0.5.0" as lq

#set page(background: image("01_Diodes.jpg"))
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
  size: 12pt,
)

= 1.2 A variety of diodes

= 1.2.1 Simulation

The goal of the Simulation is to measure the characteristics of different Types of Diodes.


== Circuit Diagrams

#figure(caption: "")[
  #image("121_BAT41.jpg")
]
#let (x, y) = lq.load-txt(read("./zenerdiodedata.txt"), delimiter: "\t", skip-rows: 1)

== Plots:

#lq.diagram(
  width: 100%,
  height: 40%,
  title: [IV-Curves],
  xlabel: $x s$,
  ylabel: $y$,

  lq.plot(x, y, mark: ".", label: [ZD3V9], mark-size: 1.5pt),
)
#pagebreak()
= 1.2.2. Measurement

(a) $R_(14) = 199.1 Omega$

(b)
#table(
  columns: 3,
  inset: 5pt,
  align: horizon,
  table.header([*Diode*], [*Forward Bias*], [*Reverse Bias*]),
  [$D 1$ (1N4148)], [0.612 V], [0 V],
  [$D 2$ (BAT41)], [0.382 V], [0 V],
  [$D 3$ (ZD3V9)], [0.712 V], [0 V],
)

The results of $D 1$ and $D 2$ look fairly similar to the simulation, but all the diodes did read slightly higher voltages when measured in reality.

The Zener Diode (D3) was very different in real life, because the multimeter only operates to 1.99V in Diode Test mode, so we could not read the value for reverse bias, which was approximately $3.85 V$ in the simulation.

==
