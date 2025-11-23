#import "@preview/lilaq:0.5.0" as lq

#let (t0, vi, i) = lq.load-txt(read("assets/1N4148Diode_Temperatur_sim.txt"), delimiter: "\t", skip-rows: 1)

#let t0 = v1.map(v => (v - 0.000) * 1000 - 10)

#show: lq.theme.skyline

#show: lq.set-grid(
  stroke: black.transparentize(50%) + 0.25pt,
  stroke-sub: 0.1pt,
  sub: true,
)

#figure(caption: "Full-wave rectifier output")[
  #lq.diagram(
    width: 100%,
    height: 30%,
    // title: [],
    xlabel: [*time* [ms]],
    ylabel: [*Outpul Voltage* [V]],
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
    ),


    lq.plot(t0, v1, mark: ".", label: [No $C_L$], mark-size: 0pt),
  )
]
