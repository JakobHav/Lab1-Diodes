#import "@preview/lilaq:0.5.0" as lq

#let (t0, vr0, vi0) = lq.load-txt(read("assets/rectifier_real_onlyR.txt"), delimiter: "\t", skip-rows: 20)
#let (t1, vr1, vi1) = lq.load-txt(read("assets/rectifier_real_C1.txt"), delimiter: "\t", skip-rows: 20)
#let (t2, vr2, vi2) = lq.load-txt(read("assets/rectifier_real_C2.txt"), delimiter: "\t", skip-rows: 20)
#let (t3, vr3, vi3) = lq.load-txt(read("assets/rectifier_real_C3.txt"), delimiter: "\t", skip-rows: 20)

#let t0 = t0.map(v => (v - 0.002) * 1000 + 20)
#let t1 = t1.map(v => (v - 0.000) * 1000 + 20)
#let t2 = t2.map(v => (v + 0.0023) * 1000 + 20)
#let t3 = t3.map(v => (v + 0.0035) * 1000 + 20)


#show: lq.theme.skyline

#figure(caption: "Measured Difference in Voltage")[
  #lq.diagram(
    width: 100%,
    height: 38%,
    // title: [],
    xlabel: [*Time* [ms]],
    ylabel: [*Voltage* [V]],
    legend: (position: left + top),
    xlim: (0, 60),
    // ylim: (-0006.5, 0022.2),

    cycle: (
      it => {
        set lq.style(stroke: (paint: red.darken(20%).transparentize(20%), dash: "solid", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: blue.darken(20%), dash: "dashed", thickness: 1.5pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: green.darken(20%), dash: "dotted", thickness: 1pt))
        it
      },
      it => {
        set lq.style(stroke: (paint: purple.lighten(20%), dash: "solid", thickness: 1pt))
        it
      },
    ),


    lq.plot(t0, vr0, mark: ".", label: [Only R], mark-size: 0pt),
    lq.plot(t1, vr1, mark: ".", label: [2,2 #sym.mu F], mark-size: 0pt),
    lq.plot(t2, vr2, mark: ".", label: [22 #sym.mu F], mark-size: 0pt),
    lq.plot(t3, vr3, mark: ".", label: [220 #sym.mu F], mark-size: 0pt),
  )
] <figure4>
