#import "@preview/lilaq:0.5.0" as lq

#let (_, vd1, i1) = lq.load-txt(read("assets/1N4148Diode_Temp0.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd2, i2) = lq.load-txt(read("assets/1N4148Diode_Temp20.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd3, i3) = lq.load-txt(read("assets/1N4148Diode_Temp40.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd4, i4) = lq.load-txt(read("assets/1N4148Diode_Temp60.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd5, i5) = lq.load-txt(read("assets/1N4148Diode_Temp80.txt"), delimiter: "\t", skip-rows: 1)
#let (_, vd6, i6) = lq.load-txt(read("assets/1N4148Diode_Temp100.txt"), delimiter: "\t", skip-rows: 1)

#let i1 = i1.map(v => (v - 0.000) * 1000)
#let i2 = i2.map(v => (v - 0.000) * 1000)
#let i3 = i3.map(v => (v - 0.000) * 1000)
#let i4 = i4.map(v => (v - 0.000) * 1000)
#let i5 = i5.map(v => (v - 0.000) * 1000)
#let i6 = i6.map(v => (v - 0.000) * 1000)

#show: lq.theme.skyline

#figure(caption: "Diodes under different operating Temperatures")[
  #lq.diagram(
    width: 80%,
    height: 30%,
    // title: [],
    xlabel: [*Voltage Drop* [V]],
    ylabel: [*Current* [mA]],
    legend: (position: left + top),
    // xlim: (0, 60),
    // ylim: (-0.1, 4),

    cycle: (
      it => {
        set lq.style(stroke: (paint: blue.darken(20%).transparentize(0%), dash: "solid", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(-5%), dash: "dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: purple.darken(0%), dash: "dotted", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: red.lighten(10%), dash: "densely-dotted", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: yellow.lighten(10%), dash: "densely-dotted", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: orange.darken(10%), dash: "densely-dotted", thickness: 1pt))
        it
      },
    ),


    lq.plot(vd1, i1, mark: ".", label: [0° C], mark-size: 0pt),
    lq.plot(vd2, i2, mark: ".", label: [20° C], mark-size: 0pt),
    lq.plot(vd3, i3, mark: ".", label: [40° C], mark-size: 0pt),
    lq.plot(vd4, i4, mark: ".", label: [60° C], mark-size: 0pt),
    lq.plot(vd5, i5, mark: ".", label: [80° C], mark-size: 0pt),
    lq.plot(vd6, i6, mark: ".", label: [100° C], mark-size: 0pt),
  )
]
