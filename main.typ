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
  number-align: right,
  left_header: [Jakob Haverkamp \ Milan Fark \ jh1444, #h(5pt)mf643],
)
#counter(page).update(1)
#set text(
  lang: "en",
  size: 11pt,
)


= 1.2.1 Simulation

The goal of the Simulation is to measure and plot the characteristics of different Types of Diodes, in this case one Si Diode (Model: 1N4148), one Schottky Diode (Model: BAT41) and one Zener Diode (Model: ZD3V9).


== Circuit Diagrams:
#v(-5pt)

#figure(caption: "Circuit Diagrams from LTSpice")[
  #image("121_BAT41.jpg")
  #v(-10pt)
]
#v(25pt)
#let (x_si, y_si) = lq.load-txt(read("./zenerdiodedata.txt"), delimiter: "\t", skip-rows: 1)
#let (x_st, y_st) = lq.load-txt(read("./BAT41schotkydiode.txt"), delimiter: "\t", skip-rows: 1)
#let (x_z, y_z) = lq.load-txt(read("./1N4148Diodedata.txt"), delimiter: "\t", skip-rows: 1)

#let y_si = y_si.map(y => y * 1000)
#let y_st = y_st.map(y => y * 1000)
#let y_z = y_z.map(y => y * 1000)

== Plots:
#show: lq.theme.skyline

#figure(caption: "")[
  #lq.diagram(
    width: 100%,
    height: 38%,
    title: [IV-Curves of all three Diodes],
    xlabel: [*$V_i$* [V]],
    ylabel: [*$V_D$* [mV]],
    legend: (position: left + top),
    xlim: (-5.2, 5.2),
    ylim: (-0006.5, 0022.2),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(20%).transparentize(20%), dash: "solid", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
    ),


    lq.plot(x_st, y_st, mark: ".", label: [BAT41 #h(1pt) (Schottky Diode)], mark-size: 0pt),
    lq.plot(x_si, y_si, mark: ".", label: [1N4148 (Si Diode)], mark-size: 0pt),
    lq.plot(x_z, y_z, mark: ".", label: [ZD3V9 (Zener Diode)], mark-size: 0pt),
  ),
]

#pagebreak()
= 1.2.2. Measurement

(a) $R_(14) = 199.1 Omega$

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

==

= 1.3.3

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

