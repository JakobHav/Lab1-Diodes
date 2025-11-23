#import "@preview/lilaq:0.5.0" as lq

#let (t1, v1) = lq.load-txt(read("assets/151_noCL.txt"), delimiter: "\t", skip-rows: 1)
#let (t2, v2) = lq.load-txt(read("assets/151_2.2.txt"), delimiter: "\t", skip-rows: 1)
#let (t3, v3) = lq.load-txt(read("assets/151_22.txt"), delimiter: "\t", skip-rows: 1)
#let (t4, v4) = lq.load-txt(read("assets/151_220.txt"), delimiter: "\t", skip-rows: 1)
#let (t5, v5) = lq.load-txt(read("assets/151_c1.txt"), delimiter: "\t", skip-rows: 1)

#let t1 = t1.map(v => (v - 0.000) * 1000 - 10)
#let t2 = t2.map(v => (v - 0.000) * 1000 - 10)
#let t3 = t3.map(v => (v - 0.000) * 1000 - 10)
#let t4 = t4.map(v => (v - 0.000) * 1000 - 10)
#let t5 = t5.map(v => (v - 0.000) * 1000 - 10)

#show: lq.theme.skyline

#show: lq.set-grid(
  stroke: black.transparentize(50%) + 0.25pt,
  stroke-sub: 0.1pt,
  sub: true,
)

#figure(caption: "Full-wave rectifier output")[
  #lq.diagram(
    width: 80%,
    height: 27%,
    // title: [],
    xlabel: [*time* [ms]],
    ylabel: [*Outpul Voltage* [V]],
    legend: (position: left + top),
    xlim: (0, 60),
    ylim: (-0.1, 4),

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


    lq.plot(t1, v1, mark: ".", label: [No $C_L$], mark-size: 0pt),
    lq.plot(t2, v2, mark: ".", label: [$2.2 mu$F], mark-size: 0pt),
    lq.plot(t3, v3, mark: ".", label: [$22 mu$F], mark-size: 0pt),
    lq.plot(t4, v4, mark: ".", label: [$220 mu$F], mark-size: 0pt),
    lq.plot(t5, v5, mark: ".", label: [$(c)$], mark-size: 0pt),
  )
] <figure9>
